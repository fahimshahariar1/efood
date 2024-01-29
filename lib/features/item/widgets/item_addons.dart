import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/addOns_counter.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemAddons extends StatefulWidget {
  final Product product;

  const ItemAddons({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemAddons> createState() => _ItemAddonsState();
}

class _ItemAddonsState extends State<ItemAddons> {
  List<bool> isCheckedList = [];
  int counter = 0;

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
              widget.product.addOns != null && widget.product.addOns!.isNotEmpty ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, left: Dimensions.paddingSizeSmall),
                      child: Text(getTranslated('addons', context)!, style: poppinsRegular),
                    ),
                    ListView.builder(itemCount: widget.product.addOns!.length, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
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
                                      if (isCheckedList[index]) {
                                        counter++;
                                      } else {
                                        counter--;
                                      }
                                    });
                                  },
                                  child: Checkbox(
                                    activeColor: Theme.of(context).dialogBackgroundColor,
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value ?? false;
                                        if (value ?? false) {
                                          counter++;
                                        } else {
                                          if (counter > 0) {
                                            counter--;
                                          }
                                        }
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
                ): const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}