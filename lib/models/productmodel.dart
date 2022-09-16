import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? name;

  final num batchnumber;
  final num dosage;
  final num price;
  final num quantity;
  final num strikeprice;

  final String categoryId;
  final String categoryName;

  final DateTime? createdOn;
  final DateTime? updatedOn;
  final bool isActive;

  ProductModel({
    this.name,
    this.batchnumber = 0,
    this.dosage = 0,
    this.price = 0,
    this.quantity = 0,
    this.strikeprice = 0,
    this.categoryId = "",
    this.categoryName = "",
    this.createdOn,
    this.updatedOn,
    this.isActive = true,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'],
      batchnumber: map['batchnumber'],
      dosage: map['dosage'],
      price: map['price'],
      quantity: map['quantity'],
      strikeprice: map['strikeprice'],
      categoryId: map['categoryId'],
      categoryName: map['categoryName'],
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
      isActive: map['isActive'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      "batchnumber": batchnumber,
      "dosage": dosage,
      "price": price,
      "quantity": quantity,
      "strikeprice": strikeprice,
      "categoryId": categoryId,
      "categoryName": categoryName,
      "createdOn": createdOn,
      "updatedOn": updatedOn,
      "isActive": isActive,
    };
  }
}
