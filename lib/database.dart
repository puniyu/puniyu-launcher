import 'package:cindel/cindel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:puniyu_app/database/setting.dart';

part 'database.g.dart';

@Riverpod(keepAlive: true)
class DataBase extends _$DataBase {
  @override
  Future<CindelDatabase> build() async {
    final supportDir = await getApplicationSupportDirectory();
    final db = await CindelDatabase.open(
      directory: supportDir.path,
      schemas: [SettingSchema],
    );
    ref.onDispose(db.close);
    return db;
  }
}
