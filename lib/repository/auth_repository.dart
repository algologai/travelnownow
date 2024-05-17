import 'package:reminderapp/data/network/BaseApiServices.dart';
import 'package:reminderapp/data/network/NetworkApiService.dart';
import 'package:reminderapp/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;

    } catch (e) {
      throw e;
    }
  }



  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.signupEndPoint, data);
      return response;

    } catch (e) {
      throw e;
    }
  }
}
