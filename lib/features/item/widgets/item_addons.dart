import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/addOns_counter.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class ItemAddons extends StatefulWidget {
  final Product product;
  final Function(List<double>, List<int>) onAddonsSelected;

  const ItemAddons({
    Key? key,
    required this.product,
    required this.onAddonsSelected,
  }) : super(key: key);

  @override
  State<ItemAddons> createState() => _ItemAddonsState();
}

class _ItemAddonsState extends State<ItemAddons> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(widget.product.addOns!.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.product.addOns != null && widget.product.addOns!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, left: Dimensions.paddingSizeSmall),
                      child: Text(getTranslated('addons', context)!, style: poppinsRegular),
                    ),
                    ListView.builder(
                      itemCount: widget.product.addOns!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isCheckedList[index] = !isCheckedList[index];
                                      widget.onAddonsSelected(getSelectedAddonPrices(), getSelectedAddonQuantities());
                                    });
                                  },
                                  child: Checkbox(
                                    activeColor: Theme.of(context).dialogBackgroundColor,
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value ?? false;
                                        widget.onAddonsSelected(getSelectedAddonPrices(), getSelectedAddonQuantities());
                                      });
                                    },
                                  ),
                                ),
                                Text("${widget.product.addOns![index].name}", style: poppinsRegular),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$${widget.product.addOns![index].price}", style: poppinsRegular),
                                      const SizedBox(width: Dimensions.paddingSizeSmall),
                                      if (isCheckedList[index]) const AddonsCounter(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                          ],
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<double> getSelectedAddonPrices() {
    List<double> selectedAddonPrices = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        selectedAddonPrices.add(widget.product.addOns![i].price!.toDouble());
      }
    }
    return selectedAddonPrices;
  }

  List<int> getSelectedAddonQuantities() {
    List<int> selectedAddonQuantities = [];
    for (int i = 0; i < isCheckedList.length; i++) {
      if (isCheckedList[i]) {
        selectedAddonQuantities.add(1);
      }
    }
    return selectedAddonQuantities;
  }
}
