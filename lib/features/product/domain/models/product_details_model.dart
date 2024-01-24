import 'package:flutter_restaurant/common/models/product_model.dart';


class ProductDetailsModel {
  Product? product;
  List<Product>? relatedProducts;

  ProductDetailsModel({this.product, this.relatedProducts});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ?  Product.fromJson(json['product']) : null;
    if (json['related_products'] != null) {
      relatedProducts = <Product>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (relatedProducts != null) {
      data['related_products'] =
          relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
