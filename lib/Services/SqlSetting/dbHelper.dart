import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class DbHelper{
  static  final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database? _db;

  Future<Database?> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'profile.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db, int v){
      //create all tables
      db.execute("create table profile (id integer primary key autoincrement, name varchar(50), imgUrl text)");
    });
    return _db;
  }

  Future<int?> createCourse(SettingModel model) async{
    Database? db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db!.insert('profile', model.toMap());
  }

  Future<List?> allCourses() async{
    Database? db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db!.query('profile');
  }

  Future<int?> deleteCourse(int id) async{
    Database? db = await createDatabase();
    return db!.delete('profile',where: 'id = ?',whereArgs:[id] );
  }

}