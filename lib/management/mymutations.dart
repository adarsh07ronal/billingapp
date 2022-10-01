import 'package:billingmedical/management/mystore.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:billingmedical/models/productmodel.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:velocity_x/velocity_x.dart';

class getProducts extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('products');

  @override
  perform() async {
    var document = await ref.get();
    // await Future.delayed(Duration(seconds: 5));
    store?.products = document
        .map((element) => ProductModel.fromMap(element.map, element.id))
        .toList();
  }
}

class addProduct extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('products');

  // final Map<String, dynamic> currentproduct;
  final ProductModel currentproduct;

  addProduct(this.currentproduct);

  @override
  perform() async {
    await ref.add(currentproduct.toFirestore());
  }
}

class getCategories extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('productcategory');

  @override
  perform() async {
    var document = await ref.get();
    // await Future.delayed(Duration(seconds: 5));
    store?.categories = document
        .map((element) => CategoryModel.fromMap(element.map, element.id))
        .toList();
  }
}

class addCategory extends VxMutation<MyStore> {
  var ref = Firestore.instance.collection('productcategory');
  // final Map<String, dynamic> currentproduct;
  final CategoryModel currentcategory;

  addCategory(this.currentcategory);

  @override
  perform() async {
    await ref.add(currentcategory.toFirestore());
    print("Add category button pressed.");
  }
}
