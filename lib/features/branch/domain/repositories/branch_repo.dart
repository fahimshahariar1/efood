import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_restaurant/util/app_constants.dart';

class BranchRepo {
  final DioClient dioClient;

  BranchRepo({required this.dioClient});

  Future<ApiResponseModel> getBranches() async {
    try {
      final response = await dioClient.get(AppConstants.configUri);
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(e);
    }
  }
}