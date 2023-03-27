import 'dart:convert';
import 'dart:io';

import 'package:drawer/data/app_exception.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {
  dynamic responseJson;
  Future<dynamic> getApiRespones(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet Connection');
    }
    return responseJson;
  }
}

returnResponse(http.Response response) {
  print("response:: ${response.statusCode}");
  switch (response.statusCode) {

    case 200:
      print("response:: ${response.body}");
      return jsonDecode(response.body);
    case 400:
      throw FetchDataException("No Internet Connection");
  }
}
