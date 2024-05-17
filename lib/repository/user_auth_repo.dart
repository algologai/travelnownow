// import 'dart:convert';

// import 'package:reminderapp/repository/auth_api_service.dart';
// import 'package:reminderapp/helper/app_status.dart';
// import 'package:reminderapp/models/userlogin/user_login_success.dart';

// class AuthRepository {
//   final AuthApiService
//       apiService; // Instance of the ApiService class to perform API requests.

//   AuthRepository({required this.apiService});

//   Future<Object> login(Map<dynamic, dynamic> req) async {
//     try {
//       // Attempt to make the API call to login the user using the apiService.
//       final response = await apiService.loginUser(req);
//       // Store the response from the API call in the 'response' variable.
//       // If the API call is successful, return the response (String) to the caller.

//        return AuthSuccess(response: userLoginSuccesslFromJson(response));
//     } catch (e) {
//       // If an exception occurs during the API call, catch it and handle the error.
//       throw Exception('Failed to login');
//       // Throw a new Exception with the message 'Failed to login', indicating that the login process failed.
//       // The caller of this function can catch this exception and handle the error appropriately.
//     }
//   }
// }

//   // Future<dynamic> userauth(Map<String, dynamic> data) async {
//   //   try {
//   //     String jsondata = json.encode(data);
//   //     // ignore: prefer_interpolation_to_compose_strings
//   //     var response = await http.post(Uri.parse(BASE_URL + "login/"),
//   //         headers: {"Content-Type": "application/json"}, body: jsondata);
//   //     if (response.statusCode == 200) {
//   //       return AuthSuccess(
//   //           status: response.statusCode,
//   //           response: response.body);
//   //     } else if (response.statusCode == 400) {
//   //       return AuthFailure(
//   //           status: false,
//   //           response: response.body);
//   //     }
//   //     return Failure(
//   //         code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
//   //   } on HttpException {
//   //     return Failure(
//   //         code: NO_INTERNET, errorResponse: 'No Internet Connection');
//   //   } on FormatException {
//   //     return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
//   //   } catch (e) {
//   //     return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
//   //   }
// // }