import 'package:drawer/data/response/status.dart';
import 'package:drawer/models/response/image.dart';
import 'package:flutter/cupertino.dart';
import '../data/response/api_respone.dart';
import '../repository/restaurant_repository.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepository = RestaurantRepository();
  dynamic restaurants = ApiRespone.loading();
  ApiRespone<ImageModel> image = ApiRespone();

  ///  delete
  Future<dynamic> deleteRestaurant(id) async {
    setRestaurantList(ApiRespone.loading());
    await _restaurantRepository
        .deleteRestaurant(id)
        .then((value) => setRestaurantList(ApiRespone.completed(value)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }

  ///  post image part
  setImageResponse(response) {
    if (response.data == null) {
      image.status = Status.LOADING;
    } else {
      image = response;
    }
    notifyListeners();
  }

  Future<dynamic> uploadImage(file) async {
    setImageResponse(ApiRespone.loading());
    await _restaurantRepository
        .uploadImage(file)
        .then((image) => setImageResponse(ApiRespone.completed(image)))
        .onError((error, stackTrace) =>
            setImageResponse(ApiRespone.error(error.toString())));
  }

  /// put restaurant
  Future<dynamic> putRestaurant(requestBody, id) async {
    setRestaurantList(ApiRespone.loading());
    await _restaurantRepository
        .putRestaurant(requestBody, id)
        .then((value) => setRestaurantList(ApiRespone.completed(value)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }

  /// post restaurant
  Future<dynamic> postRestaurant(requestBody) async {
    setRestaurantList(ApiRespone.loading());
    await _restaurantRepository
        .postRestaurant(requestBody)
        .then((value) => setRestaurantList(ApiRespone.completed(value)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }

  ///  get api  restaurant  part
  setRestaurantList(response) {
    // print("response:3: ${response.body}");
    restaurants = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllRestaurants() async {
    setRestaurantList(ApiRespone.loading());
    await _restaurantRepository
        .getRestaurants()
        .then(
            (restaurant) => setRestaurantList(ApiRespone.completed(restaurant)))
        .onError((error, stackTrace) =>
            setRestaurantList(ApiRespone.error(error.toString())));
  }
}
