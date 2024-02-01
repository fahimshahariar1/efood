
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';
import 'package:flutter_restaurant/common/widgets/paginated_list_view.dart';
import 'package:flutter_restaurant/features/branch/widgets/item_view.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';

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

    return  Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return PaginatedListView(
            scrollController: scrollController,
            totalSize: productProvider.latestProductModel?.totalSize,
            limit: productProvider.latestProductModel?.limit,
            offset: productProvider.latestProductModel?.offset,
            itemView: productProvider.latestProductModel != null
                ? productProvider.latestProductModel!.products!.isNotEmpty
                ?
            GridView.builder(physics: const NeverScrollableScrollPhysics(),
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                  mainAxisSpacing: 6,
                  crossAxisCount: 2),
              shrinkWrap: true,
              controller: scrollController,

              itemBuilder: (BuildContext context, int index) {
                return ItemView(imagePath: productProvider.latestProductModel?.products?[index].image?.first ?? '',
                  name: "${ productProvider.latestProductModel!.products?[index].name}",
                  price: "${productProvider.latestProductModel!.products![index].price}",
                  discountPrice: '${productProvider.latestProductModel!.products![index].discount}',
                  imgBaseUrl: imageUrl,
                  );
              },
              itemCount: productProvider.latestProductModel!.products!.length,
            )
                : Container()
                : const Center(child: CircularProgressIndicator()),
            onPaginate: (int? offset) {},
          );
        },
      );
  }
}

