import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

import 'package:provider/provider.dart';

class ItemAddons extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, child){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: SizedBox(width: double.infinity,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: Dimensions.paddingSizeSmall,
                        top: Dimensions.paddingSizeSmall,
                      ),
                      child: Text(
                        getTranslated('addons', context)!,
                        style: poppinsRegular,
                      ),
                    ),
                    Text(productProvider.product.)
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },);
  }
}


