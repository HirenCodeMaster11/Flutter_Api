import 'package:api/Screens/Pixabay/View/Detail%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Beauty Product app/Screens/Cart Screen/cart screen.dart';
import 'Beauty Product app/Screens/Detail Screen/detail screen.dart';
import 'Beauty Product app/Screens/Home Screen/homeScreen.dart';
import 'Beauty Product app/Screens/Splash Screen/splash.dart';
import 'Beauty Product app/Provider/provider.dart';
import 'Screens/Pixabay/Provider/Provider.dart';
import 'Screens/Pixabay/View/pixabay.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        // ChangeNotifierProvider(create: (context) => BeautyProvider(),),
        // ChangeNotifierProvider(create: (context) => RecipesProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' :(context) => const SearchPage(),
        },
        // routes: {
        //   '/' : (context) => SplashScreen(),
        //   'home' : (context) => HomeScreen(),
        //   'detail' : (context) => DetailScreen(),
        // },
        // routes: {
        //   '/' : (context) => SplashScreen(),
        //   'home' : (context) => HomeScreen(),
        //   'detail' : (context) => BeautyDetailScreen(),
        //   'cart' : (context) => BeautyCartScreen(),
        // },
      ),
    );
  }
}
