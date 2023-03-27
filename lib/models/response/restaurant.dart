// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    required this.data,
  });
/// change Datum to  RestaurantData
  List<RestaurantData> data;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        data: List<RestaurantData>.from(json["data"].map((x) => RestaurantData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RestaurantData {
  RestaurantData({
    required this.id,
    required this.attributes,
  });

  int id;
  RestaurantAttributes attributes;

  factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        id: json["id"],
        attributes: RestaurantAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class RestaurantAttributes {
  RestaurantAttributes({
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.picture,
  });

  String name;
  String category;
  int discount;
  double deliveryFee;
  int deliveryTime;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  Picture picture;

  factory RestaurantAttributes.fromJson(Map<String, dynamic> json) =>
      RestaurantAttributes(
        name: json["name"],
        category: json["category"],
        discount: json["discount"],
        deliveryFee: json["deliveryFee"]?.toDouble(),
        deliveryTime: json["deliveryTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "discount": discount,
        "deliveryFee": deliveryFee,
        "deliveryTime": deliveryTime,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "picture": picture.toJson(),
      };
}

class Picture {
  Picture({
    required this.data,
  });

  Data data;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  int id;
  PictureDataAttributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: PictureDataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class PictureDataAttributes {
  PictureDataAttributes({
    required this.url,
  });

  String url;

  factory PictureDataAttributes.fromJson(Map<String, dynamic> json) => PictureDataAttributes(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
