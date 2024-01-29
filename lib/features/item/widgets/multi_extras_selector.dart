import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class MultiSelector extends StatefulWidget {
  final Product product;
  final int variationIndex;
  final ValueChanged<List<int>> onSelectedIndexes; // Define the named parameter here

  const MultiSelector({
    Key? key,
    required this.product,
    required this.variationIndex,
    required this.onSelectedIndexes, // Include the named parameter here
  }) : super(key: key);

  @override
  State<MultiSelector> createState() => _MultiSelectorState();
}

class _MultiSelectorState extends State<MultiSelector> {
  late List<List<bool>> isCheckedList;
  int _selectedCount = 0;

  @override
  void initState() {
    super.initState();

    isCheckedList = List.generate(
      widget.product.variations!.length,
          (index) =>
          List.filled(widget.product.variations![index].values!.length, false),
    );
  }

  @override
  Widget build(BuildContext context) {
    int min = widget.product.variations![widget.variationIndex].min!;
    int max = widget.product.variations![widget.variationIndex].max!;

    return ListView.builder(
      itemCount: widget.product.variations![widget.variationIndex].values?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        bool isEnabled = _selectedCount < max;

        return Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeDefault),
            ListTile(
              leading: Checkbox(
                activeColor: Theme.of(context).dialogBackgroundColor,
                value: isCheckedList[widget.variationIndex][index],
                onChanged: (bool? value) {
                  if (value! && _selectedCount == max) {
                    return;
                  }
                  setState(() {
                    isCheckedList[widget.variationIndex][index] = value;
                    _selectedCount += value ? 1 : -1;
                    widget.onSelectedIndexes(
                      // Send the selected indexes to the callback
                      isCheckedList[widget.variationIndex]
                          .asMap()
                          .entries
                          .where((entry) => entry.value)
                          .map((entry) => entry.key)
                          .toList(),
                    );
                  });
                },
              ),
              title: Text(
                "${widget.product.variations![widget.variationIndex].values![index].label}",
                style: poppinsRegular,
              ),
              trailing: Text(
                "\$${widget.product.variations![widget.variationIndex].values![index].optionPrice}",
                style: poppinsRegular,
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
          ],
        );
      },
    );
  }
}
