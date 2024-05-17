import 'package:reminderapp/data/network/BaseApiServices.dart';
import 'package:reminderapp/data/network/NetworkApiService.dart';
import 'package:reminderapp/res/app_url.dart';

class SignupRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

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
