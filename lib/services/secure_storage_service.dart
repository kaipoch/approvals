import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    try {
      var writeData = await _storage.write(key: key, value: value);
      return writeData;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Oops! Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future readSecureData(String key) async {
    try {
      var readData = await _storage.read(key: key);
      return readData;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Oops! Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future deleteSecureData(String key) async {
    try {
      var deleteData = await _storage.delete(key: key);
      return deleteData;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Oops! Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future deleteAllSecureData() async {
    try {
      var deleteData = await _storage.deleteAll();
      return deleteData;
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Oops! Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
