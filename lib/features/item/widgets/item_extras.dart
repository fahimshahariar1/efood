import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/order/domain/models/order_details_model.dart';

class ItemExtras extends StatelessWidget {
  final Products products;
  ItemExtras({required this.products});

  @override
  Widget build(BuildContext context) {
    String? _groupValue;

    return Column(
      children: [...products.variations!.map((variation) {
          return Card(
            child: Column(
              children: [
                Text(variation.name!, style: const TextStyle(fontSize: 18)),
                if (variation.type == 'multi')
                  Text('Select min ${variation.min} - max ${variation.max}'),
                ...variation.values!.map((value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (variation.type == 'multi')
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                        )
                      else
                        Radio<String>(
                          value: value.label!,
                          groupValue: _groupValue,
                          onChanged: (String? newValue) {
                            _groupValue = newValue;
                          },
                        ),
                      Text(value.label!),
                      Text(value.optionPrice!),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
