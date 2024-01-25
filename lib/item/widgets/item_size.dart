import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';


class ItemSize extends StatefulWidget {
  const ItemSize({Key? key}) : super(key: key);

  @override
  State<ItemSize> createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {

  @override
  void initState() {
    super.initState();
    getLatestProductList();
  }

  void getLatestProductList() {
    Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1);
  }


  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, child) {
      return
        Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
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
                                Text(getTranslated("size", context)!,style: poppinsRegular,),
                                Text(getTranslated("select_one", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
                              ],
                            ),
                          ),
                        ],
                      ), //const SizedBox(width: 180,),

                      Container(height: Dimensions.containerSizeSmall, width: Dimensions.containerSizeMedium,
                        decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
                        child: Center(child: Text(getTranslated("required", context)!,
                          style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor, fontSize: Dimensions.fontSizeSmall),)),
                      ),
                    ],
                  ),
                ),

                        ]),
                ),
            ),
          ]);
       });

  }
}


