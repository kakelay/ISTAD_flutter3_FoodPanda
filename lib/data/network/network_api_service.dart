import 'dart:convert';
import 'dart:io';

import 'package:drawer/data/app_exception.dart';
import 'package:drawer/models/response/image.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {
  dynamic responseJson;

  Future uploadImage(String url, file) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("files", file));

    var response = await request.send();

    print('success image post = ${response.statusCode}');
    if (response.statusCode == 200) {
      final  res = await response.stream.bytesToString();
      // var decode =json.decode(res);
      var imaglist = imageModelFromJson(res);
      return imaglist[0];

    } else {
      //Mean  of  reasonPhrase is  Error  some part of post code response
      // print("error");
      print(response.reasonPhrase);
    }
  }

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
