import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class BranchSearch extends StatelessWidget {
  const BranchSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                ),
                hintText: "Search Item",
                hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor),
                prefixIcon: Icon(CupertinoIcons.search, color: Theme.of(context).hintColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
