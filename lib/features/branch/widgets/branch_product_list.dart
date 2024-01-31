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
        SizedBox(width: 360, height: 50,
          child: TextField(decoration: InputDecoration(enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).hintColor)
          ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
              hintText: "Search Item",hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor),
              prefixIcon: Icon(CupertinoIcons.search, color: Theme.of(context).hintColor,)
          )),
        ),

        Row(
          children: [
            Text("Popular"),
            Text("Chef's Choices"),
            Text("Todays Deal"),
            Text("Burger"),
            Text("Random"),
          ],
        ),

        const OrderDetails(),
      ],
    );
  }
}
