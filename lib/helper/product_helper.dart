
import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductHelper{
  static String getProductFilterTypeValue(ProductFilterType filterType) {
    String type;
    switch (filterType) {
      case ProductFilterType.highToLow:
        type = 'price_high_to_low';
        break;
      case ProductFilterType.lowToHigh:
        type = 'price_low_to_high';
        break;
    }

    return type;
  }

  static double? getProductRatingValue(Product? product) {
    double? rating;
    if(product != null && product.rating != null && product.rating!.isNotEmpty && product.rating!.first.average != null){
      rating = double.tryParse('${product.rating!.first.average}');
    }
    return rating;
  }


}