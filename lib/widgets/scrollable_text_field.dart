import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';

class ScrollableTextField extends HookConsumerWidget {
  final IconData iconData;
  final String tooltip;
  final String text;
  final ValueSetter textFieldCallback;
  final ValueSetter<int> scrollCallback;

  final int minVal;
  final int maxVal;
  final int initialVal;

  const ScrollableTextField({
    super.key,
    required this.iconData,
    this.tooltip = "",
    this.text = "",
    required this.textFieldCallback,
    required this.scrollCallback,
    this.minVal = 0,
    this.maxVal = 10,
    this.initialVal = 0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    var scrollController = useFixedExtentScrollController(initialItem: initialVal - minVal);

    // bool isDesktop = kIsWeb;
    // if (!kIsWeb)
    //   isDesktop =
    //       (Platform.isWindows || Platform.isMacOS || Platform.isLinux) && (!Platform.isAndroid || !Platform.isIOS);
    bool isInputTouch = ref.watch(lastUsedPointerDeviceKindIsTouchProvider);

    ScrollPhysics physics = !isInputTouch ? NeverScrollableScrollPhysics() : FixedExtentScrollPhysics();

    return SizedBox(
      height: 50,
      width: 75,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);
            var step = event.scrollDelta.dy.sign.toInt();
            step *= HardwareKeyboard.instance.isShiftPressed ? 2 : 1;
            scrollController.jumpToItem(scrollController.selectedItem + step);
          }
        },
        child: ListWheelScrollView(
          physics: physics,
          controller: scrollController,
          itemExtent: 20,
          changeReportingBehavior: ChangeReportingBehavior.onScrollEnd,
          diameterRatio: 0.7,
          onSelectedItemChanged: (value) => scrollCallback(value + minVal),
          children: List.generate(maxVal - minVal + 1, (index) {
            return ListEntry(
              scrollController: scrollController,
              minVal: minVal,
              scrollCallback: scrollCallback,
              themeData: themeData,
              index: index,
            );
          }),
        ),
      ),
    );
  }
}

class ListEntry extends StatelessWidget {
  const ListEntry({
    super.key,
    required this.scrollController,
    required this.minVal,
    required this.scrollCallback,
    required this.themeData,
    required this.index,
  });

  final FixedExtentScrollController scrollController;
  final int minVal;
  final ValueSetter<int> scrollCallback;
  final ThemeData themeData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: scrollController.positions.isEmpty || index == scrollController.selectedItem
          ? TextField(
              controller: TextEditingController(text: (index + minVal).toString()),
              decoration: null,
              keyboardType: TextInputType.number,
              onSubmitted: (value) {
                int? val = int.tryParse(value);
                if (val == null) {
                  scrollController.jumpToItem(scrollController.selectedItem);
                  return;
                }
                scrollCallback(val);
                scrollController.jumpToItem(val - minVal);
              },
              style: GoogleFonts.robotoMono(fontSize: 24, color: themeData.colorScheme.primary, height: 1),
              textAlign: TextAlign.center,
              maxLines: 1,
            )
          : Text(
              (index + minVal).toString(),
              style: GoogleFonts.robotoMono(fontSize: 24, color: themeData.colorScheme.primary, height: 1),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
    );
  }
}
