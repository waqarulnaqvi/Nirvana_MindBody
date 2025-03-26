import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:nirvanafit/core/data/models/audio_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static const String audioTableName = "audio";
  static String columnAudioTitle = "a_title";
  static String columnAudioTime = "a_time";
  static String columnAudioImageUrl = "a_url";

  /// Singleton instance
  static final DBHelper _instance = DBHelper._internal();

  /// Private constructor
  DBHelper._internal();

  /// Factory constructor to return the same instance
  factory DBHelper() => _instance;

  Database? _myDB;

  Future<Database> getDB() async {
    return _myDB ??= await openDB();
  }

  Future<Database> openDB() async {
    Directory myDir = await getApplicationDocumentsDirectory();
    // String dbPath= "${appDir.path}/myDb.db";//Method :1
    String dbPath = join(myDir.path, "myAudio.db");// Method :2
    // String dbPath = joinAll([appDir.path, "myDb.db"]); //Method :3
    //if it is windows then join added \ and in linux\macos it added /.

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      ///where we will create all our tables
      db.execute(
          "create table $audioTableName ( $columnAudioTitle text primary key,$columnAudioImageUrl text,$columnAudioTime text )");
    });

    //$columnAudioId integer primary key autoincrement,
  }

  Future<bool> addAudio(
      {required String title,
      required Duration time,
      required String imageUrl}) async {
    try {
      Database mDB = await getDB();
      List<Map<String, dynamic>> exitingAudio = await mDB.query(audioTableName,
          columns: [columnAudioTitle],
          where: "$columnAudioTitle = ?",
          whereArgs: [title]);
      int rowsEffected = 0;
      String value;
      if (exitingAudio.isNotEmpty) {
        List<Map<String, dynamic>> exitingAudio = await mDB.query(
            audioTableName,
            columns: [columnAudioTime],
            where: "$columnAudioTitle = ?",
            whereArgs: [title]);

        final parts = exitingAudio[0][columnAudioTime]
            .split(":")
            .map(int.tryParse)
            .toList();

        value = (time +
            Duration(hours: parts[0], minutes: parts[1], seconds: parts[2]))
            .toString()
            .split(".")[0];

        rowsEffected = await mDB.update(
          audioTableName,
          {columnAudioTime: value},
          where: '$columnAudioTitle = ?',
          whereArgs: [title],
        );
      } else {
        // Insert a new record
        value = time.toString().split(".")[0];
        rowsEffected = await mDB.insert(audioTableName, {
          columnAudioTitle: title,
          columnAudioImageUrl: imageUrl,
          columnAudioTime: value
        });
      }
      return rowsEffected > 0;
    }
    catch (e) {
      if (kDebugMode) {
        print("Error in adding audio: $e");
      }
      return false;
    }
  }

  Future<List<AudioModel>> fetchAudio() async {
    Database mDB = await getDB();
    try {
      List<Map<String,dynamic>> audioList = await mDB.query(audioTableName);
      List<AudioModel> audioModelList =audioList.map((e) => AudioModel.fromMap(e)).toList();
      return audioModelList;
    } catch (e) {
      if (kDebugMode) {
        print("Error in fetching audio: $e");
      }
      return [];
    }
  }
}
