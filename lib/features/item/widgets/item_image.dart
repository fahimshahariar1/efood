
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';

import 'package:provider/provider.dart';

class ItemImage extends StatelessWidget {
  final Product product;

  const ItemImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        String? baseUrl = splashProvider.configModel?.baseUrls?.productImageUrl;


        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child : CustomImageWidget(image: '$baseUrl/${product.image?.first}', fit: BoxFit.contain,),

        );

      },
    );
  }
}
