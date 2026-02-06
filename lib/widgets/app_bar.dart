import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/tool_model.dart';
import 'package:stitchin_time/providers/app_state_provider.dart';
import 'package:stitchin_time/providers/canvas_provider.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/references_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/tool_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';
import 'package:stitchin_time/providers/view_provider.dart';
import 'package:stitchin_time/widgets/base_button.dart';

class CustomAppBar extends ConsumerWidget {
  final bool isWide;
  const CustomAppBar({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    AppStateType appState = ref.watch(appStateProvider);
    ProjectModel projectModel = ref.watch(projectProvider);
    TextStyle textStyle = GoogleFonts.chewy(fontSize: 32, color: themeData.colorScheme.onPrimaryContainer, height: 1);

    return Row(
      mainAxisAlignment: isWide ? MainAxisAlignment.end : MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        BaseButton(
          isActive: false,
          themeData: themeData,
          tapCallback: () => ref.read(appStateProvider.notifier).set(AppStateType.home),
          iconData: Icons.home,
          size: 48,
        ),
        if (!isWide)
          Flexible(
            child: TextField(
              controller: TextEditingController(text: projectModel.title),
              decoration: null,
              style: textStyle,
              textAlign: TextAlign.center,
              maxLines: 1,
              onSubmitted: (value) {
                ref.read(projectProvider.notifier).updateProject(title: value);
                ref.read(userProvider.notifier).save();
              },
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 10,
          children: [
            appState == AppStateType.edit
                ? BaseButton(
                    isActive: ref.read(toolProvider).activeTool == ToolType.reference,
                    themeData: themeData,
                    tapCallback: () => ref.read(toolProvider.notifier).set(ToolType.reference),
                    longPressCallback: () => ref.read(referencesProvider.notifier).openFilePicker(),
                    iconData: Icons.photo,
                    size: 48,
                  )
                : SizedBox(width: 48),
            if (appState == AppStateType.edit)
              BaseButton(
                isActive: ref.read(canvasProvider).showSettings,
                themeData: themeData,
                tapCallback: () => ref.read(canvasProvider.notifier).toggleSettings(),
                tapOnLongPress: false,
                iconData: Icons.settings,
                size: 48,
              )
            else if (appState == AppStateType.chart)
              BaseButton(
                isActive: ref.read(viewProvider).showSettings,
                themeData: themeData,
                tapCallback: () => ref.read(viewProvider.notifier).toggleSettings(),
                tapOnLongPress: false,
                iconData: Icons.settings,
                size: 48,
              )
            else
              SizedBox(width: 48),
            ViewToggleButton(),
          ],
        ),
      ],
    );
  }
}

class ViewToggleButton extends ConsumerWidget {
  const ViewToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    AppStateType appState = ref.watch(appStateProvider);
    IconData iconData = appState == AppStateType.edit ? Icons.view_agenda : Icons.edit;
    return BaseButton(
      isActive: false,
      themeData: themeData,
      tapCallback: () => ref
          .read(appStateProvider.notifier)
          .set(appState == AppStateType.edit ? AppStateType.chart : AppStateType.edit),
      iconData: iconData,
      size: 48,
    );
  }
}
