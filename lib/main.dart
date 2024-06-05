import 'package:alcohol_at_home/cocktail_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      title: 'thisismyapp',
      initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
        GetPage(
          name: '/cocktailList',
          page: () => CocktailList(),
        )
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
