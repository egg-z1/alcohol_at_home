import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/controller.dart';

class CocktailList extends StatefulWidget {
  const CocktailList({super.key});

  @override
  State<CocktailList> createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  final CocktailController _controller = Get.put(CocktailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('칵테일'),
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
        child: Obx(() {
          if (_controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (_controller.errorMessage.isNotEmpty) {
            return Center(child: Text('Error: ${_controller.errorMessage}'));
          } else {
            return GridView.builder(
              controller: _controller.scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 줄에 보여줄 항목 개수
                childAspectRatio: 0.85, // 가로 세로 비율
                crossAxisSpacing: 10.0, // 수평 간격
                mainAxisSpacing: 10.0, // 수직 간격
              ),
              itemCount: _controller.cocktailRecipes.length,
              itemBuilder: (context, index) {
                final cocktail = _controller.cocktailRecipes[index];
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.7)),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Container(
                        height: 150,
                        child: cocktail.strDrinkThumb != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  cocktail.strDrinkThumb!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                height: 150,
                                color: Colors.grey,
                                child: Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        cocktail.strDrink ?? 'Unknown',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
