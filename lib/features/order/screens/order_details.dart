
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/order/widgets/item_details.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:http/http.dart';

class OrderDetails extends StatefulWidget {


  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeLargest),
            child: Column(
mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    showModalBottomSheet(isScrollControlled: true,shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                        topRight: Radius.circular(Dimensions.radiusExtraLarge))),
                        context: context, builder: (BuildContext context){
                      return Container(

                         height: 650,
                        child: ItemDetails(),

                      );
                    });

                  },
                  child: itemView(Images.food, getTranslated("food_name", context), getTranslated("rate", context),
                      getTranslated("pricing", context), getTranslated("discount_price", context)),
                ),
                const SizedBox(height: Dimensions.paddingSizeLarge,),

                itemView(Images.food, getTranslated("food_name", context), getTranslated("rate", context),
                    getTranslated("pricing", context), getTranslated("discount_price", context)),



              ],
            ),
          ),
    );

  }
}


Widget itemView (String? imagePath, String? name, String? rating, String? price, String? discountPrice) {
  return Container(height: Dimensions.containerSizeLarge,
    child: Card(
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(Dimensions.radiusDefault),child: Image.asset(imagePath!)),
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: Column(
              children: [
                Text(name!),
                Text(rating!),
                Row(
                  children: [
                    Text(discountPrice!),
                    SizedBox(width: Dimensions.paddingSizeLarge,),
                    Text(price!),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

