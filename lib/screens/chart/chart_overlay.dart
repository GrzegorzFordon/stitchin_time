import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'package:stitchin_time/screens/chart/chart_toolbar.dart';
import 'package:stitchin_time/widgets/app_bar.dart';
import 'package:stitchin_time/widgets/settings_widget.dart';

class ChartOverlay extends ConsumerWidget {
  final bool isWide;
  const ChartOverlay({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewModel viewModel = ref.watch(viewProvider);

    return Padding(
      padding: const EdgeInsetsGeometry.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 15,
              crossAxisAlignment: isWide ? CrossAxisAlignment.end : CrossAxisAlignment.center,
              children: [
                CustomAppBar(isWide: isWide),
                if (viewModel.showSettings) SettingsWidget(),
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: ChartToolbar()),
        ],
      ),
    );
  }
}
