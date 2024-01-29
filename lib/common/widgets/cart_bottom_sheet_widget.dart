// import 'package:flutter/material.dart';
// import 'package:flutter_restaurant/common/models/cart_model.dart';
// import 'package:flutter_restaurant/common/models/product_model.dart';
// import 'package:flutter_restaurant/common/widgets/custom_asset_image_widget.dart';
// import 'package:flutter_restaurant/common/widgets/custom_button_widget.dart';
// import 'package:flutter_restaurant/common/widgets/custom_directionality_widget.dart';
// import 'package:flutter_restaurant/common/widgets/custom_image_widget.dart';
// import 'package:flutter_restaurant/common/widgets/custom_zoom_widget.dart';
// import 'package:flutter_restaurant/common/widgets/rating_bar_widget.dart';
// import 'package:flutter_restaurant/common/widgets/stock_tag_widget.dart';
// import 'package:flutter_restaurant/common/widgets/wish_button_widget.dart';
// import 'package:flutter_restaurant/features/cart/providers/cart_provider.dart';
// import 'package:flutter_restaurant/features/home/widgets/read_more_text.dart';
// import 'package:flutter_restaurant/features/splash/providers/splash_provider.dart';
// import 'package:flutter_restaurant/helper/custom_snackbar_helper.dart';
// import 'package:flutter_restaurant/helper/date_converter_helper.dart';
// import 'package:flutter_restaurant/helper/price_converter_helper.dart';
// import 'package:flutter_restaurant/helper/responsive_helper.dart';
// import 'package:flutter_restaurant/helper/router_helper.dart';
// import 'package:flutter_restaurant/localization/language_constrants.dart';
// import 'package:flutter_restaurant/provider/product_provider.dart';
// import 'package:flutter_restaurant/util/dimensions.dart';
// import 'package:flutter_restaurant/util/images.dart';
// import 'package:flutter_restaurant/util/styles.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
//
// class CartBottomSheetWidget extends StatefulWidget {
//   final Product? product;
//   final bool fromSetMenu;
//   final Function? callback;
//   final CartModel? cart;
//   final int? cartIndex;
//   final bool fromCart;
//
//   const CartBottomSheetWidget({
//     Key? key,
//     required this.product,
//     this.fromSetMenu = false,
//     this.callback,
//     this.cart,
//     this.cartIndex,
//     this.fromCart = false,
//   }) : super(key: key);
//
//   @override
//   State<CartBottomSheetWidget> createState() => _CartBottomSheetWidgetState();
// }
//
// class _CartBottomSheetWidgetState extends State<CartBottomSheetWidget> {
//
//   @override
//   void initState() {
//     Provider.of<ProductProvider>(context, listen: false).initData(widget.product, widget.cart);
//     Provider.of<ProductProvider>(context, listen: false).initProductVariationStatus(widget.product!.variations!.length);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final height = MediaQuery.of(context).size.height;
//
//     return Consumer<CartProvider>(
//       builder: (context, cartProvider, child) {
//         return Stack(children: [
//
//           Padding(
//             padding: EdgeInsets.all(ResponsiveHelper.isDesktop(context) ? Dimensions.paddingSizeExtraLarge : 0),
//             child: Container(
//               width: 700,
//               constraints: BoxConstraints(maxHeight: height * 0.85),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).cardColor,
//                 borderRadius: ResponsiveHelper.isMobile()
//                     ? const BorderRadius.only(topLeft: Radius.circular(Dimensions.radiusLarge), topRight: Radius.circular(Dimensions.radiusLarge))
//                     : const BorderRadius.all(Radius.circular(Dimensions.radiusLarge)),
//               ),
//               clipBehavior: Clip.hardEdge,
//               child: Consumer<ProductProvider>(
//                 builder: (context, productProvider, child) {
//                   List<Variation>? variationList;
//                   double? price;
//
//                   if(widget.product!.branchProduct != null && widget.product!.branchProduct!.isAvailable!) {
//                     variationList = widget.product!.branchProduct!.variations;
//                     price = widget.product!.branchProduct!.price;
//
//                   }else{
//                     variationList = widget.product!.variations;
//                     price = widget.product!.price;
//                   }
//
//                   double variationPrice = 0;
//                   for(int index = 0; index < variationList!.length; index++) {
//                     for(int i=0; i< variationList[index].variationValues!.length; i++) {
//                       if(productProvider.selectedVariations[index][i]!) {
//                         variationPrice += variationList[index].variationValues![i].optionPrice!;
//                       }
//                     }
//                   }
//                   double? discount = widget.product!.discount;
//                   String? discountType =  widget.product!.discountType;
//                   double priceWithDiscount = PriceConverterHelper.convertWithDiscount( price, discount, discountType)!;
//                   double addonsCost = 0;
//                   double addonsTax = 0;
//                   List<AddOn> addOnIdList = [];
//                   List<AddOns> addOnsList = [];
//                   for (int index = 0; index < widget.product!.addOns!.length; index++) {
//                     if (productProvider.addOnActiveList[index]) {
//                       double itemPrice = widget.product!.addOns![index].price! * productProvider.addOnQtyList[index]!;
//                       addonsCost = addonsCost + itemPrice;
//                       addonsTax = addonsTax + (itemPrice - PriceConverterHelper.convertWithDiscount((itemPrice), widget.product!.addOns![index].tax ?? 0, 'percent')!);
//                       addOnIdList.add(AddOn(id: widget.product!.addOns![index].id, quantity: productProvider.addOnQtyList[index]));
//                       addOnsList.add(widget.product!.addOns![index]);
//                     }
//                   }
//                   double priceWithAddonsVariation = addonsCost + (PriceConverterHelper.convertWithDiscount( variationPrice + price! , discount, discountType)! * productProvider.quantity!);
//                   double priceWithAddonsVariationWithoutDiscount = ((price + variationPrice) * productProvider.quantity!) + addonsCost;
//                   double priceWithVariation = price + variationPrice;
//                   bool isAvailable = DateConverterHelper.isAvailable(widget.product!.availableTimeStarts!, widget.product!.availableTimeEnds!);
//
//                   CartModel cartModel = CartModel(
//                     priceWithVariation,
//                     priceWithDiscount,
//                     [],
//                     (priceWithVariation - PriceConverterHelper.convertWithDiscount( priceWithVariation, discount, discountType)!),
//                     productProvider.quantity,
//                     (priceWithVariation  - PriceConverterHelper.convertWithDiscount( priceWithVariation, widget.product!.tax, widget.product!.taxType)! + addonsTax),
//                     addOnIdList,
//                     widget.product,
//                     productProvider.selectedVariations,
//                   );
//
//                   cartProvider.isExistInCart(widget.product?.id, null);
//
//                   return Column(mainAxisSize: MainAxisSize.min, children: [
//
//                     Flexible(child: SingleChildScrollView(
//                       padding: EdgeInsets.all(ResponsiveHelper.isMobile() ? 0 : Dimensions.paddingSizeExtraLarge),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           /// for Product image and price card
//                           _productView(context, price, priceWithDiscount),
//
//                           Container(
//                             transform: Matrix4.translationValues(0, ResponsiveHelper.isMobile() ? -10 : Dimensions.paddingSizeLarge, 0),
//                             padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.isMobile() ? Dimensions.paddingSizeLarge : 0),
//                             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//                               /// for Description
//                               _CartProductDescription(product: widget.product!),
//
//                               /// for Variations
//                               variationList.isNotEmpty ? ListView.builder(
//                                 shrinkWrap: true,
//                                 itemCount: variationList.length,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 padding: EdgeInsets.zero,
//                                 itemBuilder: (context, index) {
//                                   return Container(
//                                     decoration: BoxDecoration(
//                                       color: Theme.of(context).cardColor,
//                                       borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                                       boxShadow: [BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.5), blurRadius: Dimensions.radiusDefault)],
//                                     ),
//                                     padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                                     margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
//                                     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//                                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
//                                         Text(variationList![index].name ?? '', style: rubikMedium),
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: productProvider.isRequiredSelected![index] ? Theme.of(context).secondaryHeaderColor.withOpacity(0.05)
//                                                 : Theme.of(context).primaryColor.withOpacity(0.05),
//                                             borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
//                                           ),
//                                           padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                                           child: CustomDirectionalityWidget(child: Text(
//                                             '${getTranslated(variationList[index].isRequired!
//                                                 ? productProvider.isRequiredSelected![index] ? 'completed' : 'required' : 'optional', context)}',
//                                             style: rubikRegular.copyWith(
//                                               color: productProvider.isRequiredSelected![index]
//                                                   ? Theme.of(context).secondaryHeaderColor : Theme.of(context).primaryColor,
//                                               fontSize: Dimensions.fontSizeSmall,
//                                             ),
//                                           )),
//                                         ),
//                                       ]),
//                                       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//                                       Row(children: [
//                                         variationList[index].isMultiSelect! ? Text(
//                                           '${getTranslated('you_need_to_select_minimum', context)} ${'${variationList[index].min}'
//                                               ' ${getTranslated('to_maximum', context)} ${variationList[index].max} ${getTranslated('options', context)}'}',
//                                           style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
//                                         ) : variationList[index].isRequired! ? Text(
//                                           '${getTranslated('select_one', context)}',
//                                           style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).primaryColor),
//                                         ) : const SizedBox(),
//                                       ]),
//                                       SizedBox(
//                                         height: variationList[index].isMultiSelect! || variationList[index].isRequired! ? Dimensions.paddingSizeSmall : 0,
//                                       ),
//
//                                       ListView.builder(
//                                         shrinkWrap: true,
//                                         physics: const NeverScrollableScrollPhysics(),
//                                         padding: EdgeInsets.zero,
//                                         itemCount: productProvider.variationSeeMoreButtonStatus
//                                             ? variationList[index].variationValues!.length : variationList[index].variationValues!.length >= 2 ? 2
//                                             : variationList[index].variationValues!.length,
//                                         itemBuilder: (context, i) {
//                                           return i >= 1 && productProvider.variationSeeMoreButtonStatus == false ? InkWell(
//                                             onTap: () {
//                                               productProvider.setVariationSeeMoreStatus(!productProvider.variationSeeMoreButtonStatus);
//                                             },
//                                             child: Row(children: [
//                                               const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//                                               Icon(Icons.keyboard_arrow_down, color: Theme.of(context).primaryColor),
//                                               const SizedBox(width: Dimensions.paddingSizeSmall),
//                                               Text(getTranslated('view', context)!, style: rubikRegular.copyWith(color: Theme.of(context).primaryColor)),
//                                               Text(
//                                                 ' ${variationList![index].variationValues!.length - 1} ',
//                                                 style: rubikRegular.copyWith(color: Theme.of(context).primaryColor),
//                                               ),
//                                               Text(getTranslated('more', context)!, style: rubikRegular.copyWith(color: Theme.of(context).primaryColor)),
//                                             ]),
//                                           )
//                                           : InkWell(
//                                             onTap: () {
//                                               productProvider.setCartVariationIndex(index, i, widget.product, variationList![index].isMultiSelect!);
//                                               productProvider.checkIsRequiredSelected(
//                                                 index: index, isMultiSelect: variationList[index].isMultiSelect!,
//                                                 variations: productProvider.selectedVariations[index],
//                                                 min: variationList[index].min, max: variationList[index].max,
//                                               );
//                                             },
//                                             child: Row(children: [
//
//                                               Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//
//                                                 variationList![index].isMultiSelect! ? Checkbox(
//                                                   value: productProvider.selectedVariations[index][i],
//                                                   activeColor: Theme.of(context).primaryColor,
//                                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
//                                                   side: BorderSide(color: productProvider.selectedVariations[index][i]!
//                                                       ? Colors.transparent : Theme.of(context).hintColor, width: 1),
//                                                   onChanged:(bool? newValue) {
//                                                     productProvider.setCartVariationIndex(
//                                                       index, i, widget.product, variationList![index].isMultiSelect!,
//                                                     );
//
//                                                     // print(productProvider.selectedVariations[index]);
//                                                     productProvider.checkIsRequiredSelected(
//                                                       index: index, isMultiSelect: variationList[index].isMultiSelect!,
//                                                       variations: productProvider.selectedVariations[index],
//                                                       min: variationList[index].min, max: variationList[index].max,
//                                                     );
//
//                                                   },
//                                                   visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
//                                                 ) : Radio(
//                                                   value: i,
//                                                   groupValue: productProvider.selectedVariations[index].indexOf(true),
//                                                   onChanged: (dynamic value) {
//                                                     productProvider.setCartVariationIndex(
//                                                       index, i,widget.product, variationList![index].isMultiSelect!,
//                                                     );
//                                                     productProvider.checkIsRequiredSelected(
//                                                       index: index, isMultiSelect: false,
//                                                       variations: productProvider.selectedVariations[index],
//                                                     );
//                                                   },
//                                                   activeColor: Theme.of(context).primaryColor,
//                                                   toggleable: false,
//                                                   visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
//                                                 ),
//
//                                                 Text(
//                                                   variationList[index].variationValues![i].level!.trim(),
//                                                   maxLines: 1, overflow: TextOverflow.ellipsis,
//                                                   style: robotoRegular.copyWith(
//                                                     fontSize: Dimensions.fontSizeSmall,
//                                                     color: productProvider.selectedVariations[index][i]!
//                                                         ? Theme.of(context).textTheme.bodyMedium?.color : Theme.of(context).disabledColor,
//                                                   ),
//                                                 ),
//
//                                               ]),
//
//                                               const Spacer(),
//
//                                               CustomDirectionalityWidget(child: Text(
//                                                 variationList[index].variationValues![i].optionPrice! > 0
//                                                     ? '+${PriceConverterHelper.convertPrice(variationList[index].variationValues![i].optionPrice)}'
//                                                     : 'free',
//                                                 maxLines: 1, overflow: TextOverflow.ellipsis,
//                                                 style: robotoRegular.copyWith(
//                                                   fontSize: Dimensions.fontSizeSmall,
//                                                   color: productProvider.selectedVariations[index][i]!
//                                                       ? Theme.of(context).textTheme.bodyMedium?.color : Theme.of(context).disabledColor,
//                                                 ),
//                                               )),
//
//                                             ]),
//                                           );
//                                         },
//                                       ),
//                                       SizedBox(height: index != variationList.length - 1 ? Dimensions.paddingSizeLarge : 0),
//
//                                     ]),
//                                   );
//                                 },
//                               ) : const SizedBox(),
//
//                               SizedBox(height: (variationList.isNotEmpty) ? Dimensions.paddingSizeDefault : 0),
//
//                               /// for Addons
//                               if(widget.product!.addOns!.isNotEmpty) ... [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     color: Theme.of(context).cardColor,
//                                     borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//                                     boxShadow: [BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.5), blurRadius: Dimensions.radiusDefault)],
//                                   ),
//                                   padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//                                   child: _addonsView(context, productProvider),
//                                 ),
//                                 const SizedBox(height: Dimensions.paddingSizeDefault),
//                               ],
//
//                             ]),
//                           ),
//
//                         ],
//                       ),
//                     )),
//
//
//                     /// for bottom Total amount, quantity, & add to cart button section
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge, vertical: Dimensions.paddingSizeSmall),
//                       child: Row(children: [
//                         Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                           Text('${getTranslated('total', context)} ', style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
//                           Text('(${getTranslated('inc_vat_tax', context)})', style: rubikMedium.copyWith(
//                             fontSize: Dimensions.fontSizeExtraSmall, color: Theme.of(context).disabledColor,
//                           )),
//                         ]),
//                         const Spacer(),
//
//
//                         CustomDirectionalityWidget(
//                           child: Text(
//                             PriceConverterHelper.convertPrice(priceWithAddonsVariation),
//                             style: rubikMedium.copyWith(color: Theme.of(context).primaryColor),
//                           ),
//                         ),
//                         const SizedBox(width: Dimensions.paddingSizeSmall),
//
//                         (priceWithAddonsVariationWithoutDiscount > priceWithAddonsVariation) ? CustomDirectionalityWidget(child: Text(
//                           PriceConverterHelper.convertPrice(priceWithAddonsVariationWithoutDiscount),
//                           style: rubikMedium.copyWith(
//                             color: Theme.of(context).disabledColor,
//                             fontSize: Dimensions.fontSizeSmall,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         )) : const SizedBox(),
//                       ]),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
//                       child: Row(children: [
//
//                         _quantityButton(context),
//                         const SizedBox(width: Dimensions.paddingSizeLarge),
//
//                         Expanded(child: _cartButton(isAvailable, context, cartModel, variationList)),
//
//                       ]),
//                     ),
//                     const SizedBox(height: Dimensions.paddingSizeDefault),
//
//                   ]);
//                 },
//               ),
//             ),
//           ),
//
//           /// for web dialog close button
//           ResponsiveHelper.isMobile() ? const SizedBox() : Positioned(
//             right: 0, top: 0,
//             child: Material(
//               color: Theme.of(context).cardColor,
//               clipBehavior: Clip.hardEdge,
//               borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//               child: InkWell(onTap: () => context.pop(), child: Container(
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                 ),
//                 padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
//                 child: const Icon(Icons.close, size: Dimensions.fontSizeDefault),
//               )),
//             ),
//           ),
//
//         ]);
//       },
//     );
//   }
//
//   Widget _addonsView(BuildContext context, ProductProvider productProvider) {
//     return widget.product!.addOns!.isNotEmpty ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(getTranslated('addons', context)!, style: rubikMedium),
//       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//       ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: widget.product!.addOns!.length,
//         itemBuilder: (context, i) {
//           return InkWell(
//             onTap: () {
//               if (!productProvider.addOnActiveList[i]) {
//                 productProvider.addAddOn(true, i);
//               } else if (productProvider.addOnQtyList[i] == 1) {
//                 productProvider.addAddOn(false, i);
//               }
//             },
//             child: Row(children: [
//
//               Expanded(child: Row(children: [
//
//                 Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//                   Checkbox(
//                     value: productProvider.addOnActiveList[i],
//                     activeColor: Theme.of(context).primaryColor,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
//                     side: BorderSide(color: productProvider.addOnActiveList[i]
//                         ? Colors.transparent : Theme.of(context).hintColor, width: 1),
//                     onChanged:(bool? newValue) {
//
//                       if (!productProvider.addOnActiveList[i]) {
//                         productProvider.addAddOn(true, i);
//                       } else if (productProvider.addOnQtyList[i] == 1) {
//                         productProvider.addAddOn(false, i);
//                       }
//
//                     },
//                     visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
//                   ),
//                   Text(
//                     widget.product!.addOns![i].name!,
//                     maxLines: 1, overflow: TextOverflow.ellipsis,
//                     style: robotoRegular.copyWith(
//                       fontSize: Dimensions.fontSizeSmall,
//                       color: productProvider.addOnActiveList[i]
//                           ? Theme.of(context).textTheme.bodyMedium?.color : Theme.of(context).disabledColor,
//                     ),
//                   ),
//                 ]),
//                 const Spacer(),
//
//                 CustomDirectionalityWidget(child: Text(
//                   PriceConverterHelper.convertPrice(widget.product!.addOns![i].price),
//                   maxLines: 1, overflow: TextOverflow.ellipsis,
//                   style: robotoRegular.copyWith(
//                     fontSize: Dimensions.fontSizeSmall,
//                     color: productProvider.addOnActiveList[i]
//                         ? Theme.of(context).textTheme.bodyMedium?.color : Theme.of(context).disabledColor,
//                   ),
//                 )),
//
//               ])),
//
//               if(productProvider.addOnActiveList[i])
//                 Container(
//                   width: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//                     color: Theme.of(context).primaryColor.withOpacity(0.05),
//                   ),
//                   margin: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
//                   padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Expanded(child: InkWell(
//                       onTap: () {
//                         if (productProvider.addOnQtyList[i]! > 1) {
//                           productProvider.setAddOnQuantity(false, i);
//                         } else {
//                           productProvider.addAddOn(false, i);
//                         }
//                       },
//                       child: Center(child: Icon(
//                         productProvider.addOnQtyList[i] == 1? Icons.delete_outlined : Icons.remove,
//                         size: 15,
//                         color: Theme.of(context).primaryColor,
//                       )),
//                     )),
//                     Text(productProvider.addOnQtyList[i].toString(), style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
//                     Expanded(child: InkWell(
//                       onTap: () => productProvider.setAddOnQuantity(true, i),
//                       child: Center(child: Icon(Icons.add, size: 15, color: Theme.of(context).primaryColor)),
//                     )),
//                   ]),
//               ),
//             ]),
//           );
//         },
//       ),
//
//       /*GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 4,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 10,
//           childAspectRatio: (1 / 1.1),
//         ),
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: widget.product!.addOns!.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               if (!productProvider.addOnActiveList[index]) {
//                 productProvider.addAddOn(true, index);
//               } else if (productProvider.addOnQtyList[index] == 1) {
//                 productProvider.addAddOn(false, index);
//               }
//             },
//
//             child: Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.only(bottom: productProvider.addOnActiveList[index] ? 2 : 20),
//               decoration: BoxDecoration(
//                 color: productProvider.addOnActiveList[index]
//                     ? Theme.of(context).primaryColor
//                     : Theme.of(context).colorScheme.background.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(5),
//                 boxShadow: productProvider.addOnActiveList[index]
//                     ? [BoxShadow(
//                   color: Theme.of(context).shadowColor,
//                   blurRadius:Provider.of<ThemeProvider>(context).darkTheme ? 2 : 5,
//                   spreadRadius: Provider.of<ThemeProvider>(context).darkTheme ? 0 : 1,
//                 )]
//                     : null,
//               ),
//               child: Column(children: [
//                 Expanded(
//                     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                       Text(widget.product!.addOns![index].name!,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: rubikMedium.copyWith(
//                             color: productProvider.addOnActiveList[index]
//                                 ? Colors.white
//                                 : Theme.of(context).textTheme.bodyLarge?.color,
//                             fontSize: Dimensions.fontSizeSmall,
//                           )),
//                       const SizedBox(height: 5),
//
//                       CustomDirectionalityWidget(child: Text(
//                         PriceConverterHelper.convertPrice(widget.product!.addOns![index].price),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: rubikRegular.copyWith(
//                             color: productProvider.addOnActiveList[index]
//                                 ? Colors.white
//                                 : Theme.of(context).textTheme.bodyLarge?.color,
//                             fontSize: Dimensions.fontSizeExtraSmall),
//                       )),
//                     ])),
//                 productProvider.addOnActiveList[index] ? Container(
//                   height: 25,
//                   decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(5), color: Theme.of(context).cardColor),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           if (productProvider.addOnQtyList[index]! > 1) {
//                             productProvider.setAddOnQuantity(false, index);
//                           } else {
//                             productProvider.addAddOn(false, index);
//                           }
//                         },
//                         child: const Center(child: Icon(Icons.remove, size: 15)),
//                       ),
//                     ),
//                     Text(productProvider.addOnQtyList[index].toString(),
//                         style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),
//                     Expanded(
//                       child: InkWell(
//                         onTap: () => productProvider.setAddOnQuantity(true, index),
//                         child: const Center(child: Icon(Icons.add, size: 15)),
//                       ),
//                     ),
//                   ]),
//                 )
//                     : const SizedBox(),
//               ]),
//             ),
//           );
//         },
//       ),*/
//
//     ]) : const SizedBox();
//   }
//
//   /*Widget _quantityView(BuildContext context) {
//     return Row(children: [
//       Text(getTranslated('quantity', context)!, style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeLarge)),
//       const Expanded(child: SizedBox()),
//       _quantityButton(context),
//     ]);
//   }*/
//
//   Widget _cartButton(bool isAvailable, BuildContext context, CartModel cartModel, List<Variation>? variationList) {
//     return Column(children: [
//       isAvailable ? const SizedBox() :
//       Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//         margin: const EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Theme.of(context).primaryColor.withOpacity(0.1),
//         ),
//         child: Column(children: [
//           Text(getTranslated('not_available_now', context)!,
//               style: rubikMedium.copyWith(
//                 color: Theme.of(context).primaryColor,
//                 fontSize: Dimensions.fontSizeLarge,
//               )),
//           Text(
//             '${getTranslated('available_will_be', context)} ${DateConverterHelper.convertTimeToTime(widget.product!.availableTimeStarts!, context)} '
//                 '- ${DateConverterHelper.convertTimeToTime(widget.product!.availableTimeEnds!, context)}',
//             style: rubikRegular,
//           ),
//         ]),
//       ),
//
//       Consumer<ProductProvider>(
//         builder: (context, productProvider, _) {
//           final CartProvider cartProvider =  Provider.of<CartProvider>(context, listen: false);
//           int quantity =  cartProvider.getCartProductQuantityCount(widget.product!);
//           return CustomButtonWidget(
//               btnTxt: getTranslated(widget.cart != null ? 'update_in_cart' : 'add_to_cart', context),
//               textStyle: rubikMedium.copyWith(color: Theme.of(context).cardColor),
//               backgroundColor: Theme.of(context).primaryColor,
//               onTap: widget.cart == null && !productProvider.checkStock(widget.product!, quantity: quantity)  ? null : () {
//                 if(variationList != null){
//                   for(int index = 0; index < variationList.length; index++) {
//                     if(!variationList[index].isMultiSelect! && variationList[index].isRequired!
//                         && !productProvider.selectedVariations[index].contains(true)) {
//                       showCustomSnackBarHelper('${getTranslated('choose_a_variation_from', context)} ${variationList[index].name}', isToast: true, isError: true);
//                       return;
//                     }else if(variationList[index].isMultiSelect! && (variationList[index].isRequired!
//                         || productProvider.selectedVariations[index].contains(true)) && variationList[index].min!
//                         > productProvider.selectedVariationLength(productProvider.selectedVariations, index)) {
//                       showCustomSnackBarHelper('${getTranslated('you_need_to_select_minimum', context)} ${variationList[index].min} '
//                           '${getTranslated('to_maximum', context)} ${variationList[index].max} ${getTranslated('options_from', context)
//                       } ${variationList[index].name} ${getTranslated('variation', context)}',isError: true, isToast: true);
//                       return;
//                     }
//                   }
//                 }
//
//                 context.pop();
//                 Provider.of<CartProvider>(context, listen: false).addToCart(cartModel, widget.cart != null ? widget.cartIndex : productProvider.cartIndex);
//               }
//           );
//         }
//       ),
//     ]);
//   }
//
//   Widget _productView(BuildContext context,double price, double priceWithDiscount) {
//     final splashProvider = Provider.of<SplashProvider>(context, listen: false);
//     return ResponsiveHelper.isDesktop(context)
//         ? Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
//
//           InkWell(
//             onTap: ResponsiveHelper.isDesktop(context) ? null : ()=>  RouterHelper.getProductImageScreen(widget.product ?? widget.cart!.product!),
//             child: CustomZoomWidget(child: Stack(children: [
//
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: CustomImageWidget(
//                   placeholder: Images.placeholderRectangle,
//                   image: '${splashProvider.baseUrls!.productImageUrl}/${widget.product!.image}',
//                   width: ResponsiveHelper.isMobile()
//                       ? 100
//                       : ResponsiveHelper.isTab(context)
//                       ? 140
//                       : ResponsiveHelper.isDesktop(context)
//                       ? 140
//                       : null,
//                   height: ResponsiveHelper.isMobile()
//                       ? 100
//                       : ResponsiveHelper.isTab(context)
//                       ? 140
//                       : ResponsiveHelper.isDesktop(context)
//                       ? 140
//                       : null,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//               StockTagWidget(product: widget.product!),
//
//             ])),
//             ),
//           const SizedBox(width: Dimensions.paddingSizeDefault),
//
//           Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
//
//             /// for Name and Wish Button
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Flexible(child: Text(
//                 widget.product!.name!,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: rubikMedium,
//               )),
//
//              WishButtonWidget(product: widget.product),
//             ]),
//             const SizedBox(height: Dimensions.paddingSizeSmall),
//
//             /// for Ratting Bar
//             RatingBarWidget(rating: widget.product!.rating!.isNotEmpty ? double.parse(widget.product!.rating![0].average!) : 0.0, size: 15),
//             const SizedBox(height: Dimensions.paddingSizeLarge),
//
//             /// for Item Price
//             Row( mainAxisSize: MainAxisSize.min, children: [
//               price > priceWithDiscount ? CustomDirectionalityWidget(child: Text(
//                 PriceConverterHelper.convertPrice(price),
//                 style: rubikRegular.copyWith(
//                   color: Theme.of(context).hintColor.withOpacity(0.7),
//                   decoration: TextDecoration.lineThrough,
//                   overflow: TextOverflow.ellipsis,
//                   fontSize: Dimensions.fontSizeSmall,
//                 ),
//                 maxLines: 1,
//               )) : const SizedBox(),
//               const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//
//               CustomDirectionalityWidget(child: Text(
//                 PriceConverterHelper.convertPrice(price, discount: widget.product!.discount, discountType: widget.product!.discountType),
//                 style: rubikMedium.copyWith(overflow: TextOverflow.ellipsis),
//                 maxLines: 1,
//               )),
//             ]),
//             const SizedBox(height: Dimensions.paddingSizeLarge),
//
//             /// for Veg, non-veg tag
//             widget.product!.productType != null ? ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 100), child: _VegTagView(product: widget.product),
//             ) : const SizedBox(),
//
//           ])),
//
//     ]) : Container(
//       constraints: const BoxConstraints(maxHeight: 280),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//         /// for Item image and Stock
//         Expanded(child: InkWell(
//           onTap: ResponsiveHelper.isDesktop(context) ? null : ()=>  RouterHelper.getProductImageScreen(widget.product ?? widget.cart!.product!),
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(Dimensions.radiusLarge),
//             topRight: Radius.circular(Dimensions.radiusLarge),
//           ),
//           child: CustomZoomWidget(child: Stack(children: [
//
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(Dimensions.radiusLarge),
//                 topRight: Radius.circular(Dimensions.radiusLarge),
//               ),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: CustomImageWidget(
//                   placeholder: Images.placeholderRectangle,
//                   image: '${splashProvider.baseUrls!.productImageUrl}/${widget.product!.image}',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//
//             Positioned.fill(child: Align(alignment: Alignment.topRight, child: WishButtonWidget(
//               product: widget.product,
//               edgeInset: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
//             ))),
//
//             StockTagWidget(product: widget.product!),
//
//           ])),
//         )),
//
//         /// for Price and Rating card
//         Container(
//           transform: Matrix4.translationValues(0, -30, 0),
//           margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
//           padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
//           constraints: const BoxConstraints(maxHeight: 80),
//           decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
//             boxShadow: [BoxShadow(color: Theme.of(context).shadowColor.withOpacity(0.5), blurRadius: Dimensions.radiusDefault)],
//           ),
//           child: Row(children: [
//
//             Expanded(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
//                 Text(
//                   widget.product!.name!,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: rubikMedium,
//                 ),
//                 const SizedBox(height: Dimensions.paddingSizeSmall),
//                 RatingBarWidget(rating: widget.product!.rating!.isNotEmpty ? double.parse(widget.product!.rating![0].average!) : 0.0, size: 15),
//               ]),
//             ),
//             const SizedBox(width: Dimensions.paddingSizeSmall),
//
//             Column(mainAxisSize: MainAxisSize.min, children: [
//
//               Expanded(child: Row(mainAxisSize: MainAxisSize.min,  children: [
//                 price > priceWithDiscount ? CustomDirectionalityWidget(child: Text(
//                   PriceConverterHelper.convertPrice(price),
//                   style: rubikRegular.copyWith(
//                     color: Theme.of(context).hintColor.withOpacity(0.7),
//                     decoration: TextDecoration.lineThrough,
//                     overflow: TextOverflow.ellipsis,
//                     fontSize: Dimensions.fontSizeSmall,
//                   ),
//                   maxLines: 1,
//                 )) : const SizedBox(),
//                 const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//
//                 CustomDirectionalityWidget(child: Text(
//                   PriceConverterHelper.convertPrice(price, discount: widget.product!.discount, discountType: widget.product!.discountType),
//                   style: rubikMedium.copyWith(overflow: TextOverflow.ellipsis),
//                   maxLines: 1,
//                 )),
//               ])),
//
//             ]),
//
//           ]),
//         ),
//
//       ]),
//     );
//   }
//
//   Widget _quantityButton(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context, listen: false);
//
//     return Row(children: [
//       InkWell(
//         onTap: () => productProvider.quantity! > 1 ?  productProvider.setQuantity(false) : null,
//         child: Container(
//           padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//           ),
//           child: const Icon(Icons.remove, size: Dimensions.fontSizeExtraLarge),
//         ),
//       ),
//
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//         child: Text(productProvider.quantity.toString(), style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
//       ),
//
//       InkWell(
//         onTap: () {
//           final CartProvider cartProvider =  Provider.of<CartProvider>(context, listen: false);
//           int quantity =  cartProvider.getCartProductQuantityCount(widget.product!);
//           if(productProvider.checkStock(
//             widget.cart != null ? widget.cart!.product! : widget.product!,
//             quantity: (productProvider.quantity ?? 0) + quantity ,
//           )){
//             productProvider.setQuantity(true);
//           }else{
//             showCustomSnackBarHelper(getTranslated('out_of_stock', context));
//           }
//         },
//         child: Container(
//           padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//           ),
//           child: Icon(Icons.add, size: Dimensions.fontSizeExtraLarge, color: Theme.of(context).cardColor),
//         ),
//       ),
//     ]);
//   }
//
// }
//
// class _CartProductDescription extends StatelessWidget {
//   const _CartProductDescription({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   final Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     return product.description != null && product.description!.isNotEmpty ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//         Text(getTranslated('description', context)!, style: rubikMedium),
//
//         product.productType != null && ResponsiveHelper.isMobile() ? _VegTagView(product: product) : const SizedBox(),
//       ]),
//       const SizedBox(height: Dimensions.paddingSizeExtraSmall),
//
//       Align(
//         alignment: Alignment.topLeft,
//         child: ReadMoreText(
//           product.description ?? '',
//           trimLines: 1,
//           trimCollapsedText: getTranslated('show_more', context),
//           trimExpandedText: getTranslated('show_less', context),
//           style: rubikRegular.copyWith(
//             color: Theme.of(context).hintColor,
//             fontSize: Dimensions.fontSizeSmall,
//           ),
//           moreStyle: rubikRegular.copyWith(
//             color: Theme.of(context).hintColor,
//             fontSize: Dimensions.fontSizeSmall,
//           ),
//           lessStyle: rubikRegular.copyWith(
//             color: Theme.of(context).hintColor,
//             fontSize: Dimensions.fontSizeSmall,
//           ),
//         ),
//       ),
//       const SizedBox(height: Dimensions.paddingSizeLarge),
//     ]) : const SizedBox();
//   }
// }
//
// class _VegTagView extends StatelessWidget {
//   final Product? product;
//   const _VegTagView({Key? key, this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SplashProvider>(
//       builder: (context, splashProvider, _) {
//         return Visibility(visible: splashProvider.configModel!.isVegNonVegActive!, child: Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor.withOpacity(0.05),
//             borderRadius: BorderRadius.circular(Dimensions.radiusExtraLarge),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
//           child: SizedBox(height: 30, child: Row(children: [
//
//             Padding(padding:  const EdgeInsets.all(Dimensions.paddingSizeExtraSmall), child: CustomAssetImageWidget(
//               Images.getImageUrl('${product!.productType}'), fit: BoxFit.fitHeight,
//             )),
//             const SizedBox(width: Dimensions.paddingSizeExtraSmall),
//
//             Text(
//               getTranslated('${product!.productType}', context)!,
//               style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor),
//             ),
//
//           ])),
//         ));
//       }
//     );
//   }
// }
//
