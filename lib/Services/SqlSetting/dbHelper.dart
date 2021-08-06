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
      db.execute("create table profile ( name varchar(50), imgUrl text)");
    });
    return _db;
  }

  Future<int?> createSetting(SettingModel model) async{
    Database? db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db!.insert('profile', model.toMap());
  }

  Future< SettingModel? > allSettings() async{
    Database? db = await createDatabase();
    //db.rawQuery("select * from courses")
    SettingModel? model=new SettingModel();
    for (Map<String ,dynamic> item in await db!.query("profile")){
       model=SettingModel.fromMap(item);
    }
    return model;
  }

  Future<int?> deleteCourse(String name ,String imgUrl ) async{
    Database? db = await createDatabase();
    return db!.delete('profile',where: 'name = ? and imgUrl = ?',whereArgs:[name,imgUrl] );
  }

}