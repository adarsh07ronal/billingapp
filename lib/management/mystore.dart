import 'package:billingmedical/data/databasehelper.dart';
import 'package:billingmedical/models/categorymodel.dart';
import 'package:billingmedical/models/productmodel.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:velocity_x/velocity_x.dart';

class globalvariables {
  String apiKey = 'AIzaSyBmKtMxlKGCGjDkFYkGj_tm7wNs4u_IDIY';
  String projectId = 'billingmedical-e5a25';

  globalvariables() {
    Firestore.initialize(projectId);
  }
}

// Store definition
class MyStore extends VxStore {
  final myfirestore = globalvariables();
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  final databaseHelper = DatabaseHelper();
}
