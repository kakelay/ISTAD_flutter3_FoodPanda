import 'package:drawer/models/response/shop.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShopCard extends StatelessWidget {
  ShopCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  Shopdata? data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.grey[300],
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
