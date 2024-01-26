import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';

import 'package:flutter_restaurant/common/widgets/paginated_list_view.dart';
import 'package:flutter_restaurant/features/item/screens/item_details.dart';

import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/images.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  final ProductFilterType? filterType;

  const OrderDetails({Key? key, this.filterType}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  ScrollController scrollController = ScrollController();

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

    String imageUrl = Provider.of<SplashProvider>(context).configModel?.baseUrls?.productImageUrl ?? "";

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return PaginatedListView(
            scrollController: scrollController,
            totalSize: productProvider.latestProductModel?.totalSize,
            limit: productProvider.latestProductModel?.limit,
            offset: productProvider.latestProductModel?.offset,
            itemView: productProvider.latestProductModel != null
                ? productProvider.latestProductModel!.products!.isNotEmpty
                ? ListView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ItemDetails(product: productProvider.latestProductModel!.products![index]),
                    );
                  },
                  child: itemView(
                    productProvider.latestProductModel?.products?[index].image?.first ?? '',
                    productProvider.latestProductModel!.products?[index].name,
                    '${productProvider.latestProductModel!.products![index].price}',
                    '${productProvider.latestProductModel!.products![index].discount}',
                    imageUrl,
                  ),
                );
              },
              itemCount: productProvider.latestProductModel!.products!.length,
            )
                : Container()
                : const CircularProgressIndicator(),
            onPaginate: (int? offset) {},
          );
        },
      ),
    );
  }
}

Widget itemView(String imagePath, String? name, String? price, String? discountPrice, String? imgBaseUrl) {

  String imageUrl = "$imgBaseUrl/$imagePath";
  imageUrl = imageUrl.replaceAll('[', '').replaceAll(']', '');

  if (kDebugMode) {
    print("Image URL: $imageUrl");
  }

  return SizedBox(
    height: Dimensions.containerSizeLarge,
    child: Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSizeLargest),
            child: CircleAvatar(
              radius: Dimensions.paddingSizeMediumLarge,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeLargest),
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name!, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall)),
                const SizedBox(height: Dimensions.paddingSizeLarge),
                Row(
                  children: [
                    Text("\$$discountPrice", style: rubikMedium, ),
                    const SizedBox(width: Dimensions.paddingSizeLarge),
                    Text("\$$price", style: rubikRegular),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
