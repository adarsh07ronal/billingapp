// ignore_for_file: use_key_in_widget_constructors

import 'package:billingmedical/main.dart';
import 'package:billingmedical/models/productmodel.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class getProducts extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('products');

  @override
  perform() async {
    var document = await ref.get();
    // await Future.delayed(Duration(seconds: 5));
    store?.products =
        document.map((element) => ProductModel.fromMap(element.map)).toList();
  }
}

class listProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getProducts();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("List Products"),
        ),
        body: VxBuilder(
          builder: (context, store, status) => ListView.builder(
            itemBuilder: (context, index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(store.products[index].name),
                    // subtitle:
                    //     Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        store.products[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text(
                        store.products[index].price.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text(
                        store.products[index].batchnumber.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        store.products[index].dosage.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        store.products[index].createdOn.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        store.products[index].updatedOn.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  // ListTile(
                  //   leading: FlutterLogo(size: 72.0),
                  //   title: Text(store.products[index].name),
                  //   subtitle: Text(
                  //       '${store.products[index].name}, ${store.products[index].price}'),
                  // ),
                ],
              ),
            ),
            itemCount: store.products.length,
          ),
          // builder: (context, store, status) => Text(status.toString()),
          mutations: const {getProducts},
        ));
  }
}
