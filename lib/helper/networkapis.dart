import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
final String _baseURL = "http://172.20.10.3:8000/api/person/";

  get() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        var responseJSON = json.decode(response.body.toString());
        return responseJSON;
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

//posting data
  post(String endpoint, Map<String, dynamic> data) async {
    String jsondata = json.encode(data);
    // String jsondata = jsonEncode(data);
    try {
      final response = await http.post(Uri.parse(_baseURL + endpoint),
          headers: {"Content-Type": "application/json"}, body: jsondata);

      if (response.statusCode == 200) {
        var responseJSON = json.decode(response.body.toString());
        return responseJSON;
      }
    } catch (e) {
      rethrow;
    }
  }

  //put method

  put(String endpoint, Map<String, dynamic> data) async {
    String jsondata = json.encode(data);
    // String jsondata = jsonEncode(data);
    try {
      final response = await http.put(Uri.parse(_baseURL + endpoint),
          headers: {"Content-Type": "application/json"}, body: jsondata);

      if (response.statusCode == 200) {
        var responseJSON = json.decode(response.body.toString());
        return responseJSON;
      }
    } catch (e) {
      rethrow;
    }
  }

  //delete method

  delete(String endpoint) async {
    try {
      final response = await http.delete(Uri.parse(_baseURL + endpoint));

      if (response.statusCode == 200) {
        var responseJSON = json.decode(response.body.toString());
        return responseJSON;
      }
    } catch (e) {
      rethrow;
    }
  }
}
