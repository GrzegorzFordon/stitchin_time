// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tool)
const toolProvider = ToolProvider._();

final class ToolProvider extends $NotifierProvider<Tool, ToolModel> {
  const ToolProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toolProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toolHash();

  @$internal
  @override
  Tool create() => Tool();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToolModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToolModel>(value),
    );
  }
}

String _$toolHash() => r'0c0a41db5c9ca656f61bc7e6f8989a0ca62b5c6e';

abstract class _$Tool extends $Notifier<ToolModel> {
  ToolModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ToolModel, ToolModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ToolModel, ToolModel>,
              ToolModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
