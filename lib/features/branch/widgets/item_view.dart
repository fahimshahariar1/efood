import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/helper/price_converter_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';
import 'package:flutter_restaurant/util/styles.dart';

class ItemView extends StatefulWidget {

  final Product? product;
  final String imagePath;
  final String? name;
  final String? price;
  final String? discountPrice;
  final String? imgBaseUrl;

  const ItemView({
    Key? key,
    required this.imagePath,
    this.name,
    this.price,
    this.discountPrice,
    this.imgBaseUrl, this.product,
  }) : super(key: key);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = "${widget.imgBaseUrl}/${widget.imagePath[0]}";
    imageUrl = imageUrl.replaceAll('[', '').replaceAll(']', '');

    if (kDebugMode) {
      print("Image URL: $imageUrl");
    }
  }

  @override
  Widget build(BuildContext context) {

    double? discountedPrice = PriceConverterHelper.convertWithDiscount(widget.product?.price!, widget.product?.discount, widget.product?.discountType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      child:  Card(
          child: Column(children: [

            Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(5),
                    child: Image.network(imageUrl, fit: BoxFit.cover, height: Dimensions.containerSizeMediumLarge, width: double.infinity,)),

                Positioned(
                  top: 10, right: 15,
                  child: Icon(Icons.favorite, size: Dimensions.paddingSizeDefault, color: Theme.of(context).cardColor,),
                ),
              ],
            ),

                const SizedBox(height: Dimensions.paddingSizeSmall),



            Container(height: Dimensions.paddingSizeLarge, width: 76, transform: Matrix4.translationValues(0, -22, 0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
              color: Colors.white),

            child:  Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(height: Dimensions.paddingSizeDefault, width: Dimensions.paddingSizeDefault,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault), color: Theme.of(context).primaryColor),
                      child: const Icon(Icons.add,size: Dimensions.fontSizeSmall, color:Colors.white,)),
                const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                Text(getTranslated("Add", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).primaryColor),)
              ])),



            Flexible(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Flexible(
                    child: Text(widget.name!, maxLines: 1,
                      style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault, overflow: TextOverflow.ellipsis))),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall,),

                  Image.asset(Images.vector, height: Dimensions.paddingSizeSmall, width: Dimensions.paddingSizeSmall)
                ])),

            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getTranslated("rate", context)!),
                Icon(Icons.star_rate_rounded, color: Theme.of(context).highlightColor, size: Dimensions.paddingSizeDefault),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("\$${widget.price}", style: rubikMedium.copyWith(decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey, color: Colors.grey)),
                Text("\$$discountedPrice", style: rubikRegular),
              ],
            ),],

          ),

      ),
    );
  }
}
