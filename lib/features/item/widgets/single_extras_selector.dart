import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class SingleSelector extends StatefulWidget {
  final Product product;
  final int variationIndex;

  const SingleSelector({Key? key, required this.product, required this.variationIndex}) : super(key: key);

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
      itemBuilder: (context, token) {
        return Column(
          children: [
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Column(
              children: [
                ListTile(
                  leading: Radio(activeColor: Theme.of(context).hintColor,
                    value: token,
                    groupValue: selectedOption,
                    onChanged: (int? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  title: Text("${widget.product.variations![widget.variationIndex].values![token].label}",
                    style: poppinsRegular,),
                  trailing: Text("\$${widget.product.variations![widget.variationIndex].values![token].optionPrice}",
                    style: poppinsRegular,),
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
