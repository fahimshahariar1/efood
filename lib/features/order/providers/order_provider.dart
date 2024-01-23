import 'package:flutter/cupertino.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/features/order/domain/models/order_details_model.dart';
import 'package:flutter_restaurant/features/order/domain/repositories/order_repo.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';

class OrderProvider extends ChangeNotifier {
  final OrderRepo? orderRepo;
  OrderProvider({required this.orderRepo});

  List<OrderDetailsModel>? _orderDetails;

  List<OrderDetailsModel>? get orderDetailsModel => _orderDetails;



  Future<List<OrderDetailsModel>?> getOrderDetails(String orderID) async {
    _orderDetails = null;

    ApiResponseModel apiResponse = await orderRepo!.getOrderDetails(orderID);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _orderDetails = [];
      apiResponse.response!.data.forEach((orderDetail) => _orderDetails!.add(OrderDetailsModel.fromJson(orderDetail)));
    } else {
      _orderDetails = [];
      ApiCheckerHelper.checkApi(apiResponse);
    }

    notifyListeners();
    return _orderDetails;
  }

}