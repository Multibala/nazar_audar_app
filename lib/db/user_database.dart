import 'dart:async';
import 'package:path/path.dart';
import 'package:nazar_audar_app/models/user_authetication.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const textType = 'VARCHAR(25) NOT NULL';
    const userType = 'VARCHAR(25) PRIMARY KEY';
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const emailType = 'VARCHAR(30) NOT NULL';
    await db.execute('''
      CREATE TABLE $tableUser (
        ${UserField.username} $userType,
        ${UserField.surname} $textType,
        ${UserField.password} $textType,
        ${UserField.email} $emailType
        
      )


''');
  }

  Future create(User user) async {
    final db = await instance.database;
//     final json = user.toJson();
//     final columns =
//         ' ${UserField.username}, ${UserField.surname} ,${UserField.password},${UserField.email}';
//     final values =
//         '${json[UserField.username]},${json[UserField.surname]},${json[UserField.password]},${json[UserField.email]}';
//     final id = await db.rawInsert('''
//     INSERT INTO table_name ($columns) values ($values)

// ''');
    final id = await db.insert(tableUser, user.toJson());
    // return user.copy(id: id);
  }

  Future<User?> readUser(String username) async {
    final db = await instance.database;
    final maps = await db.query(
      tableUser,
      columns: UserField.values,
      where: '${UserField.username} = ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      return null;
    }
  }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;
    final result = await db.query(tableUser);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> update(User user) async {
    final db = await instance.database;
    return db.update(
      tableUser,
      user.toJson(),
      where: '${UserField.username}=?',
      whereArgs: [user.username],
    );
  }

  Future<Map<String, Object?>?> getByUsername(String username) async {
    final db = await instance.database;
    final result = await db.query(
      tableUser,
      where: '${UserField.username} = ?',
      whereArgs: [username],
    );
    if (result.isEmpty) {
      return null;
    }

    return result[0];
  }

  Future delete(String username) async {
    final db = await instance.database;

    return db.delete(
      tableUser,
      where: '${UserField.username} = ?',
      whereArgs: [username],
    );
  }
}
