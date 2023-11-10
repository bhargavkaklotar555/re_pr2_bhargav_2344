import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../modals/P_modal.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  late Database database;

  String Table = "p2";

  String P_id = "id";
  String P_name = "name";
  String P_image = "image";

  init_DB() async {
    String dbPath = await getDatabasesPath();
    String dbName = "p2.db";

    String finalPath = join(dbPath, dbName);

    database = await openDatabase(
      finalPath,
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE $Table($P_id INTEGER PRIMARY KEY AUTOINCREMENT , $P_name TEXT , $P_image TEXT)')
            .then(
              (value) => log("Product Table are Created : DONE "),
            );
      },
    );
  }

  insert_product({required String name, required String image}) async {
    String query = "INSERT INTO $Table(name,image) VALUES(?,?)";

    List args = [name, image];

    int product = await database.rawInsert(query, args);
    return product;
  }

  displayProduct() async {
    String query = "SELECT * FROM $Table";

    List products = await database.rawQuery(query);
    log(products.toString());

    List<Pmodal> allproducts =
        products.map((e) => Pmodal.fromMap(data: e)).toList();

    return allproducts;
  }

  Future<int> removeProduct({required int pid}) async {
    String sql = "DELETE FROM $Table WHERE id = $pid";
    return database.rawDelete(sql);
  }
}
