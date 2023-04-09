import 'package:drawer/models/response/image.dart';
import 'package:flutter/cupertino.dart';
import '../data/response/api_respone.dart';
import '../models/response/restaurant.dart';
import '../repository/restaurant_repository.dart';

class RestaurantViewModel extends ChangeNotifier {
  final _restaurantRepository = RestaurantRepository();
  ApiRespone<Restaurant> restaurants = ApiRespone.loading();
  ApiRespone<ImageModel> image =ApiRespone();


  ///  post image part
  setImageResponse(response){
    image =response;
    notifyListeners();
  }
  Future<dynamic> uploadImage(file) async {
    setImageResponse(ApiRespone.loading());
    await _restaurantRepository
        .uploadImage(file)
        .then(
            (image) => setImageResponse(ApiRespone.completed(image)))
        .onError((error, stackTrace) =>
        setImageResponse(ApiRespone.error(error.toString())));
  }


  ///  get api  restaurant  part
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
