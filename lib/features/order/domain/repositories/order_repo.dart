import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final DioClient? dioClient;
  final SharedPreferences sharedPreferences;
  OrderRepo({required this.dioClient, required this.sharedPreferences});


  Future<ApiResponseModel> getOrderDetails(String orderID) async {
    try {
      final response = await dioClient!.get(AppConstants.productDetailsUri);
      return ApiResponseModel.withSuccess(response);
    }catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

}