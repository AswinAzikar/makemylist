import 'package:makemylist/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  
  Future<Database> get database async {
    if (_database != null) return _database!;
    
    _database = await _openDatabase();
    return _database!;
  }

  
  Future<Database> _openDatabase() async {
    return openDatabase(
      'tasks.db', 
      version: 1,
      onCreate: (Database db, int version) async {
        
        await db.execute('''
          CREATE TABLE tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          )
        ''');

        
        await db.execute('''
          CREATE TABLE completed_tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  
  Future<void> insertTask(TodoModel task) async {
    final db = await database;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  Future<List<TodoModel>> fetchTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return TodoModel.fromMap(maps[i]);
    });
  }

  
  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  
  Future<TodoModel> fetchTaskById(int id) async {
    final db = await database;
    final maps = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return TodoModel.fromMap(maps.first);
    } else {
      throw Exception("Task not found");
    }
  }

  
  Future<void> insertCompletedTask(TodoModel task) async {
    final db = await database;
    await db.insert(
      'completed_tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  Future<List<TodoModel>> fetchCompletedTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('completed_tasks');
    return List.generate(maps.length, (i) {
      return TodoModel.fromMap(maps[i]);
    });
  }
}
