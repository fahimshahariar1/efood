import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/order/screens/order_details.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class BranchProduct extends StatefulWidget {
  const BranchProduct({Key? key}) : super(key: key);


  @override
  State<BranchProduct> createState() => _BranchProductState();
}

class _BranchProductState extends State<BranchProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(height: Dimensions.paddingSizeDefault),
         SingleChildScrollView( scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular", style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor, decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).dialogBackgroundColor),),
                SizedBox(width: Dimensions.paddingSizeDefault,),
                Text("Chef's Choices", style: poppinsRegular,),
                SizedBox(width: Dimensions.paddingSizeDefault,),
                Text("Today's Deal", style: poppinsRegular,),
                SizedBox(width: Dimensions.paddingSizeDefault,),
                Text("Burger", style: poppinsRegular,),
                SizedBox(width: Dimensions.paddingSizeDefault,),
                Text("Random", style: poppinsRegular,),
                SizedBox(width: Dimensions.paddingSizeDefault,),
              ],
            ),
          ),
        ),

        const OrderDetails(),
      ],
    );
  }
}
