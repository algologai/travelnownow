// ignore_for_file: prefer_adjacent_string_concatenation, file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:reminderapp/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:reminderapp/data/response/app_exceptions.dart';
import 'package:reminderapp/helper/app_status.dart';
import 'package:reminderapp/models/signup/signupErrorResponse.dart';

class NetworkApiServices extends BaseApiServices {
  late SignupErrorResponse signupErrorResponse;
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic resonseJson;

    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      resonseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return resonseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return Success(code: 200, response: responseJson);
      case 400:
        //throw BadRequestException(response.body.toString());
        dynamic responseJson = jsonDecode(response.body);
        return Failure(errorResponse: signupErrorResponseFromJson(response.body));
      case 500:
      case 404:
      throw UnauthorisedExeption(response.toString());
      default:
        throw FetchDataException(
            'Error Accrued while communication with server' +
                'with status code ' +
                response.statusCode.toString());
    }
  }
}
