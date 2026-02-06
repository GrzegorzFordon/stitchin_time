import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stitchin_time/models/grid_selection_model.dart';
import 'package:stitchin_time/models/view_model.dart';
import 'package:stitchin_time/providers/chart_block_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';

class ChartToolbar extends ConsumerWidget {
  const ChartToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 425,
      height: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        spacing: 15,
        children: [CurrentRowInfo(), AdvanceButton(), RepeatInfo()],
      ),
    );
  }
}

class CurrentRowInfo extends ConsumerWidget {
  const CurrentRowInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewModel viewModel = ref.watch(viewProvider);
    ThemeData themeData = ref.watch(themeProvider);
    GridSelectionModel chartBlock = ref.watch(chartBlockProvider);
    int activeRange = chartBlock.endPixel.column - chartBlock.startPixel.column;

    String s = "Row: ${viewModel.activeRow + 1}\n${viewModel.activeCol + 1} - ${viewModel.activeCol + 1 + activeRange}";
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      width: 100,
      height: 50,
      child: Center(
        child: Text(
          s,
          style: GoogleFonts.robotoMono(fontSize: 16, color: themeData.colorScheme.onSecondaryContainer),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class RepeatInfo extends ConsumerWidget {
  const RepeatInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ViewModel viewModel = ref.watch(viewProvider);
    ThemeData themeData = ref.watch(themeProvider);

    String s = "${viewModel.currentRepeat} / ${viewModel.rowRepeats}\nRepeat";
    return Container(
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: themeData.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      width: 100,
      height: 50,
      child: Center(
        child: Text(
          s,
          style: GoogleFonts.robotoMono(fontSize: 16, color: themeData.colorScheme.onSecondaryContainer),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AdvanceButton extends ConsumerWidget {
  const AdvanceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Container(
      height: 100,
      width: 170,
      decoration: BoxDecoration(color: themeData.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(5)),
      child: InkResponse(
        containedInkWell: false,

        onTap: () => ref.read(chartBlockProvider.notifier).advance(),
        child: Center(
          child: Text("Next", style: GoogleFonts.chewy(fontSize: 60, color: themeData.colorScheme.onTertiaryContainer)),
        ),
      ),
    );
  }
}
