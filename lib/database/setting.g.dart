// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// CindelGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names

final SettingSchema = CindelCollectionSchema<Setting>(
  name: "setting",
  dartName: "Setting",
  idField: "dbId",
  fields: <CindelFieldSchema>[
    CindelFieldSchema(
      name: "dbId",
      dartType: "int",
      binaryType: "int",
      isId: true,
      isIndexed: false,
      isIndexUnique: false,
      isIndexReplace: false,
      indexCaseSensitive: true,
      indexType: CindelIndexType.value,
    ),
    CindelFieldSchema(
      name: "appearance",
      dartType: "AppearanceSetting",
      binaryType: "object",
      isId: false,
      isIndexed: false,
      isIndexUnique: false,
      isIndexReplace: false,
      indexCaseSensitive: true,
      indexType: CindelIndexType.value,
    ),
  ],
  links: <CindelLinkSchema>[],
  compositeIndexes: <CindelCompositeIndexSchema>[],
  toDocument: _$SettingToCindelDocument,
  fromDocument: _$SettingFromCindelDocument,
  toBinaryDocument: _$SettingToCindelBinaryDocument,
  fromBinaryDocument: _$SettingFromCindelBinaryDocument,
  writeNativeDocument: _$SettingWriteCindelNativeDocument,
  readNativeDocument: _$SettingReadCindelNativeDocument,
  getId: _$SettingGetCindelId,
  setId: _$SettingSetCindelId,
);

extension SettingCindelCollectionAccess on CindelDatabase {
  CindelTypedCollection<Setting> get setting => typedCollection(SettingSchema);
}

extension SettingCindelQueryAccess on CindelTypedCollection<Setting> {
  SettingQueryFilter filter() => SettingQueryFilter(
    CindelQuery.all(database: database, schema: SettingSchema),
  );
}

extension SettingCindelQueryFilterAccess on CindelQuery<Setting> {
  SettingQueryFilter filter() => SettingQueryFilter(this);
}

extension SettingCindelQueryModifierAccess on CindelQuery<Setting> {
  CindelQuery<Setting> sortByDbId({
    CindelSortOrder order = CindelSortOrder.ascending,
  }) {
    return sortBy("dbId", order: order);
  }

  CindelQuery<Setting> sortByDbIdDesc() {
    return sortBy("dbId", order: CindelSortOrder.descending);
  }

  CindelQuery<Setting> thenByDbId({
    CindelSortOrder order = CindelSortOrder.ascending,
  }) {
    return thenBy("dbId", order: order);
  }

  CindelQuery<Setting> thenByDbIdDesc() {
    return thenBy("dbId", order: CindelSortOrder.descending);
  }

  CindelQuery<Setting> distinctByDbId() {
    return distinctBy("dbId");
  }

  CindelPropertyQuery<Setting, int> dbIdProperty() {
    return property<int>("dbId");
  }

  CindelQuery<Setting> sortByAppearance({
    CindelSortOrder order = CindelSortOrder.ascending,
  }) {
    return sortBy("appearance", order: order);
  }

  CindelQuery<Setting> sortByAppearanceDesc() {
    return sortBy("appearance", order: CindelSortOrder.descending);
  }

  CindelQuery<Setting> thenByAppearance({
    CindelSortOrder order = CindelSortOrder.ascending,
  }) {
    return thenBy("appearance", order: order);
  }

  CindelQuery<Setting> thenByAppearanceDesc() {
    return thenBy("appearance", order: CindelSortOrder.descending);
  }

  CindelQuery<Setting> distinctByAppearance() {
    return distinctBy("appearance");
  }

  CindelPropertyQuery<Setting, AppearanceSetting> appearanceProperty() {
    return property<AppearanceSetting>(
      "appearance",
      decode: (value) => _$AppearanceSettingFromCindelEmbedded(
        (value as Map).cast<String, Object?>(),
      ),
    );
  }
}

final class SettingQueryFilter {
  const SettingQueryFilter(this._query);

  final CindelQuery<Setting> _query;

  CindelQuery<Setting> dbIdEqualTo(int value) {
    return _query.whereMatches(CindelFilter.field("dbId").equalTo(value));
  }

  CindelQuery<Setting> dbIdGreaterThan(int value) {
    return _query.whereMatches(CindelFilter.field("dbId").greaterThan(value));
  }

  CindelQuery<Setting> dbIdGreaterThanOrEqualTo(int value) {
    return _query.whereMatches(
      CindelFilter.field("dbId").greaterThanOrEqualTo(value),
    );
  }

  CindelQuery<Setting> dbIdLessThan(int value) {
    return _query.whereMatches(CindelFilter.field("dbId").lessThan(value));
  }

  CindelQuery<Setting> dbIdLessThanOrEqualTo(int value) {
    return _query.whereMatches(
      CindelFilter.field("dbId").lessThanOrEqualTo(value),
    );
  }

  CindelQuery<Setting> dbIdBetween(int? lower, int? upper) {
    return _query.whereMatches(
      CindelFilter.field("dbId").between(lower, upper),
    );
  }

  CindelQuery<Setting> appearanceEqualTo(AppearanceSetting value) {
    return _query.whereMatches(
      CindelFilter.field(
        "appearance",
      ).equalTo(_$AppearanceSettingToCindelEmbedded(value)),
    );
  }

  CindelQuery<Setting> appearance(
    CindelFilterPredicate Function(
      SettingAppearanceSettingCindelEmbeddedFilter q,
    )
    filter,
  ) {
    return _query.whereMatches(
      filter(
        const SettingAppearanceSettingCindelEmbeddedFilter._(<String>[
          "appearance",
        ]),
      ),
    );
  }

  CindelQuery<Setting> optional(
    bool enabled,
    CindelQuery<Setting> Function(SettingQueryFilter q) option,
  ) {
    return _query.optional(
      enabled,
      (query) => option(SettingQueryFilter(query)),
    );
  }

  CindelQuery<Setting> anyOf<E>(
    Iterable<E> items,
    CindelQuery<Setting> Function(SettingQueryFilter q, E item) option,
  ) {
    return _query.anyOf(
      items,
      (query, item) => option(SettingQueryFilter(query), item),
    );
  }

  CindelQuery<Setting> allOf<E>(
    Iterable<E> items,
    CindelQuery<Setting> Function(SettingQueryFilter q, E item) option,
  ) {
    return _query.allOf(
      items,
      (query, item) => option(SettingQueryFilter(query), item),
    );
  }
}

final class SettingAppearanceSettingCindelEmbeddedFilter {
  const SettingAppearanceSettingCindelEmbeddedFilter._(this._path);

  final List<String> _path;

  CindelFilterPredicate themeIdEqualTo(String value) {
    return CindelFilter.path(<String>[..._path, "themeId"]).equalTo(value);
  }

  CindelFilterPredicate themeIdContains(String value) {
    return CindelFilter.path(<String>[..._path, "themeId"]).contains(value);
  }

  CindelFilterPredicate themeIdStartsWith(String value) {
    return CindelFilter.path(<String>[..._path, "themeId"]).startsWith(value);
  }

  CindelFilterPredicate themeIdEndsWith(String value) {
    return CindelFilter.path(<String>[..._path, "themeId"]).endsWith(value);
  }

  CindelFilterPredicate themeModeEqualTo(ThemeMode value) {
    return CindelFilter.path(<String>[
      ..._path,
      "themeMode",
    ]).equalTo(value.name);
  }
}

Map<String, Object?> _$SettingToCindelDocument(Setting object) {
  return <String, Object?>{
    "appearance": _$AppearanceSettingToCindelEmbedded(object.appearance),
  };
}

Setting _$SettingFromCindelDocument(Map<String, Object?> document) {
  final object = Setting();
  object.dbId = document["dbId"] as int;
  object.appearance = _$AppearanceSettingFromCindelEmbedded(
    (document["appearance"] as Map).cast<String, Object?>(),
  );
  return object;
}

CindelBinaryDocumentBytes _$SettingToCindelBinaryDocument(Setting object) {
  return cindelEncodeSchemaBinaryDocument(
    <Object?>[_$AppearanceSettingToCindelEmbedded(object.appearance)],
    const <CindelBinaryFieldType>[CindelBinaryFieldType.objectValue],
  );
}

Setting _$SettingFromCindelBinaryDocument(CindelBinaryDocumentBytes bytes) {
  final reader = CindelSchemaBinaryDocumentReader(bytes, staticSize: 3);
  final Object? field0 = reader.readObject(0, 0);
  final object = Setting();
  object.dbId = autoIncrement;
  object.appearance = _$AppearanceSettingFromCindelEmbedded(
    (field0 as Map).cast<String, Object?>(),
  );
  return object;
}

void _$SettingWriteCindelNativeDocument(
  CindelNativeDocumentWriter writer,
  Setting object,
) {
  {
    final value = object.appearance;
    cindelWriteNativeObject<AppearanceSetting>(
      writer,
      0,
      _$AppearanceSettingCindelNativeFieldNames,
      value,
      _$AppearanceSettingWriteCindelNativeEmbedded,
      _$AppearanceSettingToCindelEmbedded,
    );
  }
}

Setting _$SettingReadCindelNativeDocument(
  CindelNativeDocumentReader reader,
  int documentIndex,
) {
  final object = Setting();
  object.dbId = reader.readId(documentIndex);
  object.appearance = (cindelReadNativeObject<AppearanceSetting>(
    reader,
    documentIndex,
    0,
    _$AppearanceSettingCindelNativeFieldNames,
    _$AppearanceSettingReadCindelNativeEmbedded,
    _$AppearanceSettingFromCindelEmbedded,
  ))!;
  return object;
}

int _$SettingGetCindelId(Setting object) {
  return object.dbId;
}

void _$SettingSetCindelId(Setting object, int id) {
  object.dbId = id;
}

const _$AppearanceSettingCindelNativeFieldNames = <String>[
  "themeId",
  "themeMode",
];

Map<String, Object?> _$AppearanceSettingToCindelEmbedded(
  AppearanceSetting object,
) {
  return <String, Object?>{
    "themeId": object.themeId,
    "themeMode": object.themeMode.name,
  };
}

AppearanceSetting _$AppearanceSettingFromCindelEmbedded(
  Map<String, Object?> document,
) {
  final object = AppearanceSetting();
  object.themeId = document["themeId"] as String;
  object.themeMode = ThemeMode.values.byName(document["themeMode"] as String);
  return object;
}

void _$AppearanceSettingWriteCindelNativeEmbedded(
  CindelNativeDocumentWriter writer,
  AppearanceSetting object,
) {
  writer.writeString(0, object.themeId);
  writer.writeString(1, object.themeMode.name);
}

AppearanceSetting _$AppearanceSettingReadCindelNativeEmbedded(
  CindelNativeDocumentReader reader,
  int documentIndex,
) {
  final object = AppearanceSetting();
  object.themeId = reader.readString(documentIndex, 0) as String;
  object.themeMode = ThemeMode.values.byName(
    reader.readString(documentIndex, 1) as String,
  );
  return object;
}
