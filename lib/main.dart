import 'package:billingmedical/pages/homepage.dart';
import 'package:billingmedical/pages/listproducts.dart';
import 'package:billingmedical/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:fluent_ui/fluent_ui.dart' as eos;
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'firebase_options.dart';

class globalvariables {
  String apiKey = 'AIzaSyBmKtMxlKGCGjDkFYkGj_tm7wNs4u_IDIY';
  String projectId = 'billingmedical-e5a25';

  globalvariables() {
    Firestore.initialize(projectId);
  }
}

// Store definition
class MyStore extends VxStore {
  int count = 0;
  final myfirestore = globalvariables();
}

void main() {
  // Firestore.initialize('billingmedical-e5a25');

  runApp(VxState(
    store: MyStore(),
    child: FireStoreApp(),
  ));
  // runApp(const FireStoreApp());
}

class FireStoreApp extends StatelessWidget {
  const FireStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const eos.FluentApp(
      title: 'Billing App',
      home: FireStoreHome(),
    );
  }
}

class FireStoreHome extends StatefulWidget {
  const FireStoreHome({Key? key}) : super(key: key);

  @override
  _FireStoreHomeState createState() => _FireStoreHomeState();
}

class _FireStoreHomeState extends State<FireStoreHome> {
  // CollectionReference productsCollection =
  //     Firestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          appBar: AppBar(title: Text("DDemo")),
          body: const Center(
            child: Text('My Page!'),
          ),
        ),
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => homePage(),
        MyRoutes.listProductsRoute: (context) => listProducts(),
      },
    );
  }
}
