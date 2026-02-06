import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:stitchin_time/providers/references_provider.dart';
import 'package:stitchin_time/screens/home/overview.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/models/user_model.dart';
import 'package:stitchin_time/providers/project_provider.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';
import 'package:path/path.dart' as p;

class HomeScreen extends ConsumerWidget {
  final bool isWide;
  const HomeScreen({super.key, required this.isWide});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<UserModel> userModel = ref.watch(userProvider);
    ThemeData themeData = ref.watch(themeProvider);
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                "Stitchin' Time",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: GoogleFonts.chewy(fontSize: 72, color: themeData.colorScheme.primary.withAlpha(150)),
              ),
              Expanded(
                child: Container(
                  height: 600,
                  width: 800,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.surfaceContainer,
                    color: themeData.colorScheme.onSecondary.withAlpha(255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      // Center(child: Image.asset("assets/icon/icon_foreground.png",color: Colors.black.withAlpha(50),scale: 2,)),
                      Center(child: Icon(Symbols.gesture_rounded, color: Colors.black.withAlpha(20), size: 480)),
                      userModel.when(
                        data: (data) {
                          return SavedProjectsWidget(projects: data.projects.values.toList());
                        },
                        error: (error, stackTrace) =>
                            Column(children: [Text(error.toString()), Divider(), Text(stackTrace.toString())]),
                        loading: () => Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ],
    );
  }
}

class SavedProjectsWidget extends ConsumerWidget {
  final List<ProjectModel> projects;
  const SavedProjectsWidget({super.key, required this.projects});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeData.colorScheme.onSecondaryFixed.withAlpha(150),
        borderRadius: BorderRadius.circular(5),
      ),

      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(childAspectRatio: 1, maxCrossAxisExtent: 250),
        itemCount: projects.length + 2,
        // itemCount: projects.length + 1,
        itemBuilder: (context, index) {
          return index == projects.length + 1
              ? UploadCard()
              : index == projects.length
              ? NewProjectCard()
              : ProjectCard(projectModel: projects[index]);
          // return index == projects.length ? NewProjectCard() : ProjectCard(projectModel: projects[index]);
        },
      ),
    );
  }
}

class DeleteProjectButton extends ConsumerWidget {
  final ProjectModel projectModel;

  const DeleteProjectButton({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);
    return Tooltip(
      message: "Delete",
      child: IconButton(
        onPressed: () => _showDialog(context, themeData.colorScheme, ref),
        icon: Icon(Icons.delete, color: themeData.colorScheme.secondary),
      ),
    );
  }

  void _showDialog(BuildContext context, ColorScheme colorScheme, WidgetRef ref) {
    SimpleDialog simpleDialog = SimpleDialog(
      alignment: Alignment.center,
      contentPadding: EdgeInsetsGeometry.all(0),
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: colorScheme.primaryContainer,
      title: Center(child: const Text("Delete Project?")),
      titleTextStyle: GoogleFonts.chewy(fontSize: 24, color: colorScheme.primary),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleDialogOption(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ),
            SimpleDialogOption(
              child: TextButton(
                onPressed: () {
                  ref.read(userProvider.notifier).deleteProject(projectModel.uuid);
                  ref.read(referencesProvider.notifier).deleteFromDisk(projectModel.uuid);
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ),
          ],
        ),
      ],
    );

    showDialog(context: context, builder: (context) => simpleDialog);
  }
}

class CloneProjectButton extends ConsumerWidget {
  final ProjectModel projectModel;

  const CloneProjectButton({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);

    return Tooltip(
      message: "Clone",
      child: IconButton(
        onPressed: () => ref.read(userProvider.notifier).cloneProject(projectModel),
        icon: Icon(Icons.copy, color: themeData.colorScheme.secondary),
      ),
    );
  }
}

class ExportProject extends ConsumerWidget {
  final ProjectModel projectModel;
  const ExportProject({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);

    return IconButton(
      onPressed: _export,
      icon: Icon(Symbols.file_export_rounded, color: themeData.colorScheme.secondary),
    );
  }

  Future<void> _export() async {
    final chosenDirectory = await FilePicker.platform.getDirectoryPath();
    if (chosenDirectory == null) return;
    final parent = Directory(chosenDirectory);
    final file = File(p.join(chosenDirectory, "${projectModel.title}.stitch"));

    if (!await parent.exists()) await parent.create(recursive: true);
    if (await file.exists()) await file.delete();

    Map<String, dynamic> modelToJson = projectModel.toJson();
    String encodedJson = jsonEncode(modelToJson);
    file.writeAsString(encodedJson);
  }
}

class ProjectCard extends ConsumerWidget {
  final ProjectModel projectModel;
  const ProjectCard({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => ref.read(projectProvider.notifier).load(projectModel),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Overview(project: projectModel),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    mouseCursor: SystemMouseCursors.text,
                    maxLength: 20,
                    decoration: null,
                    controller: TextEditingController(text: projectModel.title),
                    style: GoogleFonts.chewy(fontSize: 32, color: themeData.colorScheme.primary),
                    onSubmitted: (value) {
                      ref.read(projectProvider.notifier).updateProject(title: value);
                      ref.read(userProvider.notifier).overWriteActiveProject();
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CloneProjectButton(projectModel: projectModel),
                    ExportProject(projectModel: projectModel),
                    DeleteProjectButton(projectModel: projectModel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewProjectCard extends ConsumerWidget {
  const NewProjectCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);

    return Tooltip(
      message: "New Project",
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => ref.read(userProvider.notifier).createNewProject(),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Overview(project: ProjectModel()),
                  Container(
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Icon(Icons.add, size: 96, color: themeData.colorScheme.surface),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadCard extends ConsumerWidget {
  const UploadCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);

    return Tooltip(
      message: "Upload from Disk",
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _import(ref),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: themeData.colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(5)),
                  ),
                  Icon(Icons.upload, size: 72, color: themeData.colorScheme.surface),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _import(WidgetRef ref) async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Pick a reference!",
      type: FileType.custom,
      allowedExtensions: ["stitch"]
    );
    if (result == null) return;
    File file = File(result.files.single.path!);

    String fileToString = await file.readAsString();
    Map<String, dynamic> decodedJson = jsonDecode(fileToString);
    ProjectModel modelFromJson = ProjectModel.fromJson(decodedJson);
    ref.read(userProvider.notifier).cloneProject(modelFromJson);
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Beta v0.8", style: GoogleFonts.robotoMono()));
  }
}
