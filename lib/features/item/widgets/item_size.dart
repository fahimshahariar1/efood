import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:provider/provider.dart';


class ItemSize extends StatefulWidget {


  @override
  _ItemSizeState createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider> (
      builder: (context, productProvider, child) {
        return Card(
          child: ListView.builder(shrinkWrap: true,
              itemCount: productProvider.product?.variations?.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
            return Column(
              children: [
                Text(productProvider.product?.variations?[index].name ?? ''),
                Row(
                  children: [

                  ],
                )
              ],
            );
              })
        );
      }
    );
  }
}



//Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Center(child: Text('Select Size', style: TextStyle(fontSize: 18))),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: 100,
//             child: Card(
//               child: ListView(
//                 children: widget.products.expand((product) => product.variations ?? []).where((variation) => variation.type == 'size').map<Widget>((sizeVariation) {
//                   return ExpansionTile(
//                     title: Text(sizeVariation.name ?? ''),
//                     children: sizeVariation.values
//                         ?.map((value) => RadioListTile<String?>(
//                       title: Text(value.label ?? ''),
//                       value: value.label,
//                       groupValue: _selectedSize,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedSize = newValue;
//                         });
//                       },
//                     ))
//                         .toList() ??
//                         [],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );