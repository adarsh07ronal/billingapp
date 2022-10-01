import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  DateTime? createdOn;
  DateTime? updatedOn;
  final String? name;
  final bool isActive;

  CategoryModel({
    this.id,
    this.name,
    this.createdOn,
    this.updatedOn,
    this.isActive = false,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map, [String id =""]) {
    return CategoryModel(
      name: map['name'],
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
      isActive: map['isActive'],
      id: id,
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

  Map<String, dynamic> toList() {
    return {
      if (name != null) "name": name,
      if (createdOn != null) "createdOn": createdOn,
      if (updatedOn != null) "updatedOn": updatedOn,
      "isActive": isActive,
      "id": id,
    };
  }
}
