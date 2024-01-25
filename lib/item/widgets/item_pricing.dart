import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class ItemPricing extends StatefulWidget {
  const ItemPricing({Key? key}) : super(key: key);



  @override
  State<ItemPricing> createState() => _ItemPricingState();
}

class _ItemPricingState extends State<ItemPricing> {


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
    return Consumer<ProductProvider>(builder: (context, productProvider, child) {
      return
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(getTranslated("total", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
                          const SizedBox(width: Dimensions.paddingSizeSmall,),
                          Text(getTranslated("vat", context)!, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                        ],
                      ),
                      Text(getTranslated("total_price", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 28, width: 28, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2)),
                            child: Icon(Icons.remove_rounded, color: Theme.of(context).hintColor,size: 15,),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("1",style: rubikMedium,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 28, width: 28, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).dialogBackgroundColor),
                              child: const Icon(Icons.add, color: Colors.white,size: 15,),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30, width: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Theme.of(context).dialogBackgroundColor),
                        child: Center(child: Text(getTranslated("add_to_cart", context)!, style: poppinsRegular.copyWith(color: Colors.white),)),
                      ),


                    ],
                  )
                ],
              ),
            )
          ],
        );
    });
  }
}



