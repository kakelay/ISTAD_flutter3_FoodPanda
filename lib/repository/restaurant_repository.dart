import 'package:drawer/data/network/network_api_service.dart';
import 'package:drawer/models/response/restaurant.dart';
import 'package:drawer/res/app_url.dart';

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
}
