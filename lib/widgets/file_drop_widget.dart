import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:stitchin_time/models/project_model.dart';
import 'package:stitchin_time/providers/theme_provider.dart';
import 'package:stitchin_time/providers/user_provider.dart';

class FileDropWidget extends HookConsumerWidget {
  const FileDropWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDragging = useState(false);

    return DropTarget(
      enable: true,
      onDragEntered: (details) {
        isDragging.value = true;
      },
      onDragExited: (details) {
        isDragging.value = false;
      },
      onDragDone: (details) => _readFile(details.files.first.path,ref),
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isDragging.value
                ? ref.read(themeProvider).colorScheme.primary.withAlpha(50)
                : Colors.pink.withAlpha(0),
          ),
          margin: EdgeInsets.all(5),
          duration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  void _readFile(String path,WidgetRef ref) {
    File file = File(path);
    var bytes = file.readAsBytesSync();
    var base64json = utf8.decode(bytes);
    var utf8Json = base64.decode(base64json);
    var json = utf8.decode(utf8Json);
    ProjectModel projectModel = ProjectModel.fromJson(jsonDecode(json));
    var extensionType = extension(path);

    switch (extensionType) {
      case ".stitch":
        ref.read(userProvider.notifier).cloneProject(projectModel);
        break;
      // case ".png":
      //   ref.read(referencesProvider.notifier).addReference();
      default:
    }
  }
}
