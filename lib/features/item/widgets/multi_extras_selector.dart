import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class MultiSelector extends StatefulWidget {
  final Product product;

  const MultiSelector({Key? key, required this.product}) : super(key: key);

  @override
  State<MultiSelector> createState() => _MultiSelectorState();
}

class _MultiSelectorState extends State<MultiSelector> {
  List<List<bool>> isCheckedList = [];

  @override
  void initState() {
    super.initState();

    isCheckedList = List.generate(widget.product.variations!.length,
            (index) => List.filled(widget.product.variations![index].values!.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.product.variations?.length,
      itemBuilder: (context, index) {
        return ListView.builder(
          itemCount: widget.product.variations![index].values?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeDefault),
                ListTile(
                  leading: Checkbox(
                    value: isCheckedList[index][i],
                    onChanged: (bool? value) {
                      setState(() {
                        isCheckedList[index][i] = value ?? false;
                      });
                    },
                  ),
                  title: Text("${widget.product.variations![index].values![i].label}", style: poppinsRegular,),
                  trailing: Text("\$${widget.product.variations![index].values![i].optionPrice}", style: poppinsRegular,),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
              ],
            );
          },
        );
      },
    );
  }
}
