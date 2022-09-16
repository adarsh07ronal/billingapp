import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  DateTime? createdOn;
  DateTime? updatedOn;
  final String? name;
  final bool isActive;

  CategoryModel({
    this.name,
    this.createdOn,
    this.updatedOn,
    this.isActive = false,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
      isActive: map['isActive'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (createdOn != null) "createdOn": createdOn,
      if (updatedOn != null) "updatedOn": updatedOn,
      "isActive": isActive,
    };
  }
}
