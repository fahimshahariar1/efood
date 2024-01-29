import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class MultiSelector extends StatefulWidget {
  final Product product;
  final int variationIndex;

  const MultiSelector({Key? key, required this.product, required this.variationIndex}) : super(key: key);

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
      itemCount: widget.product.variations![widget.variationIndex].values?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeDefault),
            ListTile(
              leading: Checkbox(activeColor: Theme.of(context).dialogBackgroundColor,
                value: isCheckedList[widget.variationIndex][index],
                onChanged: (bool? value) {
                  setState(() {
                    isCheckedList[widget.variationIndex][index] = value ?? false;
                  });
                },
              ),
              title: Text("${widget.product.variations![widget.variationIndex].values![index].label}", style: poppinsRegular,),
              trailing: Text("\$${widget.product.variations![widget.variationIndex].values![index].optionPrice}", style: poppinsRegular,),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
          ],
        );
      },
    );
  }
}
