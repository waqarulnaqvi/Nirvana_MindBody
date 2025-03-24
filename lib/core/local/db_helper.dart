import 'dart:io';
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
    String dbPath = join(myDir.path, "myAudio.db");
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
    Database mDB = await getDB();
    List<Map<String, dynamic>> exitingAudio = await mDB.query(audioTableName,
        columns: [columnAudioTitle],
        where: "$columnAudioTitle = ?",
        whereArgs: [title]);
    int rowsEffected = 0;
    String value;
    if (exitingAudio.isNotEmpty) {
      // Update the record using parameterized query
      // rowsEffected = await mDB.update(audioTableName, {
      //   columnAudioTime: time
      // },
      //   where: '$columnAudioTitle = $title',
      // );
      List<Map<String, dynamic>> exitingAudio = await mDB.query(audioTableName,
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

  Future<List<Map<String, dynamic>>> fetchAudio() async {
    Database mDB = await getDB();
    return await mDB.query(audioTableName);
  }
}

// Future<bool> addAudio({required String title,required String time} ) async{
//   Database mDB = await getDB();
//
//   List<Map<String, dynamic>> titles = await mDB.query(
//     audioTableName,
//     columns: [columnAudioTitle], // Fetch only the title column
//   );
//
//   int rowsEffected = 0;
//
//   List<String> allTitles = titles.map((row) => row[columnAudioTitle] as String).toList();
//
//   if(allTitles.contains(title)){
//         rowsEffected = await mDB.update(audioTableName, {
//           columnAudioTitle : title,
//           columnAudioTime : time
//         });
//   }
//   else{
//     rowsEffected =await mDB.insert(audioTableName, {
//       columnAudioTitle : title,
//       columnAudioTime : time
//     });
//   }
//
//   return rowsEffected>0;
// }

// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DBHelper {
//   static const String tableName = "notes";
//   static String columnNoteTitle = "n_title";
//   static String columnNoteDesc = "n_desc";
//   static String columnNoteId = "n_id";
//
//   /// Singleton instance
//   static final DBHelper _instance = DBHelper._internal();
//
//   /// Private constructor
//   DBHelper._internal();
//
//   /// Factory constructor to return the same instance
//   factory DBHelper() => _instance;
//
//   ///single instance of DBHelper
//   // static getInstance() => DBHelper._();
//   Database? _myDB;
//
//   Future<Database> getDB() async {
//     if (_myDB != null) {
//       return _myDB!;
//     } else {
//       _myDB = await openDB();
//       return _myDB!;
//     }
//   }
//
//   Future<Database> openDB() async{
//
//     Directory appDir = await getApplicationDocumentsDirectory();
//     // String dbPath = join(appDir.path,'notes.db');
//     // String dbPath= "${appDir.path}/myDb.db";//Method :1
//     //   String dbPath=  join(appDir.path, "myDb.db");//Method :2
//     String dbPath = joinAll([appDir.path, "myDb.db"]); //Method :3
//
//     return await openDatabase(dbPath, version: 1, onCreate: (db ,version){
//
//       ///where we will create all our tables
//
//       db.execute("create table $tableName ( $columnNoteId integer primary key autoincrement, $columnNoteTitle text, $columnNoteDesc text )");
//
//     });
//
//   }
//
//   ///Whenever the functions is async then its return type is Future of the type like this Future<Type>
//   // Future<Database> openDB() async {
//   //   Directory appDir = await getApplicationDocumentsDirectory();
//   //   // String dbPath= "${appDir.path}/myDb.db";//Method :1
//   //   String dbPath=  join(appDir.path, "myDb.db");//Method :2
//   //   // String dbPath = joinAll([appDir.path, "myDb.db"]); //Method :3
//   //   //if it is windows then join added \ and in linux\macos it added /.
//   //
//   //   ///openDatabase() is a function that comes in the sqflite package
//   //   return await openDatabase(dbPath, version: 1, onCreate: (db ,version){
//   //
//   //     ///where we will create all our tables
//   //
//   //     db.execute("create table $tableName ( $columnNoteId integer primary key autoincrement, $columnNotesTitle text, $columnNotesDesc text )");
//   //
//   //   });
//   // }
//
//   ///queries
//   Future<bool> addNote({required String title, required String desc}) async{
//     Database mDB = await getDB();
//
//     int rowsEffected = await mDB.insert(tableName, {
//       columnNoteTitle : title,
//       columnNoteDesc : desc
//     });
//
//     return rowsEffected>0;
//   }
//
//   Future<List<Map<String, dynamic>>> fetchNotes() async {
//     Database mDb = await getDB();
//     // mDb.execute("Select * from $tableName");
//     List<Map<String, dynamic>> notes = await mDb.query(tableName);
//     return notes;
//   }
// }
