// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Project)
const projectProvider = ProjectProvider._();

final class ProjectProvider extends $NotifierProvider<Project, ProjectModel> {
  const ProjectProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectHash();

  @$internal
  @override
  Project create() => Project();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectModel>(value),
    );
  }
}

String _$projectHash() => r'441dfe09e51347e3258656452135e6cea7fbe946';

abstract class _$Project extends $Notifier<ProjectModel> {
  ProjectModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProjectModel, ProjectModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProjectModel, ProjectModel>,
              ProjectModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
