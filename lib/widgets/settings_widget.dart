import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/grid_info_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'package:stitchin_time/widgets/scrollable_text_field.dart';

class SettingsWidget extends ConsumerWidget {
  const SettingsWidget({super.key});

  final List<Widget> editScreenChildren = const <Widget>[
    SymmetriesWidget(),
    OverpaintWidget(),
    GridSizeWidget(),
    MiscSettings(),
  ];

  final List<Widget> chartScreenChildren = const <Widget>[
    RowButton(isNext: false),
    RowButton(isNext: true),
    ResetColButton(),
    MaxBlockSizeWidget(),
    RepeatAmountWidget(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    AppStateType appState = ref.watch(appStateProvider);
    List<Widget> children = appState == AppStateType.edit ? editScreenChildren : chartScreenChildren;

    return Container(
      width: 425,
      height: 100,
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class SymmetriesWidget extends ConsumerWidget {
  const SymmetriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    ref.read(canvasProvider.notifier).update(symmetryHorizontal: !canvasModel.symmetryHorizontal),
                icon: Icon(
                  Icons.horizontal_distribute,
                  color: canvasModel.symmetryHorizontal
                      ? themeData.colorScheme.onSecondaryContainer
                      : themeData.colorScheme.onSecondaryFixed,
                ),
                tooltip: "Horizontal Symmetry",
              ),
              IconButton(
                onPressed: () =>
                    ref.read(canvasProvider.notifier).update(symmetryVertical: !canvasModel.symmetryVertical),
                icon: Icon(
                  Icons.vertical_distribute,
                  color: canvasModel.symmetryVertical
                      ? themeData.colorScheme.onSecondaryContainer
                      : themeData.colorScheme.onSecondaryFixed,
                ),
                tooltip: "Vertical Symmetry",
              ),
            ],
          ),
        ),
        Text("Symmetries", style: GoogleFonts.robotoMono(color: themeData.colorScheme.onSecondaryContainer)),
      ],
    );
  }
}

class MiscSettings extends HookConsumerWidget {
  const MiscSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            GridInfoModel newModel = canvasModel.gridInfo.copyWith(
              isChangedAtEnd: !canvasModel.gridInfo.isChangedAtEnd,
            );
            ref.read(canvasProvider.notifier).update(gridInfo: newModel);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Grid changes will affect ${newModel.isChangedAtEnd ? "Right/Bottom" : "Left/Top"} side.",
                  style: GoogleFonts.robotoMono(color: themeData.colorScheme.onTertiaryContainer),
                ),
                backgroundColor: themeData.colorScheme.tertiaryContainer,
                behavior: SnackBarBehavior.floating,
                duration: Duration(milliseconds: 2000),
              ),
            );
          },
          icon: Transform.rotate(
            angle: canvasModel.gridInfo.isChangedAtEnd ? pi : 0,
            child: Icon(Icons.border_style_rounded, color: themeData.colorScheme.onSecondaryContainer),
          ),
        ),
        CellRatioWidget(),
      ],
    );
  }
}

class CellRatioWidget extends ConsumerWidget {
  const CellRatioWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    CellWidthType cellWidthType = canvasModel.gridInfo.cellWidthType;
    CellWidthType newType = CellWidthType.values[(cellWidthType.index + 1) % CellWidthType.values.length];
    return IconButton(
      onPressed: () =>
          ref.read(canvasProvider.notifier).update(gridInfo: canvasModel.gridInfo.copyWith(cellWidthType: newType)),
      icon: Icon(_getIcon(cellWidthType), color: themeData.colorScheme.onSecondaryContainer),
    );
  }

  IconData _getIcon(CellWidthType type) => switch (type) {
    CellWidthType.square => Icons.square_rounded,
    CellWidthType.tall => Symbols.fullscreen_portrait_rounded,
    CellWidthType.wide => Symbols.capture_rounded,
  };
}

class GridSizeWidget extends HookConsumerWidget {
  const GridSizeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            SizedBox(
              width: 60,
              child: ScrollableTextField(
                iconData: Symbols.height_rounded,
                text: (canvasModel.gridInfo.rows).toString(),
                minVal: 1,
                maxVal: 150,
                initialVal: canvasModel.gridInfo.rows,
                textFieldCallback: (value) => ref
                    .read(canvasProvider.notifier)
                    .setSize(isRow: true, amount: int.tryParse(value) ?? canvasModel.gridInfo.rows),
                scrollCallback: (value) => ref.read(canvasProvider.notifier).setSize(isRow: true, amount: value),
              ),
            ),

            SizedBox(
              width: 60,
              child: ScrollableTextField(
                iconData: Symbols.arrow_range_rounded,
                text: canvasModel.gridInfo.columns.toString(),
                minVal: 1,
                maxVal: 150,
                initialVal: canvasModel.gridInfo.columns,
                textFieldCallback: (value) => ref
                    .read(canvasProvider.notifier)
                    .setSize(isRow: false, amount: int.tryParse(value) ?? canvasModel.gridInfo.rows),
                scrollCallback: (value) => ref.read(canvasProvider.notifier).setSize(isRow: false, amount: value),
              ),
            ),
          ],
        ),
        Text("Grid Size", style: GoogleFonts.robotoMono(color: themeData.colorScheme.onSecondaryContainer)),
      ],
    );
  }
}

class MaxBlockSizeWidget extends ConsumerWidget {
  const MaxBlockSizeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewModel viewModel = ref.watch(viewProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScrollableTextField(
          iconData: Symbols.arrow_range_rounded,
          text: viewModel.maxBlockLength.toString(),
          initialVal: viewModel.maxBlockLength,
          minVal: 1,
          maxVal: 20,
          textFieldCallback: (value) {},
          scrollCallback: (value) => ref.read(viewProvider.notifier).update(maxBlockLength: value),
        ),
        Text(
          "Block Size",
          style: GoogleFonts.robotoMono(fontSize: 14, color: themeData.colorScheme.onSecondaryContainer),
        ),
      ],
    );
  }
}

class OverpaintWidget extends HookConsumerWidget {
  const OverpaintWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ScrollableTextField(
          iconData: Icons.border_all,
          tooltip: "Overpaint amount",
          text: canvasModel.overpaintAmount.toString(),
          minVal: 0,
          maxVal: 20,
          initialVal: canvasModel.overpaintAmount,
          textFieldCallback: (value) => ref.read(canvasProvider.notifier).update(overpaintAmount: int.parse(value)),
          scrollCallback: (value) => ref.read(canvasProvider.notifier).update(overpaintAmount: value),
        ),
        Text("Overpaint", style: GoogleFonts.robotoMono(color: themeData.colorScheme.onSecondaryContainer)),
      ],
    );
  }
}

class RowButton extends ConsumerWidget {
  final bool isNext;
  const RowButton({super.key, required this.isNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: IconButton(
            onPressed: () => ref.read(viewProvider.notifier).stepRow(isNext ? 1 : -1),
            icon: Icon(
              isNext ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
              color: themeData.colorScheme.onSecondaryContainer,
            ),
          ),
        ),
        Text(
          isNext ? "Next" : "Prev",
          style: GoogleFonts.robotoMono(color: themeData.colorScheme.onSecondaryContainer),
        ),
      ],
    );
  }
}

class ResetColButton extends ConsumerWidget {
  const ResetColButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: IconButton(
            onPressed: () => ref.read(viewProvider.notifier).resetCol(),
            icon: Icon(Symbols.redo_rounded, color: themeData.colorScheme.onSecondaryContainer),
          ),
        ),
        Text("Restart", style: GoogleFonts.robotoMono(color: themeData.colorScheme.onSecondaryContainer)),
      ],
    );
  }
}

class RepeatAmountWidget extends ConsumerWidget {
  const RepeatAmountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewModel viewModel = ref.watch(viewProvider);
    ThemeData themeData = ref.watch(themeProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScrollableTextField(
          iconData: Symbols.repeat_rounded,
          text: viewModel.rowRepeats.toString(),
          initialVal: viewModel.rowRepeats,
          minVal: 1,
          maxVal: 10,
          textFieldCallback: (value) {},
          scrollCallback: (value) => ref.read(viewProvider.notifier).update(rowRepeats: value),
        ),
        Text(
          "Row Repeats",
          style: GoogleFonts.robotoMono(fontSize: 14, color: themeData.colorScheme.onSecondaryContainer),
        ),
      ],
    );
  }
}
