import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  const CuisineCard({
    Key? key,
  }) : super(key: key);

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
          child: Image.asset('assets/images/Noodle.png'),
        ),
        const Text(
          'Noodel',
          style: TextStyle( fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
