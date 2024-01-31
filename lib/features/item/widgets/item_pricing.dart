import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/cart_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/cart/provider/cart_provider.dart';
import 'package:flutter_restaurant/features/product/providers/product_provider.dart';
import 'package:flutter_restaurant/helper/price_converter_helper.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/styles.dart';
import 'package:provider/provider.dart';

class ItemPricing extends StatefulWidget {
  final Product? product;

  final CartModel? cart;

  const ItemPricing({Key? key, required this.product, this.cart, }) : super(key: key);

  @override
  State<ItemPricing> createState() => _ItemPricingState();
}

class _ItemPricingState extends State<ItemPricing> {
  int quantity = 1;
  double totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotalPrice();
  }

  void calculateTotalPrice(){
    Provider.of<CartProvider>(context, listen: true).calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).initDataLoad(widget.product, widget.cart, isUpdate: false);
    double? discountedPrice = PriceConverterHelper.convertWithDiscount(widget.product!.price, widget.product?.discount, widget.product?.discountType);

    return Consumer<CartProvider>(builder: (context, cartProvider, child){
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
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () =>
                        cartProvider.setQuantity(isIncrement: false, cart: widget.cart!, productIndex: -1, fromProductView: true),
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),
                            ),
                            child: Icon(
                              Icons.remove_rounded, color: Theme.of(context).hintColor, size: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20), child: Text("$quantity", style: rubikMedium,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () => cartProvider.setQuantity(isIncrement: true, cart: widget.cart, productIndex: 1, fromProductView: true),
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
                        Text('\$$discountedPrice', style: poppinsRegular.copyWith(color: Theme.of(context).dialogBackgroundColor)),
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
    });


  }
}


// {
//                             calculateTotalPrice();
//                             setState(() {
//                               quantity = quantity > 1 ? quantity - 1 : 1;
//                               cartProvider.totalPrice;
//                             });
//                           },
