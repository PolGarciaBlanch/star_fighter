import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class CustomData {
  CustomData({required this.app});
  final FirebaseApp app;
  final referenceDatabase = FirebaseDatabase.instance;

  Test() {
    final ref = referenceDatabase.ref();
  }

  testSet() {
    final ref = referenceDatabase.ref();
    ref.child('shop').push().child('mods').set("test").asStream();
  }

  //read

}


  //write

  //lists

