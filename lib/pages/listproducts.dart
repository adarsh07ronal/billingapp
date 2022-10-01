// ignore_for_file: use_key_in_widget_constructors

import 'package:billingmedical/main.dart';
import 'package:billingmedical/management/mymutations.dart';
import 'package:billingmedical/models/productmodel.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class listProducts extends StatelessWidget {
  deleteproduct(String id) async {
    var ref = Firestore.instance.collection('products');
    await ref.document(id).delete();
    print("Deleted $id");
  }

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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Icon(Icons.medical_services, color: Colors.green[500]),
                    ],
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name :"),
                          Text(
                            store.products[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price :"),
                          Text(
                            store.products[index].price.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Strike price :"),
                          Text(
                            store.products[index].strikeprice.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dosage :"),
                          Text(
                            store.products[index].dosage.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Batch :"),
                          Text(
                            store.products[index].batchnumber.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 200.0,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Created On :"),
                          Text(
                            store.products[index].createdOn.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Updated On :"),
                          Text(
                            store.products[index].updatedOn.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text("Quantity :")),
                          Center(
                            child: Text(
                              store.products[index].updatedOn.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("categoryName :"),
                          Text(
                            store.products[index].categoryName.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("categoryId :"),
                          Text(
                            store.products[index].categoryId.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Delete Product'),
                            content: const Text('Delete Product'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => {
                                  Navigator.pop(context, 'Cancel'),
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => {
                                  deleteproduct(store.products[index].id),
                                  getProducts(),
                                  Navigator.pop(context, 'OK'),
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        // child: const Text('Show Dialog'),
                      )
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
