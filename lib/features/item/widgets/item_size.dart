import 'package:flutter/material.dart';
import '../../../common/models/product_model.dart';

class ItemSize extends StatefulWidget {
  final List<Product> products;
  ItemSize({required this.products});

  @override
  _ItemSizeState createState() => _ItemSizeState();
}

class _ItemSizeState extends State<ItemSize> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Size', style: TextStyle(fontSize: 18)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Card(
              child: ListView(
                children: widget.products.expand((product) => product.variations ?? []).where((variation) => variation.type == 'size').map<Widget>((sizeVariation) {
                  return ExpansionTile(
                    title: Text(sizeVariation.name ?? ''),
                    children: sizeVariation.values
                        ?.map((value) => RadioListTile<String?>(
                      title: Text(value.label ?? ''),
                      value: value.label,
                      groupValue: _selectedSize,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedSize = newValue;
                        });
                      },
                    ))
                        .toList() ??
                        [],
                  );
                }).toList(),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
