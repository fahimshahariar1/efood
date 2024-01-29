import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/helper/price_converter_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';

class ItemPricing extends StatefulWidget {
  final Product product;
  final List<double> selectedAddonPrices;
  final List<int> selectedAddonQuantities;

  ItemPricing({
    Key? key,
    required this.product,
    required this.selectedAddonPrices,
    required this.selectedAddonQuantities,
  }) : super(key: key);

  @override
  State<ItemPricing> createState() => _ItemPricingState();
}

class _ItemPricingState extends State<ItemPricing> {
  int quantity = 1;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    calculateTotal();
  }

  void calculateTotal() {
    double? basePrice = widget.product.price;
    double? discountedPrice = PriceConverterHelper.convertWithDiscount(
      basePrice,
      widget.product.discount,
      widget.product.discountType,
    );

    double addonsTotalPrice = 0;
    for (int i = 0; i < widget.selectedAddonPrices.length; i++) {
      addonsTotalPrice += widget.selectedAddonPrices[i] * widget.selectedAddonQuantities[i];
    }

    totalPrice = (discountedPrice! * quantity);
    totalPrice += addonsTotalPrice;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        getTranslated("total", context)!,
                        style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeSmall),
                      Text(
                        getTranslated("vat", context)!,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            quantity = quantity > 1 ? quantity - 1 : 1;
                            calculateTotal();
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                          ),
                          child: Icon(
                            Icons.remove_rounded, color: Theme.of(context).hintColor, size: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("$quantity", style: rubikMedium,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              quantity++;
                              calculateTotal();
                            });
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Theme.of(context).dialogBackgroundColor,),
                            child: const Icon(Icons.add, color: Colors.white, size: 15,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('\$$totalPrice', style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor)),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        child: Center(
                          child: Text(getTranslated("add_to_cart", context)!, style: poppinsRegular.copyWith(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
