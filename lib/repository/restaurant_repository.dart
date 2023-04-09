import 'package:drawer/data/network/network_api_service.dart';
import 'package:drawer/models/response/restaurant.dart';
import 'package:drawer/res/app_url.dart';

import '../models/response/image.dart';

class RestaurantRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<Restaurant> getRestaurants() async {
    try {
      dynamic response = await _apiService.getApiRespones(AppUrl.allRestaurants);
      return response = Restaurant.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  Future<ImageModel> uploadImage(file) async {
    try{
      dynamic response = await _apiService.uploadImage(AppUrl.uploadImage, file);
      // return response =ImageModel.fromJson(response);
      return response;
    }catch(e){
      rethrow;
    }
  }


}
