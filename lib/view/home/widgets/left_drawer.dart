import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              // currentAccountPictureSize: const Size.fromRadius(38),
              currentAccountPicture: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(150)),
                child: Image.asset(
                  'assets/images/KakElay.png',
                  fit: BoxFit.cover,
                ),
              ),
              accountName: const Text(" "),
              accountEmail: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Kak Elay"),
                      Text("Personal Account"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      // ignore: sort_child_properties_last
                      child: const Text('Switch'),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(const BorderSide(
                          width: 2,
                          color: Colors.white,
                        )),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    // OutlinedButton(
                    //   onPressed: () {},
                    //   // ignore: sort_child_properties_last
                    //   child: const Text('Switch'),
                    //   style: OutlinedButton.styleFrom(
                    //     foregroundColor: Colors.white,
                    //     shape: const RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         color: Colors.white,
                    //         style: BorderStyle.solid,
                    //         width: 2,
                    //       ),
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(15),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),

              // Step profile information
              otherAccountsPictures: const [
                Icon(Icons.account_box, color: Colors.white),
                Icon(Icons.aspect_ratio, color: Colors.white),
              ],
            ),
            const Divider(
              height: 8,
              color: Colors.white,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_box_rounded),
              title: const Text('Profile'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.saved_search),
              title: const Text('Saved '),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.production_quantity_limits_outlined),
              title: const Text('Marketplace'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help_center_outlined),
              title: const Text('Help Center'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_box_rounded),
              title: const Text('Profile'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.saved_search),
              title: const Text('Saved '),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.production_quantity_limits_outlined),
              title: const Text('Marketplace'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help),
              title: const Text('Help'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.help_center_outlined),
              title: const Text('Help Center'),
              iconColor: Colors.pink,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('About Us'),
              iconColor: Colors.pink,
            ),
            const Divider(
              height: 5,
              color: Colors.grey,
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Setting',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Term & Condition',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
