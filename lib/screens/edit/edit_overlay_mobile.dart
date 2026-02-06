import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stitchin_time/models/canvas_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';
import 'package:stitchin_time/widgets/app_bar.dart';
import 'package:stitchin_time/widgets/reference_view.dart';
import 'package:stitchin_time/widgets/settings_widget.dart';
import 'package:stitchin_time/widgets/toolbar_widget.dart';

class EditOverlayMobile extends HookConsumerWidget {
  final bool isWide;
  const EditOverlayMobile({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ToolType activeTool = ref.watch(toolProvider).activeTool;
    CanvasModel canvasModel = ref.watch(canvasProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: isWide ? CrossAxisAlignment.end : CrossAxisAlignment.center,
            spacing: 15,
            children: [
              CustomAppBar(isWide: isWide),
              if (activeTool == ToolType.reference) ReferenceView(),
              if (canvasModel.showSettings) SettingsWidget(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ToolbarWidget(isWide: isWide),
          ),
        ],
      ),
    );
  }
}
