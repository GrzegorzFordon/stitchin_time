import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stitchin_time/models/tool_info_model.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/history_model.dart';
import 'package:stitchin_time/models/palette_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/history_provider.dart';
import 'package:stitchin_time/providers/palette_provider.dart';
import 'package:stitchin_time/providers/pattern_provider.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';
import 'package:stitchin_time/widgets/base_button.dart';

class ToolbarWidget extends ConsumerWidget {
  final bool isWide;
  const ToolbarWidget({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var axisPrimary = isWide ? Axis.horizontal : Axis.vertical;
    var axisSecondary = isWide ? Axis.vertical : Axis.horizontal;

    return Flex(
      mainAxisAlignment: isWide ? MainAxisAlignment.start : MainAxisAlignment.end,
      direction: axisPrimary,
      spacing: 15,
      children: [
        if (isWide) ToolsPageView(isWide: isWide),

        Flex(
          direction: axisSecondary,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            ToolOptionsWidget(isWide: isWide),
            HistoryWidget(isWide: isWide),
          ],
        ),
        if (!isWide) ToolsPageView(isWide: isWide),
      ],
    );
  }
}

class ToolsPageView extends HookConsumerWidget {
  final bool isWide;
  const ToolsPageView({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: isWide
            ? constraints.maxHeight > 850
                  ? double.infinity
                  : 400
            : 64,
        width: isWide ? 64 : 400,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxHeight > 850
                ? ToolsPageFull(isWide: isWide)
                : ToolsPagePaginated(isWide: isWide, themeData: themeData);
          },
        ),
      ),
    );
  }
}

class ToolsPagePaginated extends HookConsumerWidget {
  final bool isWide;
  final ThemeData themeData;
  const ToolsPagePaginated({super.key, required this.isWide, required this.themeData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var pageViewHook = usePageController(initialPage: 1);
    var paged = useState(1);
    bool prevEnabled = true;
    bool nextEnabled = true;
    Curve pageCurve = Curves.fastEaseInToSlowEaseOut;
    Duration pageTurnDuration = Duration(milliseconds: 500);
    // bool isDesktop = kIsWeb;
    // if (!kIsWeb)
    //   isDesktop =
    //       (Platform.isWindows || Platform.isMacOS || Platform.isLinux) && !(Platform.isAndroid || Platform.isIOS);
    bool isInputTouch = ref.watch(lastUsedPointerDeviceKindIsTouchProvider);

    useEffect(() {
      prevEnabled = paged.value != 0;
      nextEnabled = paged.value != 2;
      return null;
    }, [paged.value]);

    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          ref.read(lastUsedPointerDeviceKindIsTouchProvider.notifier).set(event.kind);

          int step = event.scrollDelta.dy.sign.toInt();
          log("${event.scrollDelta}");
          pageViewHook.animateToPage(
            pageViewHook.page!.toInt() + step,
            duration: Duration(milliseconds: 100),
            curve: pageCurve,
          );
        }
      },
      child: Flex(
        direction: isWide ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: prevEnabled
                ? () => pageViewHook.previousPage(duration: pageTurnDuration, curve: pageCurve)
                : null,
            icon: Icon(isWide ? Icons.arrow_upward_rounded : Icons.arrow_back, size: 24),
            color: themeData.colorScheme.secondary.withAlpha(150),
            disabledColor: themeData.colorScheme.secondaryContainer.withAlpha(150),
          ),
          Expanded(
            child: PageView(
              // hitTestBehavior: HitTestBehavior.translucent,
              physics: !isInputTouch ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
              onPageChanged: (value) => paged.value = value,
              pageSnapping: true,
              controller: pageViewHook,
              scrollDirection: isWide ? Axis.vertical : Axis.horizontal,
              children: [
                ToolsSwatches(isWide: isWide),
                ToolsMain(isWide: isWide),
                ToolsSecondary(isWide: isWide),
              ],
            ),
          ),
          IconButton(
            onPressed: nextEnabled ? () => pageViewHook.nextPage(duration: pageTurnDuration, curve: pageCurve) : null,
            icon: Icon(isWide ? Icons.arrow_downward_rounded : Icons.arrow_forward, size: 24),
            color: themeData.colorScheme.secondary.withAlpha(150),
            disabledColor: themeData.colorScheme.secondaryContainer.withAlpha(150),
          ),
        ],
      ),
    );
  }
}

class ToolsPageFull extends StatelessWidget {
  final bool isWide;

  const ToolsPageFull({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Flex(
      spacing: 15,
      direction: isWide ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ToolsSwatches(isWide: isWide),
        ToolsMain(isWide: isWide),
        ToolsSecondary(isWide: isWide),
      ],
    );
  }
}

class ToolsMain extends HookConsumerWidget {
  final bool isWide;
  const ToolsMain({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToolType activeTool = ref.watch(toolProvider).activeTool;
    ThemeData themeData = ref.watch(themeProvider);
    CanvasModel canvasModel = ref.watch(canvasProvider);

    return Flex(
      direction: isWide ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        ToolButton(
          myTool: ToolType.brush,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.brush),
          iconData: Icons.brush,
          tooltipText: "Brush",
        ),
        ToolButton(
          myTool: ToolType.line,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.line),
          iconData: Icons.line_axis,
          tooltipText: "Line",
        ),
        ToolButton(
          myTool: ToolType.square,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.square),
          iconData: Icons.square_outlined,
          tooltipText: "Square",
        ),

        SizedBox(height: 5, width: 5),
        BaseButton(
          isActive: canvasModel.toolInfo.isEraserSet,
          themeData: themeData,
          tapCallback: () => ref.read(canvasProvider.notifier).toggleEraser(),
          iconData: Symbols.ink_eraser,
          tooltipText: "Eraser",
        ),
      ],
    );
  }
}

class ToolsSecondary extends ConsumerWidget {
  final bool isWide;
  const ToolsSecondary({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToolType activeTool = ref.watch(toolProvider).activeTool;
    ThemeData themeData = ref.watch(themeProvider);
    return Flex(
      direction: isWide ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 5,
      children: [
        ToolButton(
          myTool: ToolType.select,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.select),
          iconData: Icons.select_all,
          tooltipText: "Select & Edit",
        ),
        ToolButton(
          myTool: ToolType.stamp,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.stamp),
          iconData: Icons.paste,
          tooltipText: "Copy & Paste",
        ),
        ToolButton(
          myTool: ToolType.pan,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.pan),
          iconData: Icons.pan_tool,
          tooltipText: "Select & Move",
        ),
        ToolButton(
          myTool: ToolType.fill,
          activeTool: activeTool,
          themeData: themeData,
          callback: () => ref.read(toolProvider.notifier).set(ToolType.fill),
          iconData: Icons.format_paint,
          tooltipText: "Fill",
        ),
      ],
    );
  }
}

class ToolsSwatches extends ConsumerWidget {
  final bool isWide;
  const ToolsSwatches({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flex(
      direction: isWide ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 5,
      children: [Swatch(index: 0), Swatch(index: 1), Swatch(index: 2), Swatch(index: 3)],
    );
  }
}

class Swatch extends ConsumerWidget {
  final int index;
  const Swatch({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PaletteModel paletteModel = ref.watch(paletteProvider);
    ThemeData themeData = ref.watch(themeProvider);
    Color myColor = paletteModel.swatches[index].getColor();
    bool isActive = index == paletteModel.activeSwatchIndex;
    double padding = isActive ? 3.0 : 1.0;
    return GestureDetector(
      onTap: () => index == 0 ? null : ref.read(paletteProvider.notifier).setActiveIndex(index),
      onLongPress: () => _pickColor(
        context,
        myColor,
        (value) => ref.read(paletteProvider.notifier).setSwatchAtIndex(value, index),
        themeData,
      ),
      onSecondaryTap: () => _pickColor(
        context,
        myColor,
        (value) => ref.read(paletteProvider.notifier).setSwatchAtIndex(value, index),
        themeData,
      ),
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: isActive ? themeData.colorScheme.primary : themeData.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: AnimatedPadding(
          padding: EdgeInsetsGeometry.all(padding),
          duration: Duration(milliseconds: 100),
          child: Container(
            decoration: BoxDecoration(color: myColor, borderRadius: BorderRadius.circular(5)),
            child: index == 0
                ? Center(
                    child: Text(
                      "BG",
                      style: GoogleFonts.robotoMono(
                        color: themeData.colorScheme.secondaryContainer,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  void _pickColor(BuildContext context, Color color, ValueSetter callback, ThemeData themeData) => showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      contentPadding: EdgeInsetsGeometry.all(0),
      constraints: BoxConstraints(maxHeight: 260, maxWidth: 250),
      backgroundColor: themeData.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      children: [_buildColorPicker(color, callback)],
    ),
  );

  Widget _buildColorPicker(Color color, ValueSetter callback) => ColorPicker(
    pickerAreaBorderRadius: BorderRadius.circular(5),
    pickerColor: color,
    enableAlpha: false,
    displayThumbColor: true,
    labelTypes: [],
    pickerAreaHeightPercent: 0.8,
    colorPickerWidth: 250,
    paletteType: PaletteType.hsl,
    onColorChanged: callback,
    portraitOnly: true,
  );
}

class HistoryWidget extends ConsumerWidget {
  final bool isWide;
  const HistoryWidget({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    HistoryModel historyModel = ref.watch(historyProvider);
    return Flex(
      direction: isWide ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        HistoryButton(
          isActive: historyModel.undoList.length > 1,
          themeData: themeData,
          callback: ref.read(patternProvider.notifier).undo,
          iconData: Icons.undo_rounded,
        ),
        HistoryButton(
          isActive: historyModel.redoList.isNotEmpty,
          themeData: themeData,
          callback: ref.read(patternProvider.notifier).redo,
          iconData: Icons.redo_rounded,
        ),
      ],
    );
  }
}

class HistoryButton extends StatelessWidget {
  final bool isActive;
  final ThemeData themeData;
  final VoidCallback callback;
  final IconData iconData;

  const HistoryButton({
    super.key,
    required this.isActive,
    required this.themeData,
    required this.callback,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    (Color, Color) buttonTheme = isActive
        ? (themeData.colorScheme.secondaryContainer, themeData.colorScheme.onSecondaryContainer)
        : (
            themeData.colorScheme.secondaryContainer.withAlpha(100),
            themeData.colorScheme.onSecondaryContainer.withAlpha(100),
          );
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: buttonTheme.$1, borderRadius: BorderRadius.circular(5)),
      child: IconButton(
        onPressed: isActive ? callback : null,
        icon: Icon(iconData, color: buttonTheme.$2),
      ),
    );
  }
}

class ToolOptionsWidget extends ConsumerWidget {
  final bool isWide;
  const ToolOptionsWidget({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToolType activeTool = ref.watch(toolProvider).activeTool;
    ThemeData themeData = ref.watch(themeProvider);
    final List<Widget> children;
    switch (activeTool) {
      case ToolType.brush:
        children = [BrushSizeWidget()];
      case ToolType.line:
        children = [BrushSizeWidget(), LineDeltaWidget()];
      case ToolType.square:
        children = [SquareTypeButton()];

      case ToolType.select:
        children = [MirrorButton(isHorizontal: true), MirrorButton(isHorizontal: false), DeleteSelectionButton()];
      default:
        children = [];
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      curve: Curves.easeInOutCirc,
      height: isWide ? children.length * 55 : 50,
      width: isWide ? 50 : children.length * 55,
      decoration: BoxDecoration(color: themeData.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(5)),
      child: OverflowBox(
        child: Flex(
          direction: isWide ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: children,
        ),
      ),
    );
  }
}

class MirrorButton extends ConsumerWidget {
  final bool isHorizontal;

  const MirrorButton({super.key, required this.isHorizontal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.read(patternProvider.notifier).mirror(isHorizontal, !isHorizontal),
      icon: Icon(isHorizontal ? Icons.horizontal_distribute_rounded : Icons.vertical_distribute_rounded),
    );
  }
}

class DeleteSelectionButton extends ConsumerWidget {
  const DeleteSelectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.read(patternProvider.notifier).deleteSelection(),
      icon: Icon(Symbols.delete_rounded),
    );
  }
}

class SquareTypeButton extends ConsumerWidget {
  const SquareTypeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    SquareMode mode = canvasModel.toolInfo.squareMode;
    return IconButton(
      onPressed: () => ref
          .read(canvasProvider.notifier)
          .update(
            toolInfo: canvasModel.toolInfo.copyWith(
              squareMode: (SquareMode.values[(canvasModel.toolInfo.squareMode.index + 1) % SquareMode.values.length]),
            ),
          ),
      icon: Icon(_getIcon(mode)),
      color: themeData.colorScheme.onTertiaryContainer,
    );
  }

  IconData _getIcon(SquareMode mode) {
    return switch (mode) {
      SquareMode.outline => Icons.square_outlined,
      SquareMode.filled => Icons.square_rounded,
      SquareMode.checker => Symbols.transition_dissolve_rounded,
    };
  }
}

class BrushSizeWidget extends ConsumerWidget {
  const BrushSizeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    ThemeData themeData = ref.watch(themeProvider);
    int brushSize = canvasModel.toolInfo.brushSize;
    String s = brushSize == 0
        ? "S"
        : brushSize == 1
        ? "M"
        : "L";
    return IconButton(
      onPressed: () {
        int nextSize = (brushSize + 1) % 3;
        ref.read(canvasProvider.notifier).update(toolInfo: canvasModel.toolInfo.copyWith(brushSize: nextSize));
      },
      icon: Text(
        s,
        style: GoogleFonts.chewy(fontSize: 32, color: themeData.colorScheme.onTertiaryContainer, height: 1),
      ),
    );
  }
}

class LineDeltaWidget extends ConsumerWidget {
  const LineDeltaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CanvasModel canvasModel = ref.watch(canvasProvider);
    LineMode mode = canvasModel.toolInfo.lineMode;
    ThemeData themeData = ref.watch(themeProvider);

    return IconButton(
      onPressed: () => ref
          .read(canvasProvider.notifier)
          .update(
            toolInfo: canvasModel.toolInfo.copyWith(
              lineMode: LineMode.values[(canvasModel.toolInfo.lineMode.index + 1) % LineMode.values.length],
            ),
          ),
      icon: Icon(_getIcon(mode), color: themeData.colorScheme.onTertiaryContainer),
    );
  }

  IconData _getIcon(LineMode mode) {
    return switch (mode) {
      LineMode.simple => Symbols.horizontal_rule_rounded,
      LineMode.dotted => Symbols.more_horiz_rounded,
    };
  }
}

class ToolButton extends HookWidget {
  final ToolType myTool;
  final ToolType activeTool;
  final ThemeData themeData;
  final VoidCallback callback;
  final IconData iconData;
  final String tooltipText;

  const ToolButton({
    super.key,
    required this.myTool,
    required this.activeTool,
    required this.themeData,
    required this.callback,
    required this.iconData,
    required this.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = myTool == activeTool;
    (Color, Color) buttonTheme = isActive
        ? (themeData.colorScheme.primary, themeData.colorScheme.onPrimary)
        : (themeData.colorScheme.secondaryContainer, themeData.colorScheme.onSecondaryContainer);
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          width: 64,
          height: 64,
          decoration: BoxDecoration(color: buttonTheme.$1, borderRadius: BorderRadius.circular(5)),
          child: GestureDetector(
            onLongPress: () {
              callback();
            },
            child: IconButton(
              tooltip: tooltipText,
              style: ButtonStyle(),
              onPressed: callback,
              icon: Icon(iconData, color: buttonTheme.$2),
            ),
          ),
        ),
      ),
    );
  }
}
