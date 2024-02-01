import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/branch/providers/branch_providers.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
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
      return Container(height: 100, color: Colors.white,

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(getTranslated("branch_info", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor,
                              fontSize: Dimensions.fontSizeExtraSmall)),

                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                            child: Text(getTranslated("address_info", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                                fontSize: 8)),
                          ),
                          Row(
                            children: [
                              Text(getTranslated('minimum_price', context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                                  fontSize: 8),),
                              Text("\$20", style: poppinsRegular.copyWith(color: Colors.black, fontSize: 8),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(transform: Matrix4.translationValues(70, -20, 0),
                      child: Column(
                        children: [

                          Image.asset("assets/image/rlogo.png", height: 40,),

                          Text(getTranslated("km_away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor,
                              fontSize: Dimensions.fontSizeExtraSmall)),
                          Text(getTranslated("away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor,
                              fontSize: 8)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(height: 1, color: Theme.of(context).hintColor,)
            ),


            Container(color: Colors.white,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.watch_later_outlined, color: Theme.of(context).dialogBackgroundColor,size: 10,),
                      Text(getTranslated("20-30 min", context)!, style: poppinsRegular.copyWith(fontSize: 8,
                          color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/image/location_new.png", height: 10,),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                      Text(getTranslated("Location", context)!, style: poppinsRegular.copyWith(decoration: TextDecoration.underline,
                          color: Theme.of(context).dialogBackgroundColor, decorationColor: Theme.of(context).dialogBackgroundColor,
                          fontSize: 8),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_rate_rounded, color: Theme.of(context).highlightColor, size: 10,),
                      Text(getTranslated("rate", context)!, style: poppinsRegular.copyWith(color: Colors.black, fontSize: 8)),
                      const SizedBox(width: 10,),
                      Text(getTranslated("review_info", context)!, style: poppinsRegular.copyWith(decoration: TextDecoration.underline,
                          color: Theme.of(context).dialogBackgroundColor, decorationColor: Theme.of(context).dialogBackgroundColor,
                          fontSize: 8),)
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


