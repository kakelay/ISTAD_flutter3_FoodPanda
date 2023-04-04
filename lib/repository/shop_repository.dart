import 'package:drawer/data/network/network_api_service.dart';
import 'package:drawer/models/response/shop.dart';
import 'package:drawer/res/app_url.dart';

class ShopRepository {
  final NetworkApiService _apiService = NetworkApiService();

  Future<Shop> getShops() async {
    try {
      dynamic response = await _apiService.getApiRespones(AppUrl.allShop);
      return response = Shop.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
