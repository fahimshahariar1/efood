import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';


class ItemDescription extends StatelessWidget {
  final Product product;

  const ItemDescription({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMediumLarge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated('description', context)!,
                style: poppinsRegular.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: Dimensions.fontSizeDefault
                ),
              ),
              Row(children: [
                Container( width: Dimensions.containerSizeMedium, height: Dimensions.containerSizeSmallest,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
                  ),
                  child: Column(
                    children: [
                      product.productType == "veg" ?
                      Center(
                        child: Text(
                          "${product.productType?.toUpperCase()}",
                          style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeSmall),
                        ),
                      ) : Text(getTranslated("non_veg", context)!.toUpperCase())
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.paddingSizeDefault),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Text(product.description?? '',
            style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
          ),
        )
      ],
    );
  }
}