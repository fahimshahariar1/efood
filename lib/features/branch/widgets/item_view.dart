import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class ItemView extends StatefulWidget {
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
    this.imgBaseUrl,
  }) : super(key: key);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = "${widget.imgBaseUrl}/${widget.imagePath}";
    imageUrl = imageUrl.replaceAll('[', '').replaceAll(']', '');

    if (kDebugMode) {
      print("Image URL: $imageUrl");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.containerSizeLarge,
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
        child: Card(
          child: Column(
            children: [
              Image.network(imageUrl, fit: BoxFit.cover, height: 80, width: double.infinity,
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall,),

              Container(height: 24, width: 76, transform: Matrix4.translationValues(0, -22, 0),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                color: Theme.of(context).highlightColor
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: Dimensions.paddingSizeDefault, width: Dimensions.paddingSizeDefault,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: Icon(Icons.remove,size: 12, color: Theme.of(context).highlightColor,)),

                    const Text("1"),

                    Container(height: Dimensions.paddingSizeDefault, width: Dimensions.paddingSizeDefault,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: Icon(Icons.add, size: 12, color: Theme.of(context).highlightColor,)),
                  ],
              ),
              ),
              Text(widget.name!, maxLines: 1,
                style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeDefault, ),),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getTranslated("rate", context)!),
                  Icon(Icons.star_rate_rounded, color: Theme.of(context).highlightColor, size: 15,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("\$${widget.discountPrice}", style: rubikMedium.copyWith(decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey, color: Colors.grey,
                    ),
                  ),
                  Text("\$${widget.price}", style: rubikRegular,),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
