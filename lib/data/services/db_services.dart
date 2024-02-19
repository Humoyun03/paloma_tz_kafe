
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:paloma_tz_kafe/models/basket_mode.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/product_model.dart';

class SqliteService {
  List<BasketModel> cashiers = [
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 1,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 0,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 2,
        price: 999999),BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 1,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 0,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 2,
        price: 999999),BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 1,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 0,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 2,
        price: 999999),BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 1,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 0,
        price: 999999),
    BasketModel(
        items: "N_o123 15:45",
        name: "Тапчан VIP 2",
        isPay: 2,
        price: 999999),
  ];
  List<ProductModel> products = [
    ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 999,
        price: 400),
  ];
  List<ProductModel> baskets = [
    ProductModel(
        name: "Coca-Cola Classic 2л пластик",
        commonNumber: 4,
        price: 200),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 4,
        price: 200),ProductModel(
        name: "Coca-Cola Classic 2л пластик 800",
        commonNumber: 4,
        price: 200),
  ];
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Enter(enter INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Enter1(enter INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Cashier(items TEXT NOT NULL, name TEXT NOT NULL, isPay INTEGER NOT NULL,price INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Product(name TEXT NOT NULL, commonNumber INTEGER NOT NULL, price INTEGER NOT NULL)",
        );
        await database.execute(
          "CREATE TABLE Basket(name TEXT NOT NULL, commonNumber INTEGER NOT NULL, price INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }



  Future createItem() async {
    final Database db = await initializeDB();
    for(BasketModel cashier in cashiers){
      print(cashier);
      await db.insert('Cashier', cashier.toMap());
    }
  }

  Future createEnter() async {
    final Database db = await initializeDB();
    await db.insert('Enter', {"enter":0});
  }
  Future createEnter1() async {
    final Database db = await initializeDB();
    await db.insert('Enter1', {"enter":0});
  }

  Future createProduct() async {
    final Database db = await initializeDB();
    for(ProductModel cashier in products){
      print(cashier);
      await db.insert('Product', cashier.toMap());
    }
  }

  Future createBasket() async {
    final Database db = await initializeDB();
    for(ProductModel cashier in baskets){
      print(cashier);
      await db.insert('Basket', cashier.toMap());
    }
  }


  Future<List<Map<String,dynamic>>> getEnter() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter');
    return queryResult;
  }

  Future<List<Map<String,dynamic>>> getEnter1() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter1');
    return queryResult;
  }

  Future<List<BasketModel>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Cashier');
    return queryResult.map((e) => BasketModel.fromMap(e)).toList();
  }

  Future<List<ProductModel>> getProduct() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Product');
    return queryResult.map((e) => ProductModel.fromMap(e)).toList();
  }

  Future<List<ProductModel>> getBasket() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Basket');
    return queryResult.map((e) => ProductModel.fromMap(e)).toList();
  }
}

