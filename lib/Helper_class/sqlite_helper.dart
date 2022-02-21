import 'package:sqflite/sqflite.dart'as sqlite;

class SqlHelper{
  static Future<sqlite.Database> db()async{
    return sqlite.openDatabase(
      "info.db",
      version: 1,
      onCreate: (sqlite.Database database, int version){
        database.execute("CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,title TEXT,description TEXT)");
      }
    );
  }
  //inserData
static Future<int> insertData(String title,String description)async{
    final db=await SqlHelper.db();
    var values={"title":title,"description":description};
    return db.insert("note", values);
}
static Future<List<Map<String,dynamic>>> getAllData()async{
    final db=await SqlHelper.db();
    return db.query("note",orderBy: "id");
}
static Future<int> deleteData(int id)async{
    final db=await SqlHelper.db();
    return db.delete("note",where: "id=?",whereArgs: [id]);
}
static Future<int> updateData(int id,String title,String des)async{
    final db=await SqlHelper.db();
    var value={"title":title,"description":des};
    return db.update("note", value,where: "id=?",whereArgs: [id]);

}

}