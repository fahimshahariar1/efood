import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class MultiSelector extends StatefulWidget {
  final Product product;

  const MultiSelector({Key? key, required this.product}) : super(key: key);

  @override
  State<MultiSelector> createState() => _MultiSelectorState();}

class _MultiSelectorState extends State<MultiSelector> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
    itemCount: widget.product.variations?.length,
    itemBuilder: (context, index){
      return ListView.builder(
          itemCount: widget.product.variations?[index].values?.length, shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Column(children: [

            const SizedBox(height: Dimensions.paddingSizeDefault,),
            Column(
              children: [
                ListTile(leading: Checkbox(value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                  title: Text("${widget.product.variations![index].values?[i].label}", style: poppinsRegular,),
                  trailing: Text("\$${widget.product.variations![index].values?[i].optionPrice}", style: poppinsRegular,),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault,
                ),
              ],
            )
          ]);
          });

    },

    );
  }
}
