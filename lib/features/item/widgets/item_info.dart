import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';

import 'package:flutter_restaurant/localization/language_constrants.dart';

import 'package:flutter_restaurant/utill/dimensions.dart';

import 'package:flutter_restaurant/utill/styles.dart';



class ItemInfo extends StatefulWidget {
  final Product product;

  const ItemInfo({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -50, 0),
      height: Dimensions.containerSizeMedium,
      width: Dimensions.containerSizeOverLarge,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault, left: Dimensions.paddingSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${widget.product.name}", style: poppinsRegular.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                Row(
                  children: [
                    Text(getTranslated('rate', context)!, style: rubikRegular),
                    Icon(Icons.star_rounded, color: Theme.of(context).highlightColor, size: Dimensions.radiusLarge),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Text('${widget.product.discount}', style: rubikRegular.copyWith(decoration: TextDecoration.lineThrough, color: Theme.of(context).hintColor)),
              const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
              Padding(
                padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                child: Text('${widget.product.price}', style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}