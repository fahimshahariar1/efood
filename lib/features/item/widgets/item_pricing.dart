import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/helper/price_converter_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class ItemPricing extends StatefulWidget {
  const ItemPricing({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<ItemPricing> createState() => _ItemPricingState();
}

class _ItemPricingState extends State<ItemPricing> {
  int quantity = 1;
  double discountedPrice = 0;

  @override
  void initState() {
    super.initState();
    updateDiscountedPrice();
  }

  void updateDiscountedPrice() {
    setState(() {
      discountedPrice = PriceConverterHelper.convertWithDiscount(widget.product.price, widget.product.discount, widget.product.discountType,)!;
    });
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
                        getTranslated("total", context)!, style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor,),),
                      const SizedBox(width: Dimensions.paddingSizeSmall),
                      Text(getTranslated("vat", context)!, style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
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
                            updateDiscountedPrice();
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
                              updateDiscountedPrice();
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
                      Text('\$$discountedPrice', style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor),
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        child: Center(
                          child: Text(getTranslated("add_to_cart", context)!, style: poppinsRegular.copyWith(color: Colors.white),),
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


