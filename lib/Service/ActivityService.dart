import 'package:regenki/Model/Activity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

final String tableActivity = "activity";
final String columnId = "id";
final String columnTitle = "title";
final String columnDateTime = "dateTime";
final String columnIsDone = "isDone";
final String columnIsFavorite = "isFavorite";
final String columnSticker = "sticker";
final String columnCategory = "category";

class ActivityLocalDatabaseService {
  static final ActivityLocalDatabaseService instance =
      ActivityLocalDatabaseService.init();

  static Database? _database;

  ActivityLocalDatabaseService.init();

  Future<Database> get database async {
    if (_database != null) return database;
    _database = await initDB("activity.db");
    return _database!;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(path, version: 1, onCreate: createDatabase);
  }

  Future createDatabase(Database db, int version) async {


    db.execute(
        "CREATE TABLE $tableActivity ("
            "$columnId integer primary key autoincrement,"
            "$columnTitle text not null,"
            "$columnCategory text not null,"
            "$columnSticker text not null,"
            "$columnDateTime text not null,"
            "$columnIsDone integer,"
            "$columnIsFavorite integer)");

    return db;
  }

  void insertActivity(Activity activity)async{
    var db = await this.database;
    var result = db.insert(tableActivity, activity.toMap());
    print(result);
  }

  Future<List<Activity>> getActivity()async{
    List<Activity> activityList = [];
    var db = await this.database;
    var result = await db.query(tableActivity);
    result.forEach((element) {
      var activity = Activity.fromMap(element);
      activityList.add(activity);
    });

    return activityList;
  }

  Future<int> updateItem(int id,Activity activity)async{
    final db = await this.database;

    final result = await db.update(tableActivity, activity.toMap(),where: "id = ?",whereArgs: [id]);
    return result;
  }

  Future<int> delete(int id)async{
    var db = await this.database;

    return await db.delete(tableActivity,where: "$columnId = ?",whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
