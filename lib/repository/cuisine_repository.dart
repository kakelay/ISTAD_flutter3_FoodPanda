import 'package:drawer/data/network/network_api_service.dart';
import 'package:drawer/res/app_url.dart';

import '../models/response/cuisine.dart';

class CuisineRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<Cuisine> getCuisines() async {
    try {
      dynamic response =
          await _apiService.getApiRespones(AppUrl.allCuisine);
      return response = Cuisine.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
