// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxy.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Proxy)
final proxyProvider = ProxyProvider._();

final class ProxyProvider extends $NotifierProvider<Proxy, ProxySetting> {
  ProxyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proxyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proxyHash();

  @$internal
  @override
  Proxy create() => Proxy();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProxySetting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProxySetting>(value),
    );
  }
}

String _$proxyHash() => r'e759b311f22a80cb5244eb999bac6c31ad902756';

abstract class _$Proxy extends $Notifier<ProxySetting> {
  ProxySetting build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProxySetting, ProxySetting>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProxySetting, ProxySetting>,
              ProxySetting,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
