// ignore_for_file: use_key_in_widget_constructors

import 'package:billingmedical/data/databasehelper.dart';
import 'package:billingmedical/main.dart';
import 'package:billingmedical/management/mymutations.dart';
import 'package:billingmedical/management/mystore.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:billingmedical/utils/customsearchdelegate.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class listCatgories extends StatelessWidget {
  MyStore store = VxState.store;

  deletecategory(String id) async {
    var ref = Firestore.instance.collection('productcategory');
    await ref.document(id).delete();
    print("Deleted $id");
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    store.databaseHelper.onInsert();

    // store.databaseHelper.onDelete();
    store.databaseHelper.onQuery();
    return Scaffold(
        appBar: AppBar(
          title: Text("List Categories"),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
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
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Delete Category'),
                            content: const Text('Delete Category'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => {
                                  Navigator.pop(context, 'Cancel'),
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => {
                                  deletecategory(store.categories[index].id),
                                  getCategories(),
                                  Navigator.pop(context, 'OK'),
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        // child: const Text('Show Dialog'),
                      )),
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
