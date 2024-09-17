import 'package:coffee_store/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initializeDatabase() async {
  _db = await openDatabase(
    'cart.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY,name TEXT,description TEXT,price TEXT,image TEXT)');
    },
  );
}

Future<void> getAllCarts() async {
  final _values = await _db.rawQuery('SELECT * FROM cart');
  print(_values);
  cartListNotifier.value.clear();
  _values.forEach((map) {
    final cart = CartModel.fromMap(map);
    cartListNotifier.value.add(cart);
  });
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  cartListNotifier.notifyListeners();
}

Future<void> addCart(CartModel value) async {
  await _db.rawInsert(
      'INSERT INTO cart (name,description,price,image) VALUES(?,?,?,?)',
      [value.name, value.description, value.price, value.image]);
  getAllCarts();
}

Future<void> deleteCart(int id) async {
  await _db.delete('cart', where: 'id=?', whereArgs: [id]);
  getAllCarts();
}

