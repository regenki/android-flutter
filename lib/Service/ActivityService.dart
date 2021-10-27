import 'dart:io';

import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Service/NotificationService.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart';
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

class ActivityDatabaseHelper {
  ActivityDatabaseHelper.privateConstructor();
  static final ActivityDatabaseHelper instance =
      ActivityDatabaseHelper.privateConstructor();

  static sql.Database? database;
  Future<sql.Database> get _database async =>
      database ??= await _initDatabase();

  Future<sql.Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'activity.db');
    return await sql.openDatabase(path, version: 1,onCreate: onCreate);
  }

  Future onCreate(sql.Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableActivity("
            "$columnId INTEGER PRIMARY KEY,"
            "$columnTitle TEXT not null,"
            "$columnDateTime TEXT not null,"
            "$columnSticker TEXT,"
            "$columnIsDone TEXT,"
            "$columnIsFavorite TEXT,"
            "$columnCategory TEXT)");

  }
  Future<List<Activity>> getActivity()async{
    sql.Database db = await instance._database;
    var activities = await db.query(tableActivity,orderBy:columnDateTime);
    List<Activity> activityList = activities.isNotEmpty ? activities.map((e) => Activity.fromMap(e)).toList() : [] ;
    return activityList;

  }
  Future<int> add(Activity activity)async{
    sql.Database db = await instance._database;

    return await db.insert(tableActivity, activity.toMap());
  }
  Future<int> remove(int id)async{
    sql.Database db = await instance._database;
    return await db.delete(tableActivity,where: "id = ?",whereArgs: [id]);
  }

}
