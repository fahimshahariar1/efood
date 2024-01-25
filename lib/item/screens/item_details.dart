
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/item/widgets/item_addons.dart';
import 'package:flutter_restaurant/item/widgets/item_description.dart';
import 'package:flutter_restaurant/item/widgets/item_extras.dart';
import 'package:flutter_restaurant/item/widgets/item_image.dart';
import 'package:flutter_restaurant/item/widgets/item_pricing.dart';
import 'package:flutter_restaurant/item/widgets/item_size.dart';
import 'package:flutter_restaurant/item/widgets/item_info.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);



  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLatestProductList();
  }

  void getLatestProductList() {
    Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1);
  }


  @override
  Widget build(BuildContext context) {
    String imageUrl = Provider.of<SplashProvider>(context).configModel?.baseUrls?.productImageUrl ?? "";


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
                                    const ItemImage(),
                                    Positioned(left: 360, top: Dimensions.paddingSizeLarge,
                                        child: Image.asset(Images.fav))
                                  ]
                              ),


                              const ItemInfo(),

                              const ItemDescription(),

                              const ItemSize(),

                              const ItemExtras(),

                              const ItemAddons()

                            ],
                          ),
                        ],
                      ),

                    ]),
              ),
            ),

            const ItemPricing()

          ],
        );
      },
    );
  }
}
//
