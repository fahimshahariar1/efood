import 'package:flutter/material.dart';

import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/main.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class PriceConverterHelper {
  static String convertPrice(double? price,
      {double? discount, String? discountType}) {
    final configModel = Provider
        .of<SplashProvider>(
        Get.context!, listen: false)
        .configModel!;
    if (discount != null &&
        discountType != null) {
      if (discountType == 'amount') {
        price = price! - discount;
      } else if (discountType == 'percent') {
        price =
            price! - ((discount / 100) * price);
      }
    }
    return configModel.currencySymbolPosition ==
        'left'
        ? '${configModel
        .currencySymbol}' '${price!
        .toStringAsFixed(
        configModel.decimalPointSettings!)
        .replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (
        Match m) => '${m[1]},',
    )}'
        : '${price!.toStringAsFixed(
        configModel.decimalPointSettings!)
        .replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (
        Match m) => '${m[1]},',
    )}' ' ${configModel.currencySymbol}';
  }

  static double? convertWithDiscount(
      double? price, double? discount,
      String? discountType) {
    if (discountType == 'amount') {
      price = price! - discount!;
    } else if (discountType == 'percent') {
      price =
          price! - ((discount! / 100) * price);
    }
    return price;
  }

  static double? convertDiscount(
      BuildContext context, double? price,
      double? discount, String? discountType) {
    if (discountType == 'amount') {
      price = discount;
    } else if (discountType == 'percent') {
      price = (discount! / 100) * price!;
    }
    return price;
  }

  static double calculation(double amount,
      double discount, String type,
      int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount') {
      calculatedAmount = discount * quantity;
    } else if (type == 'percent') {
      calculatedAmount =
          (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String getDiscountType(
      {required double? discount, required String? discountType}) {
    return '${discountType == 'percent'
        ? '${discount?.toInt()} %'
        : PriceConverterHelper.convertPrice(
        discount)} ${getTranslated(
        'off', Get.context!)}';
  }


  static double? convertWithTax(
      {double? price, double? tax, String? taxType}) {
    if (taxType == "amount") {
      price = price! - tax!;
    } else if (taxType == "percent") {

    }
    return price;
  }

  static double priceWithAddonsVariation({
    required double basePrice,
    required List<double> addonPrices,
  }) {
    double price = basePrice;
    if (addonPrices != null) {
      for (double addonPrice in addonPrices) {
        price += addonPrice;
      }
    }
    return price;
  }

  static double priceWithAddonsVariationWithoutDiscount({
    required double price,
    required double discount,
    required String discountType,
  }) {
    double priceWithoutDiscount = price;
    if (discountType == 'amount') {
      priceWithoutDiscount -= discount;
    } else if (discountType == 'percent') {
      priceWithoutDiscount -= (discount/100) * price;
    }
    return priceWithoutDiscount;
  }



}