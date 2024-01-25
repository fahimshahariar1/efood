import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class ItemInfo extends StatefulWidget {
  const ItemInfo({Key? key}) : super(key: key);

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {


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
        Container(transform: Matrix4.translationValues(0, -50, 0),
          height: Dimensions.containerSizeMedium, width: Dimensions.containerSizeOverLarge,
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault, left: Dimensions.paddingSizeLarge),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productProvider.latestProductModel?.products?[0].name ?? '', style: poppinsRegular.copyWith(fontWeight: FontWeight.bold),),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall,),
                    Row(
                      children: [
                        Text(getTranslated("rate", context)!, style: rubikRegular,),
                        Icon(Icons.star_rounded, color: Theme.of(context).highlightColor, size: Dimensions.radiusLarge,),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text('${productProvider.latestProductModel?.products?[0].discount ?? ''}',style: rubikRegular.copyWith(decoration: TextDecoration.lineThrough,
                      color: Theme.of(context).hintColor),),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                  Padding(
                    padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                    child: Text('${productProvider.latestProductModel?.products?[0].price ?? ''}', style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge, ),),
                  ),
                ],
              ),
            ],
          ),
        );
    });
  }
}

