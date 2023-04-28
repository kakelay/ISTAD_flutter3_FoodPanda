// ignore_for_file: unnecessary_string_interpolations

import 'package:drawer/models/response/restaurant.dart';
import 'package:flutter/material.dart';

import '../../add_restaurant/add_restaurant.dart';

// ignore: must_be_immutable
class RestaurantCard extends StatelessWidget {
  RestaurantCard({super.key, required this.data});
  RestaurantData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddRestaurant(data: data, isUpdate: true),
          ),
        );
      },
      onDoubleTap: () {
        // Handle double tap
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddRestaurant(data: data, isUpdate: true),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 5,
          bottom: 5,
        ),
        width: MediaQuery.of(context).size.width * .92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: SizedBox(
                    height: 230,
                    child: Image.network(
                      'https://cms.istad.co${data.attributes.picture.data.attributes.url}',
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    child: Container(
                      color: Colors.pink,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '${data.attributes.discount}\$',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${data.attributes.name}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              '\$\$\$ ${data.attributes.category}',
              style: const TextStyle(color: Color.fromARGB(255, 147, 146, 146)),
            ),
            const SizedBox(height: 5),
            Text(
              '\$ ${data.attributes.deliveryFee}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
