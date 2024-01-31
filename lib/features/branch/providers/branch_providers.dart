import 'package:flutter/foundation.dart';
import 'package:flutter_restaurant/common/models/api_response_model.dart';
import 'package:flutter_restaurant/common/models/config_model.dart';
import 'package:flutter_restaurant/features/branch/domain/repositories/branch_repo.dart';
import 'package:flutter_restaurant/features/branch/screens/branch_screen.dart';
import 'package:flutter_restaurant/helper/api_checker_helper.dart';

class BranchProvider extends ChangeNotifier {
  final BranchRepo branchRepo;

  BranchProvider({required this.branchRepo});

  List<Branches>? _branches;

  List<Branches>? get branches => _branches;


  Future<void> getBranches() async {
    ApiResponseModel apiResponse = await branchRepo.getBranches();

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      if (kDebugMode) {
        print("API Response===>: ${apiResponse.response?.statusCode}");
      }
      if (kDebugMode) {
        print("API Data===>: ${apiResponse.response?.data}");
      }
      _branches = [];
      //apiResponse.response!.data.forEach((branch) => _branches!.add(Branch.fromJson(branch)));
    } else {
        ApiCheckerHelper.checkApi(apiResponse);
    }

    notifyListeners();
  }
}


