import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemSize extends StatelessWidget {
  final Product product;

  const ItemSize({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> sizeList = [];

    if (product.variations != null && product.variations!.isNotEmpty) {
      for (Variation variation in product.variations!) {
        if (variation.type != null) {
          sizeList.add(
            ListTile(
              title: Text(variation.type?.toUpperCase() ?? ''),
            ),
          );
        }
      }
    }

    return Column(
      children: [
        const SizedBox(height: Dimensions.paddingSizeExtraLarge),
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getTranslated('size', context) ?? '',
                                  style: poppinsRegular,
                                ),
                                Text(
                                  getTranslated('select_one', context) ?? '',
                                  style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Dimensions.containerSizeSmall,
                        width: Dimensions.containerSizeMedium,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                        ),
                        child: Center(
                          child: Text(
                            getTranslated('required', context) ?? '',
                            style: poppinsRegular.copyWith(
                              color: Theme.of(context).dialogBackgroundColor,
                              fontSize: Dimensions.fontSizeSmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizeList.isNotEmpty ? Column(children: sizeList) : Text(getTranslated('no_sizes_available', context) ?? ''),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
