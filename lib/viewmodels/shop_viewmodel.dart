import 'package:drawer/models/response/shop.dart';
import 'package:flutter/cupertino.dart';
import '../data/response/api_respone.dart';
import '../repository/shop_repository.dart';

class ShopViewModel extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final _ShopRepository = ShopRepository();
  ApiRespone<Shop> shops = ApiRespone.loading();

  setShopList(response) {
    // print("response:3: ${response.body}");
    shops = response;
    notifyListeners();
  }

  Future<dynamic> fetchAllShop() async {
    await _ShopRepository.getShops()
        .then((shop) => setShopList(ApiRespone.completed(shop)))
        .onError((error, stackTrace) =>
            setShopList(ApiRespone.error(error.toString())));
  }
}
