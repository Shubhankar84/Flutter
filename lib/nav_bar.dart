import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Shubhankar'),
            accountEmail: Text('shubhankar.maj543@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://i.pinimg.com/originals/0f/2c/cf/0f2ccffa34f17064ec57234d2d6c8b52.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => print('Home printed'),
          ),

          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Your Cart"),
            onTap: () => print('shopping cart'),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favourites"),
            onTap: () => print('favorite printed'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Order History"),
            onTap: () => print('history printed'),
          ),
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: const Text("Notifications"),
            onTap: () => print('notification_add printed'),
          ),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: const Text("FAQ"),
            onTap: () => print('question_answer_outlined printed'),
          ),
        ],
      ),
    );
  }
}
