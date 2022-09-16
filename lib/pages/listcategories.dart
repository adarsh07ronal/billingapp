// ignore_for_file: use_key_in_widget_constructors

import 'package:billingmedical/main.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class getCategories extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('productcategory');

  @override
  perform() async {
    var document = await ref.get();
    // await Future.delayed(Duration(seconds: 5));
    store?.categories =
        document.map((element) => CategoryModel.fromMap(element.map)).toList();
  }
}

class listCatgories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getCategories();
    return Scaffold(
        appBar: AppBar(
          title: Text("List Categories"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: VxBuilder(
          builder: (context, store, status) => ListView.builder(
            itemBuilder: (context, index) => Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album, size: 45),
                    title: Text(store.categories[index].name),
                    subtitle: Text('Best of Sonu Nigam Song'),
                  ),
                ],
              ),
            ),
            itemCount: store.categories.length,
          ),
          // builder: (context, store, status) => Text(status.toString()),
          mutations: const {getCategories},
        ));
  }
}
