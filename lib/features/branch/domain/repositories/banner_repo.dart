import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_restaurant/util/app_constants.dart';

class BannerRepo {
  final DioClient dioClient;
  BannerRepo({required this.dioClient});
  
  Future<ApiResponseModel> getBannerList() async {
    try{
      final response = await dioClient.get(AppConstants.bannerUri);
      return ApiResponseModel.withSuccess(response);
    }catch (e){
      return ApiResponseModel.withError(e);
    }
  }


  Future<ApiResponseModel> getProductDetails(String productID) async {
    try {
      final response = await dioClient!.get('${AppConstants.productDetailsUri}$productID');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
  
}