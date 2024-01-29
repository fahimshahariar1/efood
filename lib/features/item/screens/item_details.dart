import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/item_addons.dart';
import 'package:flutter_restaurant/features/item/widgets/item_description.dart';
import 'package:flutter_restaurant/features/item/widgets/item_extras.dart';
import 'package:flutter_restaurant/features/item/widgets/item_image.dart';
import 'package:flutter_restaurant/features/item/widgets/item_info.dart';
import 'package:flutter_restaurant/features/item/widgets/item_pricing.dart';
import 'package:flutter_restaurant/features/item/widgets/item_size.dart';

import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  final Product product;

  const ItemDetails({Key? key, required this.product}) : super(key: key);



  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {




  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child){
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Stack(
                                  children: [
                                     ItemImage(product: widget.product,),
                                    Positioned(left: 360, top: Dimensions.paddingSizeLarge,
                                        child: Image.asset(Images.fav))
                                  ]
                              ),


                               ItemInfo(product: widget.product,),

                               ItemDescription(product: widget.product,),

                               ItemSize(product: widget.product,),

                               ItemExtras(product: widget.product,),

                               ItemAddons(product: widget.product,)

                            ],
                          ),
                        ],
                      ),

                    ]),
              ),
            ),

             ItemPricing(product: widget.product,)

          ],
        );
      },
    );
  }
}


