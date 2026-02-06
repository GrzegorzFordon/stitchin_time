import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stitchin_time/providers/platform_provider.dart';
import 'package:stitchin_time/widgets/file_drop_widget.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/screens/chart/chart_screen.dart';
import 'package:stitchin_time/screens/home/home_screen.dart';
import 'package:stitchin_time/screens/edit/edit_screen.dart';
import 'package:stitchin_time/widgets/input_kind_listener_widget.dart';

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppStateType appState = ref.watch(appStateProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Stack(
      children: [
        FileDropWidget(),
        Image.asset(
          "assets/bg_vert.jpg",
          fit: BoxFit.none,
          opacity: AlwaysStoppedAnimation(0.03),
          color: themeData.colorScheme.onSecondaryFixed.withAlpha(150),
          colorBlendMode: BlendMode.softLight,
          scale: 1.25,
          repeat: ImageRepeat.repeat,
          height: double.infinity,
          width: double.infinity,
          cacheWidth: 524,
        ),
        SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 600;
              return Padding(
                padding: EdgeInsetsGeometry.all(8.0),
                child: switch (appState) {
                  .home => HomeScreen(isWide: isWide),
                  .edit => EditScreen(isWide: isWide),
                  .chart => ChartScreen(isWide: isWide),
                },
              );
            },
          ),
        ),
        // InputKindListenerWidget(),
        // Center(child: Text(ref.watch(lastUsedPointerDeviceKindIsTouchProvider).toString())),
      ],
    );
  }
}
