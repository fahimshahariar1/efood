import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class ItemDescription extends StatefulWidget {
  const ItemDescription({Key? key}) : super(key: key);

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLatestProductList();
  }

  void getLatestProductList() {
    Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1);
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, productProvider, child) {

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMediumLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated("description", context)!, style: poppinsRegular.copyWith(fontWeight: FontWeight.w700,fontSize: Dimensions.fontSizeDefault),),

                Row(
                  children: [
                    Container(decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2), borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                            child: Image.asset(Images.nonveg, height: Dimensions.paddingSizeExtraLarge,),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                            child: Text(getTranslated("non_veg", context)!,style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeDefault,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Text(productProvider.latestProductModel?.products?[0].description  ?? '',style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
          )
        ],
      );

    });
  }
}


