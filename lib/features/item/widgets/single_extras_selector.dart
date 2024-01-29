import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class SingleSelector extends StatefulWidget {
  final Product product;
  final int variationIndex;
  final ValueChanged<int> onSelectedIndex;

  const SingleSelector({
    Key? key,
    required this.product,
    required this.variationIndex,
    required this.onSelectedIndex,
  }) : super(key: key);

  @override
  State<SingleSelector> createState() => _SingleSelectorState();
}

class _SingleSelectorState extends State<SingleSelector> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.product.variations![widget.variationIndex].values?.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Column(
              children: [
                ListTile(
                  leading: Radio<int>(
                    activeColor: Theme.of(context).hintColor,
                    value: index,
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = value;
                        widget.onSelectedIndex(value!); // Notify parent widget
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
            ),
          ],
        );
      },
    );
  }
}
