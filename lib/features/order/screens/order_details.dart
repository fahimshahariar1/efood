
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/order/widgets/item_details.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';

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

              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(isScrollControlled: true,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
                        context: context, builder: (BuildContext context){
                      return Container(

                         height: 650,
                        child: ItemDetails(),

                      );
                    });


                    // DraggableScrollableSheet(expand: true,
                    //   builder: (context, controller) {
                    //   return ItemDetails();
                    // },);

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



//floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//
//       floatingActionButton: Center(child: Padding(
//     padding: const EdgeInsets.only(bottom: 200),
//     child: Material( elevation: 1, borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//       child: Container(height: 75, width: 350,
//       decoration: BoxDecoration(color: Colors.white,
//           borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)
//       ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge, left: Dimensions.paddingSizeLarge),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(getTranslated("food_name", context)!, style: poppinsRegular.copyWith(fontWeight: FontWeight.bold),),
//                   SizedBox(height: Dimensions.paddingSizeExtraSmall,),
//                   Row(
//                     children: [
//                       Text(getTranslated("rate", context)!, style: rubikRegular,),
//                       Icon(Icons.star_rounded, color: Theme.of(context).highlightColor, size: Dimensions.radiusLarge,),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Text(getTranslated("discount_price", context)!,style: rubikRegular.copyWith(decoration: TextDecoration.lineThrough,
//                     color: Theme.of(context).hintColor),),
//                 SizedBox(width: Dimensions.paddingSizeExtraSmall,),
//                 Padding(
//                   padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
//                   child: Text(getTranslated("pricing", context)!, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge, ),),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     )),
