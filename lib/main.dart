import 'package:billingmedical/management/mystore.dart';
import 'package:billingmedical/pages/homepage.dart';
import 'package:billingmedical/pages/listproducts.dart';
import 'package:billingmedical/utils/routes.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:fluent_ui/fluent_ui.dart' as eos;
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:velocity_x/velocity_x.dart';

Future<void> main() async {
  sqfliteFfiInit();

  runApp(VxState(
    store: MyStore(),
    child: FireStoreApp(),
  ));
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
