import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemExtras extends StatelessWidget {
  final Product product;

  const ItemExtras({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Variation variation = product.variations![0]; // Get the first variation

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        variation. ?? '',
                        style: poppinsRegular,
                      ),
                      if (variation.type == 'multi')
                        Text(
                          getTranslated('select_min_max', context)!,
                          style: poppinsRegular.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                          ),
                        ),
                    ],
                  ),
                ),
                // Render rows
                for (int i = 0; i < variation.type!.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Use radio for single, checkbox for multi
                          if (variation.type == 'single')
                            Radio(
                              value: i,
                              groupValue: 0,
                              onChanged: (value) {},
                            )
                          else
                            Checkbox(
                              value: false,
                              onChanged: (_) {},
                            ),
                          Text(
                            variation.values![i].label ?? '',
                            style: poppinsRegular,
                          )
                        ],
                      ),
                      Text(variation.values![i].price ?? ''),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
