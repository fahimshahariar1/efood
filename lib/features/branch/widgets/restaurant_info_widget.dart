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
      return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                    child: Text(getTranslated("branch_info", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor,
                        fontSize: Dimensions.fontSizeLarge, fontWeight: FontWeight.w600)),
                  ),
                  Container(transform: Matrix4.translationValues(0, -20, 0),
                      child: Image.asset('assets/image/rlogo.png')),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("address_info", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor)),
                      ),
                      Row(
                        children: [
                          Text(getTranslated('minimum_price', context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor),),
                          const Text("\$20", style: poppinsRegular,),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(getTranslated("km_away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor)),
                      Text(getTranslated("away", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),
              child: Divider(),
            ),


            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.watch_later_outlined, color: Theme.of(context).dialogBackgroundColor,),
                    Text(getTranslated("20-30 min", context)!, style: poppinsRegular,)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: Theme.of(context).dialogBackgroundColor,),
                    Text(getTranslated("Location", context)!, style: poppinsRegular.copyWith(decoration: TextDecoration.underline,
                        color: Theme.of(context).dialogBackgroundColor, decorationColor: Theme.of(context).dialogBackgroundColor),)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star_rate_rounded, color: Theme.of(context).highlightColor, size: 15,),
                    Text(getTranslated("rate", context)!, style: poppinsRegular),
                    const SizedBox(width: 10,),
                    Text(getTranslated("review_info", context)!, style: poppinsRegular.copyWith(decoration: TextDecoration.underline,
                        color: Theme.of(context).dialogBackgroundColor, decorationColor: Theme.of(context).dialogBackgroundColor),)
                  ],
                ),
              ],
            )

          ]

      );
    },);
  }
}


