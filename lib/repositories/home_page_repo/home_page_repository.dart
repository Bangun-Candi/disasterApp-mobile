import 'package:merchant_app/core/services/model/base_response_model.dart';
import 'package:merchant_app/repositories/home_page_repo/dummy_data/get_my_location_dummy.dart';
import 'package:merchant_app/repositories/home_page_repo/request/get_my_location_request.dart';
import 'package:merchant_app/repositories/home_page_repo/response/get_my_location_response.dart';
import 'package:merchant_app/repositories/home_page_repo/view_data_model/get_my_location_DM.dart';

class HomePageRepository {
  final String _baseUrl = "";
  Future<BaseResponseModel> getMyLocation(GetMyLocationRequest param) async {
    BaseResponseModel baseModelResponse =
        BaseResponseModel.fromJson(GetMyLocationDummy().getMyLocationDummy);

    GetMyLocationResponse responseData =
        GetMyLocationResponse.fromJson(baseModelResponse.data);

    GetMyLocationDM dataDM = GetMyLocationDM()
      ..disasterName = responseData.disasterName
      ..disasterNameCode = responseData.disasterNameCode
      ..locationName = responseData.locationName
      ..sendRescueStatus = responseData.sendRescueStatus
      ..statusDisasterCode = responseData.statusDisasterCode
      ..statusLocation = responseData.statusLocation;

    baseModelResponse.data = dataDM;

    return baseModelResponse;
    // try {
    //   var response = await Dio().get('$_baseUrl/list');
    //   if (response.statusCode == 200) {
    //     //print(response.data);
    //     // var result = RestaurantListModel.fromJson(response.data);

    //     return result;
    //   } else {
    //     throw Exception('failed to load data');
    //   }
    // } catch (e) {
    //   rethrow;
    // }
  }
}
