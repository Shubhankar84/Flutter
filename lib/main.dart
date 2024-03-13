import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shop2_app/pages/home_page.dart';
import 'package:shop2_app/provider/cart_provider.dart';
// import 'package:shop2_app/pages/product_details.dart';


void main() async {
  await Hive.initFlutter();

  var cart = await Hive.openBox('mycart');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
          title: 'Shopping App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1),
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins-Bold'),
              titleMedium: TextStyle(
                fontSize: 23,
                fontFamily: 'Poppins-Regular', 
                fontWeight: FontWeight.w600,
              ),
              titleSmall: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins-Regular',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
            ),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
