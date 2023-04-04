import 'package:drawer/data/response/status.dart';

import 'package:drawer/viewmodels/cuisine_viewmodel.dart';
import 'package:drawer/viewmodels/restaurant_viewmodel.dart';
import 'package:drawer/viewmodels/shop_viewmodel.dart';
import 'package:drawer/views/home/widgets/shop_card.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'widgets/cuisine_card.dart';
import 'widgets/left_drawer.dart';
import 'widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // call  api restaurant
  var restaurantViewModel = RestaurantViewModel();
  // call  api cuisine
  var cuisineViewModel = CuisineViewModel();

  //  call api Shop card
  var shopViewModel = ShopViewModel();

  @override
  void initState() {
    restaurantViewModel.fetchAllRestaurants();
    cuisineViewModel.fetchAllCuisines();
    shopViewModel.fetchAllShop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 232, 232),
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
              // ignore: avoid_unnecessary_containers
              child: Container(
                // color: Colors.grey[100],
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
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        // margin: const EdgeInsets.all(15),
                        width: double.infinity,
                        height: 100,
                        // decoration: const BoxDecoration(
                        //   color: Color.fromARGB(255, 183, 106, 106),
                        //   borderRadius: BorderRadius.all(Radius.circular(15)),
                        // ),
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
                                            'Amok Khmer',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'This food is popular in Cambodia',
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
                                        'assets/images/amok.jpg',
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
              child: ChangeNotifierProvider<RestaurantViewModel>(
                create: (context) => restaurantViewModel,
                child: Consumer<RestaurantViewModel>(
                  builder: ((context, value, child) {
                    switch (value.restaurants.status) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.COMPLETE:
                        return SizedBox(
                          height: 320,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.restaurants.data!.data.length,
                            itemBuilder: (builder, index) {
                              return RestaurantCard(
                                  data: value.restaurants.data!.data[index]);
                            },
                          ),
                        );
                      default:
                        return const CircularProgressIndicator();
                    }
                  }),
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
              child: ChangeNotifierProvider<CuisineViewModel>(
                create: (context) => cuisineViewModel,
                child: Consumer<CuisineViewModel>(
                  builder: (context, value, child) {
                    switch (value.cuisines.status) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.COMPLETE:
                        return SizedBox(
                          height: 200,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.cuisines.data!.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return CuisineCard(
                                data: value.cuisines.data!.data[index],
                              );
                            },
                          ),
                        );
                      default:
                        return const CircularProgressIndicator();
                    }
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
              child: ChangeNotifierProvider<ShopViewModel>(
                create: (context) => shopViewModel,
                child: Consumer<ShopViewModel>(
                  builder: (context, value, child) {
                    switch (value.shops.status) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.COMPLETE:
                        return SizedBox(
                          height: 100,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.shops.data!.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              return ShopCard(
                                  data: value.shops.data!.data[index]);
                            },
                          ),
                        );
                      default:
                        return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(15),
                // padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    //  color: Colors.grey,
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/kh.png'),
              ),
            ),
          ],
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}
