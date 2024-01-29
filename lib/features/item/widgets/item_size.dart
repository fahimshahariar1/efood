// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_restaurant/common/models/product_model.dart';
//
//
// class ItemSize extends StatefulWidget {
//
//   final Product product;
//   const ItemSize({Key? key, required this.product}) : super(key: key);
//
//   @override
//   _ItemSizeState createState() => _ItemSizeState();
// }
//
// class _ItemSizeState extends State<ItemSize> {
//
//   int? selectedSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListView.builder(itemCount: widget.product.variations?.length, shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index){
//         return Column(
//           children: [
//             if(widget.product.variations?[index].name == "Size")
//               for(int i = 0; i < widget.product.variations![index].values!.length; i++)
//                 ListTile(
//                   leading: Radio(
//                       value: 1, groupValue: selectedSize, onChanged: (int? value){
//                     setState(() {
//                       selectedSize = value!;
//                       if (kDebugMode) {
//                         print("$value");
//                       }
//                     });
//                   }),
//                   title: Text("${widget.product.variations?[index].values?[i].label}"),
//                 )
//           ],
//         );
//       }),
//     );
//   }
// }
//
//
//
