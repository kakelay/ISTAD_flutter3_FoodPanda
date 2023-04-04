import 'package:drawer/models/response/cuisine.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CuisineCard extends StatelessWidget {
  CuisineCard({
    Key? key,
    this.data,
  }) : super(key: key);
  Cuisinedata? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          child: Image.network(
            'https://cms.istad.co${data!.attributes.thumbnail.data.attributes.url}',
          ),
        ),
        Text(
          // ignore: unnecessary_string_interpolations
          '${data!.attributes.title}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
