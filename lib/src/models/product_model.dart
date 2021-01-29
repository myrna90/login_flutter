// To parse this JSON data, do
//
//     final ProductModel = ejidosFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.id,
    this.title = '',
    this.acres = 0.0,
    this.description = '',
    this.photoUrl,
    this.approved = true,
  });

  String id;
  String title;
  double acres;
  String description;
  String photoUrl;
  bool approved;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        acres: json["acres"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        approved: json["approved"],
      );

  Map<String, dynamic> toJson() => {
        //"id": id,
        "title": title,
        "acres": acres,
        "description": description,
        "photoUrl": photoUrl,
        "approved": approved,
      };
}
