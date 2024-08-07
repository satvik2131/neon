import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:neon_files/src/blocs/browser.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/models/file_details.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_files/src/sort/files.dart';
import 'package:neon_files/src/utils/task.dart';
import 'package:neon_files/src/widgets/file_list_tile.dart';
import 'package:neon_files/src/widgets/navigator.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart';

class FilesBrowserView extends StatefulWidget {
  const FilesBrowserView({
    required this.bloc,
    required this.filesBloc,
    super.key,
  });

  final FilesBrowserBloc bloc;
  final FilesBloc filesBloc;

  @override
  State<FilesBrowserView> createState() => _FilesBrowserViewState();
}

class _FilesBrowserViewState extends State<FilesBrowserView> {
  late final StreamSubscription<Object> errorsSubscription;
  late final FilesOptions options;

  @override
  void initState() {
    errorsSubscription = widget.bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });

    options = NeonProvider.of<FilesOptions>(context);

    super.initState();
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: widget.bloc.files,
      builder: (context, filesSnapshot) => StreamBuilder(
        stream: widget.bloc.uri,
        builder: (context, uriSnapshot) => StreamBuilder(
          stream: widget.filesBloc.tasks,
          builder: (context, tasksSnapshot) {
            if (!uriSnapshot.hasData || !tasksSnapshot.hasData) {
              return const SizedBox();
            }
            return BackButtonListener(
              onBackButtonPressed: () async {
                final parent = uriSnapshot.requireData.parent;
                if (parent != null) {
                  widget.bloc.setPath(parent);
                  return true;
                }
                return false;
              },
              child: SortBoxBuilder(
                sortBox: filesSortBox,
                sortProperty: options.filesSortPropertyOption,
                sortBoxOrder: options.filesSortBoxOrderOption,
                presort: const {
                  (property: FilesSortProperty.isFolder, order: SortBoxOrder.ascending),
                },
                input: filesSnapshot.data?.sublist(1).toList(),
                builder: (context, sorted) {
                  final uploadingTaskTiles = buildUploadTasks(tasksSnapshot.requireData, sorted);

                  return NeonListView(
                    scrollKey: 'files-${uriSnapshot.requireData.path}',
                    itemCount: sorted.length,
                    itemBuilder: (context, index) {
                      final file = sorted[index];
                      final matchingTask = tasksSnapshot.requireData.firstWhereOrNull(
                        (task) => file.name == task.uri.name && widget.bloc.uri.value == task.uri.parent,
                      );

                      final details = matchingTask != null
                          ? FileDetails.fromTask(
                              task: matchingTask,
                              file: file,
                            )
                          : FileDetails.fromWebDav(
                              file: file,
                            );

                      return FileListTile(
                        bloc: widget.filesBloc,
                        browserBloc: widget.bloc,
                        details: details,
                      );
                    },
                    isLoading: filesSnapshot.isLoading,
                    error: filesSnapshot.error,
                    onRefresh: widget.bloc.refresh,
                    topScrollingChildren: [
                      FilesBrowserNavigator(
                        uri: uriSnapshot.requireData,
                        bloc: widget.bloc,
                      ),
                      ...uploadingTaskTiles,
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Iterable<Widget> buildUploadTasks(BuiltList<FilesTask> tasks, List<WebDavFile> files) sync* {
    for (final task in tasks) {
      if (task is! FilesUploadTask) {
        continue;
      }

      yield FileListTile(
        bloc: widget.filesBloc,
        browserBloc: widget.bloc,
        details: FileDetails.fromUploadTask(
          task: task,
        ),
      );
    }
  }
}
