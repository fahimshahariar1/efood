import 'package:flutter/material.dart';

import 'package:flutter_restaurant/features/order/domain/models/order_details_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemAddons extends StatelessWidget {
  final List<AddOns> addons;

  const ItemAddons({Key? key, required this.addons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
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
                if (addons.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Text(
                      getTranslated('no_addons_available', context)!,
                      style: poppinsRegular,
                    ),
                  ),
                for (AddOns addon in addons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (_) {},
                          ),
                          Text(addon.name!, style: poppinsRegular),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: Dimensions.paddingSizeSmall,
                        ),
                        child: Text(addon.price.toString()),
                      )
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
