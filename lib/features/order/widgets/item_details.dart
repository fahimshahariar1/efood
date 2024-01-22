import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemDetails extends StatefulWidget {


  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radiusLarge), topLeft: Radius.circular(Dimensions.radiusLarge)),
                child: Image.asset(Images.naga)),
            Positioned(left: 360, top: 20,
                child: Image.asset(Images.fav))
            ]
          ),

          SizedBox(height:  60,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMediumLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated("description", context)!, style: poppinsRegular.copyWith(fontWeight: FontWeight.w700,),),
                Row(
                  children: [
                    Container(decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor, borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(Images.nonveg, height: Dimensions.paddingSizeExtraLarge,),
                          ),
                          //SizedBox(width: Dimensions.paddingSizeSmall,),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(getTranslated("non_veg", context)!,style: poppinsRegular),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeLarge,),
          Text(getTranslated("details_description", context)!),


          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Center(child: Padding(
    padding: const EdgeInsets.only(bottom: 70),
    child: Material( elevation: 1, borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
      child: Container(height: 75, width: 350,
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge, left: Dimensions.paddingSizeLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getTranslated("food_name", context)!, style: poppinsRegular.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                  Row(
                    children: [
                      Text(getTranslated("rate", context)!, style: rubikRegular,),
                      Icon(Icons.star_rounded, color: Theme.of(context).highlightColor, size: Dimensions.radiusLarge,),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(getTranslated("discount_price", context)!,style: rubikRegular.copyWith(decoration: TextDecoration.lineThrough,
                    color: Theme.of(context).hintColor),),
                SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                Padding(
                  padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                  child: Text(getTranslated("pricing", context)!, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge, ),),
                ),
              ],
            ),
          ],
        ),
      ),
    )),
    ));
  }
}
