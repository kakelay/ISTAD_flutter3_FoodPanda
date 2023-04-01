// To parse this JSON data, do
//
//     final cuisine = cuisineFromJson(jsonString);

import 'dart:convert';

Cuisine cuisineFromJson(String str) => Cuisine.fromJson(json.decode(str));

String cuisineToJson(Cuisine data) => json.encode(data.toJson());

class Cuisine {
    Cuisine({
        required this.data,
    });

    List<Cuisinedata> data;

    factory Cuisine.fromJson(Map<String, dynamic> json) => Cuisine(
        data: List<Cuisinedata>.from(json["data"].map((x) => Cuisinedata.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Cuisinedata {
    Cuisinedata({
        required this.id,
        required this.attributes,
    });

    int id;
    DatumAttributes attributes;

    factory Cuisinedata.fromJson(Map<String, dynamic> json) => Cuisinedata(
        id: json["id"],
        attributes: DatumAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DatumAttributes {
    DatumAttributes({
        required this.title,
        required this.createdAt,
        required this.updatedAt,
        required this.publishedAt,
        required this.thumbnail,
    });

    String title;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime publishedAt;
    Thumbnail thumbnail;

    factory DatumAttributes.fromJson(Map<String, dynamic> json) => DatumAttributes(
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnail": thumbnail.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
        required this.data,
    });

    Data data;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
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
    DataAttributes attributes;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: DataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class DataAttributes {
    DataAttributes({
        required this.url,
    });

    String url;

    factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}
