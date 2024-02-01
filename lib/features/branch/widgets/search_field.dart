import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class Search extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
          ),
          hintText: "Search Item",
          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor),
          prefixIcon: Icon(CupertinoIcons.search, color: Theme.of(context).hintColor,),
        ),
      ),
    );

  }
}
