// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DataBase)
final dataBaseProvider = DataBaseProvider._();

final class DataBaseProvider
    extends $AsyncNotifierProvider<DataBase, CindelDatabase> {
  DataBaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataBaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataBaseHash();

  @$internal
  @override
  DataBase create() => DataBase();
}

String _$dataBaseHash() => r'8c6f57633d56f556c142c4a11fd7d72ac0c73949';

abstract class _$DataBase extends $AsyncNotifier<CindelDatabase> {
  FutureOr<CindelDatabase> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CindelDatabase>, CindelDatabase>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CindelDatabase>, CindelDatabase>,
              AsyncValue<CindelDatabase>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
