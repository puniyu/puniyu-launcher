// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeController)
final themeControllerProvider = ThemeControllerProvider._();

final class ThemeControllerProvider
    extends $NotifierProvider<ThemeController, ThemeManager> {
  ThemeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeControllerHash();

  @$internal
  @override
  ThemeController create() => ThemeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeManager>(value),
    );
  }
}

String _$themeControllerHash() => r'73dca9703a1025bee04e8fcca300cc02c1bddac1';

abstract class _$ThemeController extends $Notifier<ThemeManager> {
  ThemeManager build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemeManager, ThemeManager>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeManager, ThemeManager>,
              ThemeManager,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
