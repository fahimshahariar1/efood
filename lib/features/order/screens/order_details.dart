

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';
import 'package:flutter_restaurant/common/widgets/paginated_list_view.dart';
import 'package:flutter_restaurant/features/order/widgets/item_details.dart';

import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';

import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

import 'package:provider/provider.dart';

class OrderDetails extends StatefulWidget {
  final ScrollController? scrollController;
  final ProductFilterType? filterType;

  const OrderDetails({Key? key, this.scrollController, this.filterType}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
      body: SingleChildScrollView(
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, child) {
            return PaginatedListView(
              scrollController: widget.scrollController ?? ScrollController(),
              totalSize: productProvider.latestProductModel?.totalSize,
              limit: productProvider.latestProductModel?.limit,
              offset: productProvider.latestProductModel?.offset,
              itemView: productProvider.latestProductModel != null
                  ? productProvider.latestProductModel!.products!.isNotEmpty
                  ? InkWell(onTap: (){
                    showModalBottomSheet(isScrollControlled: true, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.paddingSizeDefault),
                    topLeft: Radius.circular(Dimensions.paddingSizeDefault))),
                        context: context, builder: (BuildContext context){
                      return SizedBox(

                        height: 650,
                        child: ItemDetails(),

                      );
                    });
              },
                    child: ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (BuildContext context, int index) {
                    return itemView(
                      '${productProvider.latestProductModel!.products![index].image}',
                      productProvider.latestProductModel!.products![index].name,
                            
                      '${productProvider.latestProductModel!.products![index].price}',
                      '${productProvider.latestProductModel!.products![index].discount}',
                      imageUrl,
                    );
                                    },
                                    itemCount: productProvider.latestProductModel!.products!.length,
                                  ),
                  )
                  : Container()
                  : const CircularProgressIndicator(),
              onPaginate: (int? offset) {},
            );
          },
        ),
      ),
    );
  }
}

Widget itemView(String? imagePath, String? name, String? price, String? discountPrice, String? imgBaseUrl) {

  String imageUrl = "${imgBaseUrl!}/${imagePath ?? ''}";
  imageUrl = imageUrl.replaceAll('[', '').replaceAll(']', '');
  if (kDebugMode) {
    print(imageUrl);
  }

  return SizedBox(
    height: Dimensions.containerSizeLarge,
    child: Card(
      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
        child: Row(

          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeLargest),
              child: CircleAvatar(radius: 40 ,
              backgroundImage: NetworkImage(imageUrl)),
            ),
            SizedBox(width: Dimensions.paddingSizeLargest,),
            Padding(
              padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name!, style: poppinsRegular,),
                  const SizedBox(height: Dimensions.paddingSizeLarge,),
                  Row(
                    children: [
                      Text(discountPrice!, style: rubikMedium,),
                      const SizedBox(width: Dimensions.paddingSizeLarge),
                      Text(price!, style: rubikRegular,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
