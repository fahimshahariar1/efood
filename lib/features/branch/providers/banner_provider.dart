import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/features/branch/domain/repositories/banner_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/home/domain/models/banner_model.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';


class BannerProvider extends ChangeNotifier {
  final BannerRepo? bannerRepo;
  BannerProvider({required this.bannerRepo});

  List<BannerModel>? _bannerList;
  List<BannerModel>? _secondaryBannerList;
  final List<Product> _productList = [];

  List<BannerModel>? get bannerList => _bannerList;
  List<BannerModel>? get secondaryBannerList => _secondaryBannerList;
  List<Product> get productList => _productList;

  Future<void> getBannerList(bool reload) async {
    if(bannerList == null || reload) {
      ApiResponseModel apiResponse = await bannerRepo!.getBannerList();
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _bannerList = [];
        _secondaryBannerList = [];
        apiResponse.response!.data.forEach((bannerData) {
          BannerModel bannerModel = BannerModel
              .fromJson(bannerData);


          void getProductDetails(
              String productID) async {
            ApiResponseModel apiResponse = await bannerRepo!
                .getProductDetails(productID);
            if (apiResponse.response != null &&
                apiResponse.response!
                    .statusCode == 200) {
              _productList.add(Product.fromJson(
                  apiResponse.response!.data));
            } else {
              ApiCheckerHelper.checkApi(
                  apiResponse);
            }
          }});
          }}}}