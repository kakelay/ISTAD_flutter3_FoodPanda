import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShopCard extends StatelessWidget {
  ShopCard({Key? key, this.shopName}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  var shopName ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10,right: 5,bottom: 5),
      width: MediaQuery.of(context).size.width * .92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  'https://d1sag4ddilekf6.azureedge.net/compressed/merchants/1-CYMCLKCFWE6HAJ/hero/f3b6e2b554f6415996d1b5cc4a6f459a_1642688999866042178.jpg',
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
                    child: const Text(
                      '13%OFF MIN 2\$(CODE:13)',
                      style: TextStyle(
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
            '$shopName',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$\$\$ . Beverages, Milk Tea',
            style: TextStyle(color: Color.fromARGB(255, 147, 146, 146)),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$ 0.74 delivery fee',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
