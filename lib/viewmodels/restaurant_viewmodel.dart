import 'package:drawer/data/response/api_respone.dart';
import 'package:drawer/models/response/restaurant.dart';
import 'package:drawer/repository/restaurant_repository.dart';
import 'package:flutter/cupertino.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepository = RestaurantRepository();
  ApiRespone<Restaurant> restaurants = ApiRespone.loading();

  setRestaurantList(response) {
    restaurants = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllRestaurants() async {
    await _restaurantRepository
        .getRestaurants()
        .then((restaurant) =>
            setRestaurantList(ApiRespone.completed(restaurant)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }
}
