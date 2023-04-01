import 'package:flutter/cupertino.dart';
import '../data/response/api_respone.dart';
import '../models/response/restaurant.dart';
import '../repository/restaurant_repository.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepository = RestaurantRepository();
  ApiRespone<Restaurant> restaurants = ApiRespone.loading();

  setRestaurantList(response) {
    // print("response:3: ${response.body}");
    restaurants = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllRestaurants() async {
    await _restaurantRepository
        .getRestaurants()
        .then(
            (restaurant) => setRestaurantList(ApiRespone.completed(restaurant)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }
}
