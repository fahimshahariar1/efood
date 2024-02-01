import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/order/screens/order_details.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class BranchProduct extends StatefulWidget {
  const BranchProduct({Key? key}) : super(key: key);


  @override
  State<BranchProduct> createState() => _BranchProductState();
}

class _BranchProductState extends State<BranchProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

         const SizedBox(height: Dimensions.paddingSizeSmall),
         SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(getTranslated('popular', context)!, style: poppinsRegular.copyWith(
                      color: Theme.of(context).dialogBackgroundColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      decorationColor: Theme.of(context).dialogBackgroundColor,
                    )),

                    const SizedBox(width: Dimensions.paddingSizeDefault),

                    Text(getTranslated('chefs_choice', context)!,
                      style: poppinsRegular.copyWith(color: Theme.of(context).hintColor)),

                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Text(getTranslated('todays_deal', context)!,
                        style: poppinsRegular.copyWith(color: Theme.of(context).hintColor)),

                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Text(getTranslated('burger', context)!,
                        style: poppinsRegular.copyWith(color: Theme.of(context).hintColor)),

                    const SizedBox(width: Dimensions.paddingSizeDefault),
                    Text(getTranslated('random', context)!,
                        style: poppinsRegular.copyWith(color: Theme.of(context).hintColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const OrderDetails()
      ],
    );
  }
}
