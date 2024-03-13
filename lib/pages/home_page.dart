import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shop2_app/pages/cart_page.dart';
// import 'package:shop2_app/pages/product_detail s.dart';
import 'package:shop2_app/pages/product_list_home.dart';
import 'package:shop2_app/pages/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currenctPage = 0;

  List<Widget> pages = const [ProductHomePage(), CartPage(), WishListPage(),];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currenctPage,
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey, // You can change the shadow color
                spreadRadius: 1, // You can adjust the spread radius
                blurRadius: 5, // You can adjust the blur radius
                offset: Offset(0, 1), // You can adjust the offset
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.all(8),
              onTabChange: (value) {
                setState(() {
                  currenctPage = value;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_cart_outlined,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Notification',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ));
  }
}
