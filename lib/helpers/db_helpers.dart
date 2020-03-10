import 'package:exam_nan/models/resto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;

/*class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'restos.db'), onCreate: (db, version) {
      return db.execute('CREATE TABLE restaurant(id TEXT PRIMARY KEY, nom TEXT, image TEXT, commune TEXT, contact TEXT, description TEXT');
    }, version: 1);
  }


  static Future<void> insert(String table, Map<String, Object> data) async {

    final db = await DBHelper.database();
        db.insert(
        table,
        data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(int id, String table) async {
    final db = await DBHelper.database();
   db.delete(table);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    db.query(table);
  }


}*/

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NOM = 'nom';
  static const String IMAGE = 'image';
  static const String COMMUNE = 'commune';
  static const String CONTACT = 'contact';
  static const String DESCRIPTION = 'description';
  static const String TABLE = 'restaurant';
  static const String DB_NAME = 'restos.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
   _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $NOM TEXT, $IMAGE TEXT, $COMMUNE TEXT, $CONTACT INTEGER, $DESCRIPTION TEXT)");
  }

  Future<Restoo> save(Restoo restoo, Map<String, String> map) async {
    var dbClient = await db;
    restoo.id =  await dbClient.insert(TABLE, restoo.toMap());

    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });*/
  }

    Future<List<Restoo>> getRestoos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NOM, IMAGE, COMMUNE, CONTACT, DESCRIPTION]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Restoo> restos = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        restos.add(Restoo.fromMap(maps[i]));
      }
    }
    return restos; 
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(Restoo restoo) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, restoo.toMap(),
    where: '$ID = ?', whereArgs: [restoo.id]);
  }

   Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

}