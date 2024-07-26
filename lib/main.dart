import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => PixabayProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' :(context) => const PixabayScreen(),
        },
      ),
    );
  }
}
