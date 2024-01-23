import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemDetails extends StatefulWidget {


  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  bool isChecked = false;

  bool isAdded = false;

  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar:  BottomAppBar(

        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(getTranslated("total", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
                    SizedBox(width: Dimensions.paddingSizeSmall,),
                    Text(getTranslated("vat", context)!, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                  ],
                ),
                Text(getTranslated("total_price", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
              ],
            ),
            SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 28, width: 28, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2)),
                      child: Icon(Icons.remove_rounded, color: Theme.of(context).hintColor,size: 15,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("1",style: rubikMedium,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        height: 28, width: 28, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).dialogBackgroundColor),
                        child: Icon(Icons.add, color: Colors.white,size: 15,),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30, width: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Theme.of(context).dialogBackgroundColor),
                  child: Center(child: Text(getTranslated("add_to_cart", context)!, style: poppinsRegular.copyWith(color: Colors.white),)),
                ),


              ],
            )
          ],
        ),


      ),
        body: SingleChildScrollView(
              child: Column(
              children: [
                Column(
                children: [
                  Stack(
                    children: [ClipRRect(borderRadius: const BorderRadius.only(topRight: Radius.circular(Dimensions.radiusExtraLarge), topLeft: Radius.circular(Dimensions.radiusExtraLarge)),
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
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
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
                                Container(height: 30, width: 70,
                                  decoration: BoxDecoration(color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
                                  child: Center(child: Text(getTranslated("required", context)!,
                                    style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor, fontSize: Dimensions.fontSizeSmall),)),
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
                          ),


                        ],
                      ),
                    ),
                  ), //size part

                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                            child: Padding(
                              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(getTranslated("salad", context)!, style: poppinsRegular,),
                                  Text(getTranslated("selected", context)!, style: poppinsRegular.copyWith(fontSize: 12),),
                                ],
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Theme.of(context).dialogBackgroundColor,
                                      value: isChecked, onChanged: (value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                                  Text(getTranslated("cucumber", context)!, style: poppinsRegular,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Text(getTranslated("small_price", context)!),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Theme.of(context).dialogBackgroundColor,
                                      value: isChecked, onChanged: (value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                                  Text(getTranslated("tomato_tango", context)!, style: poppinsRegular,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Text(getTranslated("small_price", context)!),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Theme.of(context).dialogBackgroundColor,
                                      value: isChecked, onChanged: (value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                                  Text(getTranslated("mayo", context)!, style: poppinsRegular,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Text(getTranslated("small_price", context)!),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Theme.of(context).dialogBackgroundColor,
                                      value: isChecked, onChanged: (value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                                  Text(getTranslated("cheese", context)!, style: poppinsRegular,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Text(getTranslated("small_price", context)!),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Theme.of(context).dialogBackgroundColor,
                                      value: isChecked, onChanged: (value){
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                                  Text(getTranslated("sauce", context)!, style: poppinsRegular,),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                                child: Text(getTranslated("small_price", context)!),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ), //selecting part

                  Card(
                    child: Column(
                      children: [
                        Text(getTranslated("addons", context)!),

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
                                      Text(getTranslated('pepsi_price', context)!),
                                      SizedBox(width: Dimensions.paddingSizeSmall,),
                                      Container(height: 22, width: 70, decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                                        color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Icon(CupertinoIcons.trash, size: 15, color: Theme.of(context).dialogBackgroundColor,),
                                            ),
                                            Text("1", style: poppinsRegular,),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 5),
                                              child: Icon(Icons.add, size: 15, color: Theme.of(context).dialogBackgroundColor,),
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
                  )

                  ],
                        ),
              ],
                              ),
            ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton:  Center(child: Padding(
    padding: const EdgeInsets.only(bottom: 50),
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


