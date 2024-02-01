import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/branch/providers/branch_providers.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';
import 'package:flutter_restaurant/util/styles.dart';
import 'package:provider/provider.dart';

class RestaurantInfo extends StatefulWidget {
  const RestaurantInfo({Key? key}) : super(key: key);

  @override
  State<RestaurantInfo> createState() => _RestaurantInfoState();
}

class _RestaurantInfoState extends State<RestaurantInfo> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBranchDetails();
  }

  void getBranchDetails(){
    Provider.of<BranchProvider>(context, listen: false).getBranches();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BranchProvider>(builder: (context, branchProvider, child){
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.paddingSizeDefault),
                topLeft: Radius.circular(Dimensions.paddingSizeDefault),
            )
        ),

        child: Column(
          children: [

            Text(getTranslated("branch_info", context)!, style: poppinsRegular.copyWith(
              color: Theme.of(context).dialogBackgroundColor,
                fontSize: Dimensions.fontSizeExtraSmall, fontWeight: FontWeight.bold,
            )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.fontSizeExtraSmallest),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          const SizedBox(height: Dimensions.paddingSizeExtraSmall,),

                          Text(getTranslated("address_info", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                              fontSize: Dimensions.fontSizeExtraSmallest)),
                          const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                          Row(
                            children: [
                              Text(getTranslated('minimum_price', context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                                  fontSize: Dimensions.fontSizeExtraSmallest),),
                              Text(getTranslated("start", context)!, style: poppinsRegular.copyWith(color: Colors.black, fontSize: 8),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      transform: Matrix4.translationValues(70, -20, 0),
                      child: Column(
                        children: [

                          Image.asset(Images.restaurantLogo, height: Dimensions.paddingSizeMediumLarge,),

                          const SizedBox(
                            height: Dimensions.paddingSizeSmall,
                          ),


                          Text(getTranslated("km_away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor,
                              fontSize: Dimensions.fontSizeExtraSmall)),
                          Padding(
                            padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                            child: Text(getTranslated("away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                                fontSize: 6)),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),

            Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Container(height: 1, color: Colors.grey.withOpacity(0.2))),

            const SizedBox(height: Dimensions.paddingSizeSmall),


            Container(color: Colors.white,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined, color: Theme.of(context).dialogBackgroundColor,size: Dimensions.fontSizeDefault),
                      const SizedBox(width: 2,),
                      Text(getTranslated("20-30 min", context)!, style: poppinsRegular.copyWith(fontSize: 8,
                          color: Colors.black),)]),

                  Row(
                    children: [
                      Image.asset(Images.locationNew, height: Dimensions.paddingSizeSmall,),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                      Text(getTranslated("Location", context)!, style: poppinsRegular.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).dialogBackgroundColor,
                        decorationColor: Theme.of(context).dialogBackgroundColor,
                        fontSize: Dimensions.fontSizeExtraSmall,
                      )),

                    ]),

                  Row(
                    children: [
                      Icon(Icons.star_rate_rounded, color: Theme.of(context).highlightColor, size: Dimensions.paddingSizeSmall,),
                      Text(getTranslated("rate", context)!, style: poppinsRegular.copyWith(color: Colors.black, fontSize: Dimensions.fontSizeExtraSmallest)),
                      const SizedBox(width: Dimensions.paddingSizeSmall,),
                      Text(getTranslated("review_info", context)!, style: poppinsRegular.copyWith(decoration: TextDecoration.underline,
                          color: Theme.of(context).dialogBackgroundColor, decorationColor: Theme.of(context).dialogBackgroundColor,
                          fontSize: Dimensions.fontSizeExtraSmallest))
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),

      );
    },);
  }
}


