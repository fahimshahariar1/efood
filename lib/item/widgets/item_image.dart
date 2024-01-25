import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:provider/provider.dart';

class ItemImage extends StatefulWidget {
  const ItemImage({Key? key}) : super(key: key);

  @override
  State<ItemImage> createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  String? imgBaseUrl;

  @override
  void initState() {
    super.initState();
    getLatestProductList();
  }

  void getLatestProductList() {
    Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1);
  }

  @override
  Widget build(BuildContext context) {
    final imgBaseUrl = Provider.of<SplashProvider>(context).configModel?.baseUrls?.productImageUrl ?? "";
    final latestProductModel = Provider.of<ProductProvider>(context).latestProductModel;

    final imageUrl = latestProductModel?.products?.isNotEmpty == true
        ? "$imgBaseUrl/${latestProductModel!.products![0].image?.first}" : '';

    if (kDebugMode) {
      print(imageUrl);
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(Dimensions.radiusExtraLarge),
        topLeft: Radius.circular(Dimensions.radiusExtraLarge),
      ),
      child: imageUrl.isNotEmpty ? Image.network(imageUrl)
          : const Text("No Image Found"),
    );
  }
}
