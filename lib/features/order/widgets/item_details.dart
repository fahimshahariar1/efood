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

  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radiusExtraLarge), topLeft: Radius.circular(Dimensions.radiusExtraLarge)),
                child: Image.asset(Images.naga)),
            Positioned(left: 360, top: 20,
                child: Image.asset(Images.fav))
            ]
          ),

          const SizedBox(height:  60,),

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
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(Images.nonveg, height: Dimensions.paddingSizeExtraLarge,),
                          ),
                          //SizedBox(width: Dimensions.paddingSizeSmall,),
                          Padding(
                            padding: const EdgeInsets.all(8),
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(getTranslated("details_description", context)!,style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
          ),

          const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
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
                      SizedBox(width: 180,),
                      Container(height: 30, width: 80,
                        decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
                        child: Center(child: Text(getTranslated("required", context)!,
                          style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),)),
                      )

                    ],
                  ),
                ),


                Column(
                  children: [

                    ListTile(
                      title: Text(getTranslated("small", context)!, style: poppinsRegular,),
                      leading: Radio(activeColor: Theme.of(context).hintColor,
                          value: 1, groupValue: selectedOption, onChanged: (value){
                        setState(() {

                        });
                      }),
                      trailing: Text(getTranslated("small_price", context)!),
                    ),
                    ListTile(
                      title: Text(getTranslated("medium", context)!, style: poppinsRegular,),
                      leading: Radio(activeColor: Theme.of(context).hintColor,
                          value: 2, groupValue: selectedOption, onChanged: (value){
                        setState(() {

                        });
                      }),
                      trailing: Text(getTranslated("small_price", context)!),
                    ),
                    ListTile(
                      title: Text(getTranslated("large", context)!, style: poppinsRegular,),
                      leading: Radio(activeColor: Theme.of(context).hintColor,
                          value: 3, groupValue: selectedOption, onChanged: (value){
                        setState(() {

                        });
                      }),
                      trailing: Text(getTranslated("small_price", context)!),
                    ),


                  ],
                )


              ],
            ),
          ),

          Card(
            child: Column(
              children: [
                Text(getTranslated("salad", context)!),
                Text(getTranslated("selected", context)!),
              ],
            ),
          )


          ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Center(child: Padding(
    padding: const EdgeInsets.only(bottom: 200),
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
