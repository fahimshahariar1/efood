import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class ItemExtras extends StatefulWidget {
  const ItemExtras({Key? key}) : super(key: key);

  @override
  State<ItemExtras> createState() => _ItemExtrasState();
}

class _ItemExtrasState extends State<ItemExtras> {



  bool isChecked = false;


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
    return Consumer<ProductProvider> (builder: (context, productProvider, child){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                    child: Padding(
                      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${productProvider.latestProductModel?.products?[1].variations}", style: poppinsRegular,),
                          Text(getTranslated("selected", context)!, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Theme.of(context).dialogBackgroundColor,
                              value: isChecked, onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          Text(getTranslated("cucumber", context)!, style: poppinsRegular,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("small_price", context)!),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Theme.of(context).dialogBackgroundColor,
                              value: isChecked, onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          Text(getTranslated("tomato_tango", context)!, style: poppinsRegular,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("small_price", context)!),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Theme.of(context).dialogBackgroundColor,
                              value: isChecked, onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          Text(getTranslated("mayo", context)!, style: poppinsRegular,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("small_price", context)!),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Theme.of(context).dialogBackgroundColor,
                              value: isChecked, onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          Text(getTranslated("cheese", context)!, style: poppinsRegular,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("small_price", context)!),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Theme.of(context).dialogBackgroundColor,
                              value: isChecked, onChanged: (value){
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          Text(getTranslated("sauce", context)!, style: poppinsRegular,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: Dimensions.paddingSizeSmall),
                        child: Text(getTranslated("small_price", context)!),
                      )
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productProvider.latestProductModel?.products?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final product = productProvider.latestProductModel?.products?[index];

                      // Accessing the "variations" field from the product
                      final List<Variation>? variations = product?.variations;

                      // Now, you can iterate over the variations and display the types
                      if (variations != null && variations.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product: ${product?.name ?? ''}"),
                            for (var variation in variations)
                              if (variation.values != null && variation.values!.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Type: ${variation.type ?? ''}"),
                                    for (var value in variation.values!)
                                      ListTile(
                                        title: Text("Label: ${value.label ?? ''}"),
                                        subtitle: Text("Option Price: ${value.optionPrice ?? ''}"),
                                        // Add more information as needed
                                      ),
                                    // Add more widgets or customize as needed
                                  ],
                                ),
                          ],
                        );
                      } else {
                        // Handle the case where there are no variations
                        return Text("No variations available for ${product?.name ?? ''}");
                      }
                    },
                  )



                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}


//there are two types of variation based on product, how to fetch and display