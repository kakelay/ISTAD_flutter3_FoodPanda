import 'package:flutter/cupertino.dart';
import '../data/response/api_respone.dart';
import '../models/response/cuisine.dart';
import '../repository/cuisine_repository.dart';
 

class CuisineViewModel extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final _CuisineRepository = CuisineRepository();
  ApiRespone<Cuisine> cuisines = ApiRespone.loading();

  setCuisineList(response) {
    // print("response:3: ${response.body}");
    cuisines = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllCuisines() async {
    await _CuisineRepository
        .getCuisines()
        .then(
            (cuisine) => setCuisineList(ApiRespone.completed(cuisine)))
        .onError((error, stackTrace) =>
            setCuisineList(ApiRespone.error(error.toString())));
  }
}
