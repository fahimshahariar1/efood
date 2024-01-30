import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant/common/models/cart_model.dart';
import 'package:flutter_restaurant/features/cart/domain/repositories/cart_repo.dart';

class CartProvider extends ChangeNotifier {
  final CartRepo cartRepo;

  CartProvider({required this.cartRepo});

  List<CartModel> _cartList = [];
  double _totalPrice = 0.0;

  List<CartModel> get cartList => _cartList;
  double get totalPrice => _totalPrice;

  void getCartData() {
    _cartList = [];
    _cartList.addAll(cartRepo.getCartList());

    calculateTotalPrice();
  }

  void addToCart(CartModel cartModel, int index) {
    if(index != null && index != -1) {
      _cartList.replaceRange(index, index+1, [cartModel]);
    }else {
      _cartList.add(cartModel);
    }

    cartRepo.addToCartList(_cartList);

    calculateTotalPrice();
    notifyListeners();
  }

  void setQuantity({
    required bool isIncrement,
     CartModel? cart,
    required int productIndex,
    required bool fromProductView
  }) {
    int index = fromProductView ? productIndex : _cartList.indexOf(cart!);

    if (isIncrement) {
      _cartList[index].quantity = _cartList[index].quantity! + 1;
    } else {
      _cartList[index].quantity = _cartList[index].quantity! - 1;
    }

    cartRepo.addToCartList(_cartList);

    calculateTotalPrice();
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartList.removeAt(index);
    cartRepo.addToCartList(_cartList);

    calculateTotalPrice();
    notifyListeners();
  }

  void calculateTotalPrice() {
    _totalPrice = 0;
    for(CartModel cart in _cartList) {
      if(cart.discountedPrice != null && cart.quantity != null) {
        _totalPrice += cart.discountedPrice! * cart.quantity!;
      }
    }
  }

  void setPrice(double price, {bool isUpdate = false}){
    _totalPrice = price;
    if(isUpdate){
      notifyListeners();
    }
  }

  int? getCartProductIndex(CartModel? cartModel) {
    for(int index = 0; index < _cartList.length; index ++) {
      if(_cartList[index]!.product!.id == cartModel!.product!.id && (
          _cartList[index]!.variation!.isNotEmpty && cartModel.variation!.isNotEmpty ? _cartList[index]!.variation![0].type == cartModel.variation![0].type : true
      )) {
        return index;
      }
    }
    return null;
  }

}


