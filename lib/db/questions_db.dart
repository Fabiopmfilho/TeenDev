// import 'package:kidsdev_teste/db/questions.dart';
// import 'package:sqflite/sqflite.dart';

// class QuestionsDB {
//   static final QuestionsDB instance = QuestionsDB._init();

//   static Database? _database;

//   QuestionsDB._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDB('questions.db');
//     return _database!;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final textType = 'TEXT NOT NULL';

//     await db.execute('''
//       CREATE TABLE $questNotes (
//         ${QuestFields.id} $idType,
//         ${QuestFields.quest} $textType,
//         ${QuestFields.resps} $textType,
//         ${QuestFields.correct} $textType,
//       )
//     ''');
//   }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
