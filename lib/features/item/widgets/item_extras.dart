import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemExtras extends StatelessWidget {

  final Product product;
  const ItemExtras({Key? key, required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListView.builder(itemCount: product.variations!.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap:  true,
            itemBuilder: (context, index){
                return Padding(padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      if(product.variations?[index].type == 'single') ...{
                          Text("${product.variations?[index].name}"),
                          for (int i = 0; i<= product.variations!.length; i++)
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${product.variations?[index].values?[i].label}", style: poppinsRegular,),
                                    Text("${product.variations?[index].values?[i].optionPrice}", style: poppinsRegular,),
                                  ],
                                ),
                              ],
                            ),
                        }
                       else if (product.variations?[index].type == 'multi') ...{
                            Text("${product.variations?[index].name}"),
                            for (int j = 0; j<= product.variations!.length; j++)
                          Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${product.variations?[index].values?[j].label}", style: poppinsRegular,),
                                  Text("${product.variations?[index].values?[j].optionPrice}", style: poppinsRegular,),

                                ],
                              ),
                            ],
                          ),
                      }

                    ],
                  ),
                );
            }),
      ),
    );

  }
}



// return Consumer <ProductProvider> (
//       builder: (context, productProvider, child) {
//         print('product =====> ${productProvider.product}');
//         return productProvider.product != null ? SizedBox(height: 40,
//           child: ListView.builder(shrinkWrap: true,
//             itemCount: productProvider.product!.variations!.length,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index){
//             print('Bottom sheet product =====> ${productProvider.product}');
//             print('Bottom sheet variation =====> ${productProvider.product!.variations}');
//             print('Bottom sheet =====> ${productProvider.product!.variations!.length}');
//
//               return Column( children: [
//                 // if(productProvider.product != null && productProvider.product?.variations != null)
//                 //   for(int i = 0; i< productProvider.product!.variations!.length; i++)
//                 //     Text(productProvider.product?.variations![index].values?[i].label ?? 'empty'),
//
//                 CustomSingleChildListWidget(itemCount: productProvider.product?.choiceOptions?[index].options?.length ?? 0,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (i){
//                           return InkWell(
//                             onTap: () => productProvider.setCartVariationIndex(index, i),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(productProvider.variationIndex![index] != i ? Icons.radio_button_unchecked : Icons.radio_button_checked,
//                                     size: Dimensions.radiusExtraLarge,),
//
//                                   //Text(productProvider.product!.choiceOptions![index].options![i].trim())
//                                 ],
//                               ),
//                             ),
//                           );
//                     })
//
//               ],);
//             }
//           ),
//         ) : const Text('empty product');
//
//       }
//     );