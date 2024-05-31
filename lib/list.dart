import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/controller.dart';

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('칵테일'),
          ),
          body: Container(
            child: ListView.builder(
              controller: CocktailController(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
