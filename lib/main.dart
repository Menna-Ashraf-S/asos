import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/details.dart';
import 'package:flutter_app/pages/favourite.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/navigation.dart';
import 'package:flutter_app/pages/manCate.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/product.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/splash.dart';
import 'package:flutter_app/pages/womanCate.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/log': (context) => LogIn(),
        '/sign': (context) => SignUP(),
        '/home': (context) => Home(),
        '/mancate': (context) => ManCate(),
        '/womancate': (context) => WomanCate(),
        '/navigation': (context) => Navigation(),
        '/product': (context) => Product(),
        '/details': (context) => Details(),
      },
    );
  }
}
