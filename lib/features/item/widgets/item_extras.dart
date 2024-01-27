import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/widgets/custom_single_child_list_widget.dart';

import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:provider/provider.dart';

class ItemExtras extends StatelessWidget {
  const ItemExtras({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {


    return Consumer <ProductProvider> (
      builder: (context, productProvider, child) {
        return ListView.builder(shrinkWrap: true,
          itemCount: productProvider.product?.choiceOptions!.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Column( children: [
                Text(productProvider.product?.choiceOptions![index].title ?? ''),

              CustomSingleChildListWidget(itemCount: productProvider.product?.choiceOptions?[index].options?.length ?? 0, scrollDirection: Axis.horizontal,
                  itemBuilder: (i){
                        return InkWell(
                          onTap: () => productProvider.setCartVariationIndex(index, i),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                            ),
                            child: Row(
                              children: [
                                Icon(productProvider.variationIndex![index] != i ? Icons.radio_button_unchecked : Icons.radio_button_checked,
                                  size: Dimensions.radiusExtraLarge,),

                                Text(productProvider.product!.choiceOptions![index].options![i].trim())
                              ],
                            ),
                          ),
                        );
                  })

            ],);
          }
        );

      }
    );
  }
}


// //import 'package:flutter/material.dart';
// // import 'package:flutter_restaurant/features/order/domain/models/order_details_model.dart';
// //
// // class ItemExtras extends StatelessWidget {
// //   final Products products;
// //   ItemExtras({required this.products});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     String? _groupValue;
// //
// //     return Column(
// //       children: [
// //         ...products.variations!.map((variation) {
// //           return Card(
// //             child: Column(
// //               children: [
// //                 Text(variation.name!, style: TextStyle(fontSize: 18)),
// //                 if (variation.type == 'multi')
// //                   Text('Select min ${variation.min} - max ${variation.max}'),
// //                 ...variation.values!.map((value) {
// //                   return Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       if (variation.type == 'multi')
// //                         Checkbox(
// //                           value: false,
// //                           onChanged: (_) {},
// //                         )
// //                       else
// //                         Radio<String>(
// //                           value: value.label!,
// //                           groupValue: _groupValue,
// //                           onChanged: (String? newValue) {
// //                             _groupValue = newValue;
// //                           },
// //                         ),
// //                       Text(value.label!),
// //                       Text(value.optionPrice!),
// //                     ],
// //                   );
// //                 }).toList(),
// //               ],
// //             ),
// //           );
// //         }).toList(),
// //       ],
// //     );
// //   }
// // }