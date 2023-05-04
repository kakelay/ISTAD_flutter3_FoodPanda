import 'package:drawer/data/network/network_api_service.dart';
import 'package:drawer/models/request/restuarant_request.dart';
import 'package:drawer/models/response/restaurant.dart';
import 'package:drawer/res/app_url.dart';

import '../models/response/image.dart';

class RestaurantRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<Restaurant> getRestaurants() async {
    try {
      dynamic response =
          await _apiService.getApiRespones(AppUrl.allRestaurants);
      return response = Restaurant.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // repository upload image
  Future<ImageModel> uploadImage(file) async {
    try {
      dynamic response =
          await _apiService.uploadImage(AppUrl.uploadImage, file);
      // return response =ImageModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // repository postRestaurant
  Future<dynamic> postRestaurant(requestBody) async {
    try {
      var restaurantBody = RestaurantRequest(data: requestBody);
      dynamic response = await _apiService.postApi(
          AppUrl.postRestaurant, restaurantBody.toJson());
      // return response =ImageModel.fromJson(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // repository putRestaurant
  Future<dynamic> putRestaurant(requestBody, id) async {
    try {
      var restaurantBody = RestaurantRequest(data: requestBody);
      var url = '${AppUrl.postRestaurant}/$id';
      dynamic response =
          await _apiService.puttApi(url, restaurantBody.toJson());
      return response;
    } catch (e) {
      rethrow;
    }
  }
 



   Future<dynamic> deleteRestaurant( id) async {
    try {
       
      var url = '${AppUrl.postRestaurant}/$id';
      dynamic response = await _apiService.deleteApi(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

   
}
