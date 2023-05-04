// ignore_for_file: unnecessary_string_interpolations

import 'package:drawer/data/response/status.dart';
import 'package:drawer/models/response/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/restaurant_viewmodel.dart';
import '../../add_restaurant/add_restaurant.dart';

// ignore: must_be_immutable
class RestaurantCard extends StatelessWidget {
  RestaurantCard({super.key, required this.data});

  RestaurantData data;
  var restaurantViewModel = RestaurantViewModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are you sure to remove?"),
            content: const Text('After you remove ,it can not revert back'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  restaurantViewModel.deleteRestaurant(data.id);
                },
                child: ChangeNotifierProvider(
                  create: (context) => restaurantViewModel,
                  child: Consumer<RestaurantViewModel>(
                      builder: (context, viewModel, _) {
                    if (viewModel.restaurants.status == Status.COMPLETE) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Item Removed!!"))
                        );
                      });
                      Navigator.pop(context);
                    }
                    return viewModel.restaurants.status == Status.LOADING
                        ? const CircularProgressIndicator()
                        : const Text('Ok');
                  }),
                ),
              ),
            ],
          ),
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddRestaurant(data: data, isUpdate: true),
          ),
        );
      },
      // onDoubleTap: () {
      //   // Handle double tap
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => AddRestaurant(data: data, isUpdate: true),
      //     ),
      //   );
      // },
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
