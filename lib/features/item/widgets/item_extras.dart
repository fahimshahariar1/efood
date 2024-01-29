import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/multi_extras_selector.dart';
import 'package:flutter_restaurant/features/item/widgets/single_extras_selector.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemExtras extends StatefulWidget {
  final Product product;

  const ItemExtras({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemExtras> createState() => _ItemExtrasState();}

class _ItemExtrasState extends State<ItemExtras> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListView.builder(
            itemCount: widget.product.variations!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true, itemBuilder: (context, index) {
              return Padding(padding: const EdgeInsets.all(8),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.product.variations?[index].type == 'single' ?
                      Column( crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text("${widget.product.variations?[index].name}", style: poppinsRegular,),
                          Text(getTranslated("select_one", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),),
                          SingleSelector(product: widget.product, variationIndex: index),
                        ],
                      ) : const SizedBox(),

                    widget.product.variations?[index].type == 'multi' ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.product.variations?[index].name}", style: poppinsRegular,),
                        Text("Select Minimum ${widget.product.variations?[index].min} Up to "
                            "${widget.product.variations?[index].max}"),
                        MultiSelector(product: widget.product, variationIndex: index,)
                      ],
                    ) : const SizedBox()







                  ],
                ),
              );
            }),
      ),
    );
  }
}
