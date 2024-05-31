import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("칵테일 레시피"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("다양한 칵테일을 만들어 봐요 ^^"),
            GestureDetector(
              onTap: () => Get.to(List()),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.amber),
                padding: EdgeInsets.all(5),
                child: Text('let\'s make!'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
