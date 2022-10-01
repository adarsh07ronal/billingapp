import 'dart:io';
import 'package:path/path.dart';
import 'package:collection/collection.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  var databaseFactory = databaseFactoryFfi;
  var db;

  DatabaseHelper() {
    onCreate();
  }
  void onCreate() async {
    db = await databaseFactory.openDatabase("a.db");

    await db.execute('''
      CREATE TABLE if not exists Product (
          id INTEGER PRIMARY KEY,
          name TEXT
      )
    ''');
  }

  void onInsert() async {
    await db.insert('Product', <String, Object?>{'name': 'Product 1'});
  }

  void onQuery() async {
    var result = await db.query('Product');
    print(result);
  }

  void onClose() async {
    await db.close();
  }

  void onDelete() async {
    await db.execute('''
      DROP TABLE if exists Product''');
  }

  void onShow() async {

    var result2 = await db
        .execute('''SELECT name FROM sqlite_master
WHERE type IN ('table','view') AND name NOT LIKE 'sqlite_%'
UNION ALL
SELECT name FROM sqlite_temp_master
WHERE type IN ('table','view')
ORDER BY 1''');
    print(result2);
  }
}
