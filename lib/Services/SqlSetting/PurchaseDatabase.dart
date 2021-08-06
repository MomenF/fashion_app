import 'package:e_commerce_app/Services/SqlSetting/PurchaseModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'model.dart';

class PurchaseDatabase{
  static  final PurchaseDatabase _instance = PurchaseDatabase.internal();
  factory PurchaseDatabase() => _instance;
  PurchaseDatabase.internal();
  static Database? _db;

  Future<Database?> createDatabase() async{
    if(_db != null){
      return _db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'purchase.db');
    _db = await openDatabase(path,version: 1,onCreate: (Database db, int v){
      //create all tables
     return db.execute("create table purchase ( id integer primary key autoincrement , name varchar(50), price varchar(50) , pic varchar(250), quantity integer )");
    });
    return _db;
  }

  Future<int?> createPurchase(PurchaseModel model) async{
    Database? db = await createDatabase();
    //db.rawInsert('insert into courses')
    print("database is insert Successfully ");
    return db!.insert('purchase', model.toMap());
  }

  Future<List?> allPurchase() async{
    Database? db = await createDatabase();
    //db.rawQuery("select * from courses")
    print("database is all done ");
    return db!.query('purchase');
  }

  Future<int?> deleteCourse(int id ) async{
    Database? db = await createDatabase();
    return db!.delete('purchase',where: 'id = ?',whereArgs:[id] );
  }

}

