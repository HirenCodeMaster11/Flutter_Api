import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Beauty Product app/Screens/Cart Screen/cart screen.dart';
import 'Beauty Product app/Screens/Detail Screen/detail screen.dart';
import 'Beauty Product app/Screens/Home Screen/homeScreen.dart';
import 'Beauty Product app/Screens/Splash Screen/splash.dart';
import 'Beauty Product app/Provider/provider.dart';

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
        // ChangeNotifierProvider(create: (context) => PixabayProvider(),),
        ChangeNotifierProvider(create: (context) => BeautyProvider(),),
        // ChangeNotifierProvider(create: (context) => RecipesProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // routes: {
        //   '/' :(context) => const PixabayScreen(),
        // },
        // routes: {
        //   '/' : (context) => SplashScreen(),
        //   'home' : (context) => HomeScreen(),
        //   'detail' : (context) => DetailScreen(),
        // },
        routes: {
          '/' : (context) => SplashScreen(),
          'home' : (context) => HomeScreen(),
          'detail' : (context) => BeautyDetailScreen(),
          'cart' : (context) => BeautyCartScreen(),
        },
      ),
    );
  }
}
