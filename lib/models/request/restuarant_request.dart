// To parse this JSON data, do
//
//     final restaurantRequest = restaurantRequestFromJson(jsonString);

import 'dart:convert';

RestaurantRequest restaurantRequestFromJson(String str) => RestaurantRequest.fromJson(json.decode(str));

String restaurantRequestToJson(RestaurantRequest data) => json.encode(data.toJson());

class RestaurantRequest {
  RestaurantRequest({
    required this.data,
  });

  Data data;

  factory RestaurantRequest.fromJson(Map<String, dynamic> json) => RestaurantRequest(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.picture,
  });

  String name;
  String category;
  int discount;
  double deliveryFee;
  int deliveryTime;
  String picture;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    category: json["category"],
    discount: json["discount"],
    deliveryFee: json["deliveryFee"],
    deliveryTime: json["deliveryTime"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "discount": discount,
    "deliveryFee": deliveryFee,
    "deliveryTime": deliveryTime,
    "picture": picture,
  };
}
