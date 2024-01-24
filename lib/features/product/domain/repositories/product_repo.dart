
import 'package:flutter_restaurant/common/enums/product_filter_type_enum.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_restaurant/helper/product_helper.dart';
import 'package:flutter_restaurant/utill/app_constants.dart';

class ProductRepo {
  final DioClient? dioClient;

  ProductRepo({required this.dioClient});



  Future<ApiResponseModel> getProductDetails(String productID) async {
    try {
      final response = await dioClient!.get('${AppConstants.productDetailsUri}$productID',

      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getLatestProductList(int offset, int limit, ProductFilterType? filterType) async {
    try {

      final response = await dioClient!.get(
        '${AppConstants.latestProductUri}?limit=$limit&&offset=$offset${filterType != null ? '&sort_by=${ProductHelper.getProductFilterTypeValue(filterType)}' : ''}',

      );
      return ApiResponseModel.withSuccess(response);

    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }

  }


}
