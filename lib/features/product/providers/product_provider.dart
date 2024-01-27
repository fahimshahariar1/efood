
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/common/models/cart_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/product/domain/models/product_details_model.dart';
import 'package:flutter_restaurant/features/product/domain/repositories/product_repo.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo? productRepo;
  ProductProvider({required this.productRepo});


  Product? _product;
  ProductModel? _latestProductModel;
  List<Product>? _offerProductList;
  bool _isLoading = false;
  List<int>? _variationIndex;
  int? _quantity = 1;
  int _imageSliderIndex = 0;
  int _tabIndex = 0;
  int offset = 1;
  ProductDetailsModel? _productDetailsModel;


  Product? get product => _product;
  ProductModel? get latestProductModel => _latestProductModel;
  List<Product>? get offerProductList => _offerProductList;
  bool get isLoading => _isLoading;
  List<int>? get variationIndex => _variationIndex;
  int? get quantity => _quantity;
  int get imageSliderIndex => _imageSliderIndex;
  int get tabIndex => _tabIndex;
  ProductDetailsModel? get productDetailsModel => _productDetailsModel;


  void getLatestProductList(int offset, {ProductFilterType? filterType, bool isUpdate = true, int? limit = 15}) async {
    if (offset == 1) {
      _latestProductModel = null;
      if (kDebugMode) {

      }
    }

    ApiResponseModel apiResponse = await productRepo!.getLatestProductList(offset, limit ?? 15, filterType);
    if (kDebugMode) {
      print("API Response===>: ${apiResponse.response?.statusCode}");
      print("API Data===>: ${apiResponse.response?.data}");
    }

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      ProductModel newProductModel = ProductModel.fromJson(apiResponse.response?.data);

      if (offset == 1) {
        _latestProductModel = newProductModel;
        if (isUpdate) {
          notifyListeners();
        }
      } else {
        _latestProductModel!.totalSize = newProductModel.totalSize;
        _latestProductModel!.offset = newProductModel.offset;
        _latestProductModel!.products!.addAll(newProductModel.products!);

        if (isUpdate) {
          notifyListeners();
        }
      }
    }
  }


      Future<void> getProductDetails(Product product, CartModel? cart) async {
    if(product.name != null) {
      _product = product;
    }else {
      _product = null;
      ApiResponseModel apiResponse = await productRepo!.getProductDetails(product.id.toString());
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _productDetailsModel = ProductDetailsModel.fromJson(apiResponse.response!.data);
        _product = _productDetailsModel?.product;
      } else {
        ApiCheckerHelper.checkApi(apiResponse);
      }
    }
    initDataLoad(_productDetailsModel?.product, cart);
  }



  void showBottomLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void setImageSliderIndex(int index) {
    _imageSliderIndex = index;
    notifyListeners();
  }

  void initDataLoad(Product? product, CartModel? cart, {bool isUpdate = true}) {
    _tabIndex = 0;
    _variationIndex = [];
    if(cart != null) {
      _quantity = cart.quantity;
      List<String> variationTypes = [];
      if(cart.variation!.isNotEmpty &&  cart.variation![0].type != null) {
        variationTypes.addAll(cart.variation![0].type!.split('-'));
      }
      int varIndex = 0;
      for (var choiceOption in product!.choiceOptions!) {
        for (int index = 0; index < choiceOption.options!.length; index++) {
          if (choiceOption.options![index].trim().replaceAll(' ', '') ==
              variationTypes[varIndex].trim()) {
            _variationIndex!.add(index);
            break;
          }
        }
        varIndex++;
      }
    }else {
      _quantity = 1;
      product?.choiceOptions?.forEach((element) => _variationIndex?.add(0));

    }
    //todo check listener
    if(isUpdate) {
      notifyListeners();
    }
  }


  void setCartVariationIndex(int index, int i) {
    _variationIndex![index] = i;
    _quantity = 1;
    notifyListeners();
  }

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }



}
