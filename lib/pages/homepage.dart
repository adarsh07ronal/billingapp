import 'package:billingmedical/pages/addcategory.dart';
import 'package:billingmedical/pages/addproduct.dart';
import 'package:billingmedical/pages/listcategories.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:firedart/firestore/models.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cfd;

import 'listproducts.dart';

class homePage extends StatefulWidget {
  // const homePage({super.key});
  const homePage({Key? key}) : super(key: key);
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.red,
      onPrimary: Colors.yellow,
      textStyle: const TextStyle(fontSize: 15),
    );

    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCategory()),
                    );
                  },
                  child: const Text('Add Category'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProduct()),
                    );
                  },
                  child: const Text('Add Product'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => listProducts()),
                    );
                  },
                  child: const Text('List Products'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => listCatgories()),
                    );
                  },
                  child: const Text('List Categories'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
