import 'package:drawer/views/home/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/cuisine_card.dart';
import 'widgets/left_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // remove shawdow
        elevation: 0,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('2 St 562',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            Text('Phnom Penh',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
          ],
        ),
        //action  use for add Icons in AppBar  for leading
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      // Body
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 55,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
              title: InkWell(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    //label  Search
                    child: Row(
                      children: const [
                        SizedBox(width: 15),
                        Icon(Icons.search, color: Colors.grey, size: 34),
                        SizedBox(width: 12),
                        Text(
                          'Search for shop & restaurant',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    )),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: double.infinity,
                      height: 160,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      // splash event on tap:
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        width: double.infinity,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            onTap: () {},
                            splashFactory:
                                InkSparkle.constantTurbulenceSeedSplashFactory,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Food delivery ',
                                        style: TextStyle(
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Food delivery111',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  //
                                  child: Lottie.asset(
                                    'assets/lotties/fast-food.json',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //2
                    Row(
                      children: [
                        // expanded 1
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            width: double.infinity,
                            height: 160,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                onTap: () {},
                                splashFactory: InkSparkle
                                    .constantTurbulenceSeedSplashFactory,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Chiness Noodle',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Noodle for Dinner',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                        'assets/images/Noodle.png',
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // expanded 2
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            width: double.infinity,
                            height: 160,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                                onTap: () {},
                                splashFactory: InkSparkle
                                    .constantTurbulenceSeedSplashFactory,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Latte  Coffee',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Latte coffee for Morning ',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Image.asset(
                                        'assets/images/p15.jpg',
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Popular Restaurants',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (builder, index) {
                    return ShopCard(shopName: 'KOI 00$index');
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Cusisin',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return const CuisineCard();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Shop',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return const CuisineCard();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Card(
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Become a pro',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text('and get exclusive deals')
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        child: Image.asset('assets/images/Noodle.png'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}
