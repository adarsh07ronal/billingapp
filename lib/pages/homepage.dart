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
  CollectionReference productsCollection =
      Firestore.instance.collection('products');

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
                  onPressed: () {},
                  child: const Text('Add Product'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: style,
                  onPressed: () async {
                    final groceries = await productsCollection.get();
                    print(groceries);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => listProducts()),
                    );
                  },
                  child: const Text('List Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
