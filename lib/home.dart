import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/cocktail_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 159, 124, 0),
            Colors.amber,
            Colors.white
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "칵테일 너무 비싼데...",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            Text(
              "차라리 집에서 만들어 볼까?",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "물가에 지친 당신만을 위한 홈 바",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () => Get.to(() => CocktailList()),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 30,
                        blurRadius: 100,
                        offset: Offset(0, 5),
                      )
                    ]),
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.local_bar,
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "ALCOHOL AT HOME",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset(
              'assets/images/cocktails.png',
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
