import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/item_addons.dart';
import 'package:flutter_restaurant/features/item/widgets/item_description.dart';
import 'package:flutter_restaurant/features/item/widgets/item_extras.dart';
import 'package:flutter_restaurant/features/item/widgets/item_image.dart';
import 'package:flutter_restaurant/features/item/widgets/item_info.dart';
import 'package:flutter_restaurant/features/item/widgets/item_pricing.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';
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

                               ItemExtras(product: widget.product, onVariationSelected: (List<int> value) {  },),

                              ItemAddons(
                                product: widget.product,
                                onAddonsSelected: (List<double> selectedAddonPrices, List<int> selectedAddonQuantities) {
                                  // Calculate the total price based on selected addon prices and quantities
                                  // Update the UI or perform any necessary actions here
                                },
                              )


                            ],
                          ),
                        ],
                      ),

                    ]),
              ),
            ),

             ItemPricing(product: widget.product, selectedAddonPrices: [], selectedAddonQuantities: [],)

          ],
        );
      },
    );
  }
}


