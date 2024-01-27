// import 'package:flutter/material.dart';
// import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:provider/provider.dart';
//
//
// class ItemSize extends StatefulWidget {
//
//
//   @override
//   _ItemSizeState createState() => _ItemSizeState();
// }
//
// class _ItemSizeState extends State<ItemSize> {
//   String? _selectedSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductProvider> (
//       builder: (context, productProvider, child) {
//         return Card(
//           child: ListView.builder(shrinkWrap: true,
//               itemCount: productProvider.product?.variations?.length,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index){
//             return Column(
//               children: [
//                 Text(productProvider.product.variations[index].,
//                 Row(
//                   children: [
//                       Text()
//                   ],
//                 )
//               ],
//             );
//               })
//         );
//       }
//     );
//   }
// }
//
//
//
