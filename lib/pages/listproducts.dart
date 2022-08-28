// ignore_for_file: use_key_in_widget_constructors

import 'package:billingmedical/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cfd;
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class listProducts extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyStore store = VxState.store;
  CollectionReference productCollection =
      Firestore.instance.collection('products');

  @override
  build(BuildContext context) {
    return Scaffold();
  }
}
