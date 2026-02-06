import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stitchin_time/models/reference_model.dart';
import 'package:stitchin_time/models/references_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/references_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';

class ReferenceView extends ConsumerWidget {
  const ReferenceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isDesktop = kIsWeb;
    // if (!kIsWeb) isDesktop = (Platform.isWindows || Platform.isMacOS || Platform.isLinux)&&!(Platform.isAndroid||Platform.isIOS);
    bool isInputTouch = ref.watch(lastUsedPointerDeviceKindIsTouchProvider);

    ThemeData themeData = ref.watch(themeProvider);
    ReferencesModel referencesModel = ref.watch(referencesProvider);
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 425,
      height: 100,
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          ReferencePageView(isDesktop: !isInputTouch),
          if (!isInputTouch && referencesModel.references.isNotEmpty)
            Align(alignment: Alignment.bottomRight, child: ReferenceOptions()),
        ],
      ),
    );
  }
}

class ReferencePageView extends HookConsumerWidget {
  final bool isDesktop;
  const ReferencePageView({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageController = usePageController();
    ReferencesModel referencesModel = ref.watch(referencesProvider);
    ThemeData themeData = ref.watch(themeProvider);

    ref.listen(referencesProvider, (previous, next) => pageController.jumpToPage(next.activeIndex));

    List<Widget> children = referencesModel.references.isNotEmpty
        ? List.generate(referencesModel.references.length, (index) => ReferenceCard(index: index))
        : [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Long Press Icon to add References",
                  style: GoogleFonts.robotoMono(
                    fontSize: 24,
                    color: themeData.colorScheme.onSecondaryContainer,
                    letterSpacing: 5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ];

    return Listener(
      onPointerSignal: (event) {
        ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);

        if (event is PointerScrollEvent) {
          int step = event.scrollDelta.dy.sign.toInt();
          pageController.animateToPage(
            pageController.page!.toInt() + step,
            duration: Duration(milliseconds: 100),
            curve: Curves.fastEaseInToSlowEaseOut,
          );
        }
      },
      child: PageView(
        scrollDirection: Axis.vertical,
        physics: isDesktop ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
        pageSnapping: true,
        controller: pageController,
        onPageChanged: (value) => ref.read(referencesProvider.notifier).setActiveIndex(value),
        children: children,
      ),
    );
  }
}

class ReferenceCard extends HookConsumerWidget {
  final int index;
  const ReferenceCard({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showOpacity = useState(false);
    ReferencesModel referencesModel = ref.read(referencesProvider);
    ReferenceModel myReference = referencesModel.references[index];
    // bool isActive = index == referencesModel.activeIndex;
    if (myReference.bytes == null) {
      ref.read(referencesProvider.notifier).cacheImageData(myReference, index);
      return SizedBox();
    }
    // var imgBytes = ref.read(fetchImageBytesProvider(index));
    var myImg = Image.memory(myReference.bytes!, fit: BoxFit.cover);
    // var myImg = Image.memory(imgBytes, fit: BoxFit.cover);
    return GestureDetector(
      onLongPress: () => ref.read(referencesProvider.notifier).removeReference(index),
      onHorizontalDragStart: (details) => showOpacity.value = true,
      onHorizontalDragUpdate: (details) =>
          ref.read(referencesProvider.notifier).setOpacityReferenceDelta(index, details.primaryDelta!),
      onHorizontalDragEnd: (details) => showOpacity.value = false,
      onHorizontalDragCancel: () => showOpacity.value = false,

      child: SizedBox(
        width: 400,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(child: myImg),
            showOpacity.value
                ? Center(
                    child: Text(
                      NumberFormat("0.00").format(myReference.opacity),
                      style: GoogleFonts.robotoMono(fontSize: 48, fontWeight: FontWeight.w700),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ReferenceOptions extends ConsumerWidget {
  const ReferenceOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    ToolModel toolModel = ref.watch(toolProvider);
    ReferenceType activeReferenceType = toolModel.activeReferenceTool;
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: themeData.colorScheme.tertiaryContainer.withAlpha(200),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            isSelected: activeReferenceType == ReferenceType.move,
            tooltip: "Move",
            onPressed: () => ref.read(toolProvider.notifier).setReference(ReferenceType.move),
            icon: Icon(
              Icons.pan_tool_alt_rounded,
              color: activeReferenceType == ReferenceType.move
                  ? themeData.colorScheme.onTertiaryContainer
                  : themeData.colorScheme.onTertiary,
            ),
          ),
          IconButton(
            isSelected: activeReferenceType == ReferenceType.rotate,
            tooltip: "Rotate",
            onPressed: () => ref.read(toolProvider.notifier).setReference(ReferenceType.rotate),
            icon: Icon(
              Icons.rotate_left_rounded,
              color: activeReferenceType == ReferenceType.rotate
                  ? themeData.colorScheme.onTertiaryContainer
                  : themeData.colorScheme.onTertiary,
            ),
          ),
          IconButton(
            isSelected: activeReferenceType == ReferenceType.scale,
            tooltip: "Scale",
            onPressed: () => ref.read(toolProvider.notifier).setReference(ReferenceType.scale),
            icon: Icon(
              Icons.linear_scale_rounded,
              color: activeReferenceType == ReferenceType.scale
                  ? themeData.colorScheme.onTertiaryContainer
                  : themeData.colorScheme.onTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
