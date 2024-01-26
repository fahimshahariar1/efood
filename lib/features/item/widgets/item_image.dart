import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:provider/provider.dart';

class ItemImage extends StatelessWidget {
  final Product product;

  const ItemImage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        String? baseUrl = splashProvider.configModel?.baseUrls?.productImageUrl;
        String? imageUrl = '';

        if (product.image != null && baseUrl != null) {
          imageUrl = '$baseUrl${product.image}';
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: imageUrl.isEmpty
              ? Image.asset(
            Images.naga,
            fit: BoxFit.cover,
          )
              : CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
    );
  }
}
