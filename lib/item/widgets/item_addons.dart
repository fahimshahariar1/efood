import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';


class ItemAddons extends StatefulWidget {
  const ItemAddons({Key? key}) : super(key: key);



  @override
  State<ItemAddons> createState() => _ItemAddonsState();
}

class _ItemAddonsState extends State<ItemAddons> {


  bool isAdded = false;


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
                  padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall, top: Dimensions.paddingSizeSmall),
                  child: Text(getTranslated("addons", context)!, style: poppinsRegular,),
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(activeColor: Theme.of(context).dialogBackgroundColor,value: isAdded, onChanged: (value){
                              setState(() {
                                isAdded = value!;
                              });
                            }),
                            Text(getTranslated("pepsi", context)!, style: poppinsRegular,),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: Row(
                            children: [
                              Text(getTranslated('small_price', context)!),
                              const SizedBox(width: Dimensions.paddingSizeSmall,),
                              Container(height: Dimensions.containerSizeSmallest, width: Dimensions.containerSizeMedium,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                                  color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall),
                                        child: Icon(CupertinoIcons.trash, size: Dimensions.paddingSizeDefault, color: Theme.of(context).dialogBackgroundColor,),
                                      ),
                                      Text("1", style: poppinsRegular,),
                                      Padding(
                                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
                                        child: Icon(Icons.add, size: Dimensions.paddingSizeDefault, color: Theme.of(context).dialogBackgroundColor,),
                                      ),
                                    ],
                                  ),
                                ),),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(activeColor: Theme.of(context).dialogBackgroundColor,value: isAdded, onChanged: (value){
                              setState(() {
                                isAdded = value!;
                              });
                            }),
                            Text(getTranslated("chicken", context)!, style: poppinsRegular,),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: Row(
                            children: [
                              Text(getTranslated('chicken_price', context)!),
                              SizedBox(width: Dimensions.paddingSizeSmall,),


                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(activeColor: Theme.of(context).dialogBackgroundColor,value: isAdded, onChanged: (value){
                              setState(() {
                                isAdded = value!;
                              });
                            }),
                            Text(getTranslated("Sauce", context)!, style: poppinsRegular,),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                          child: Row(
                            children: [
                              Text(getTranslated('sauce_price', context)!),
                              SizedBox(width: Dimensions.paddingSizeSmall,),


                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
