import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/item/widgets/multi_extras_selector.dart';
import 'package:flutter_restaurant/features/item/widgets/single_extras_selector.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/styles.dart';

class ItemExtras extends StatefulWidget {

  final Product product;
  final ValueChanged<List<int>> onVariationSelected;

  const ItemExtras({
    required this.product,
    required this.onVariationSelected,
  });

  @override
  State<ItemExtras> createState() => _ItemExtrasState();
}

class _ItemExtrasState extends State<ItemExtras> {

  List<int> selectedVariations = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: ListView.builder(
          itemCount: widget.product.variations?.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if (widget.product.variations?[index].type == 'single')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${widget.product.variations?[index].name}",
                            style: poppinsRegular
                        ),
                        Text(
                          getTranslated('select_one', context)!,
                          style: poppinsRegular.copyWith(
                            color: Theme.of(context).dialogBackgroundColor,
                          ),
                        ),
                        SingleSelector(
                          product: widget.product,
                          variationIndex: index,
                          onSelectedIndex: (selectedIndex) {
                            selectedVariations.add(selectedIndex);
                            widget.onVariationSelected(selectedVariations);
                          },
                        ),
                      ],
                    ),

                  if (widget.product.variations?[index].type == 'multi')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${widget.product.variations?[index].name}",
                            style: poppinsRegular
                        ),
                        Text(
                          'Select min ${widget.product.variations?[index].min} max ${widget.product.variations?[index].max}',
                        ),
                        MultiSelector(
                          product: widget.product,
                          variationIndex: index,
                          onSelectedIndexes: (selectedIndexes) {
                            selectedVariations.addAll(selectedIndexes);
                            widget.onVariationSelected(selectedVariations);
                          },
                        ),
                      ],
                    ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}