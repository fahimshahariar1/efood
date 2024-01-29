import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getTranslated('addons', context)!, style: poppinsRegular,
                ),
                ListView.builder(itemCount: widget.product.addOns!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                        ListTile(
                          leading: Checkbox(activeColor: Theme.of(context).dialogBackgroundColor,
                            value: isCheckedList[index],
                            onChanged: (bool? value) {
                              setState(() {
                                isCheckedList[index] = value ?? false;
                              });
                            },
                          ),
                          title: Text("${widget.product.addOns![index].name}", style: poppinsRegular,),
                          trailing: Text("\$${widget.product.addOns![index].price}", style: poppinsRegular,),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
