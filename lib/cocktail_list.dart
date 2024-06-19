// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/controller.dart';

class CocktailList extends StatefulWidget {
  const CocktailList({super.key});

  @override
  State<CocktailList> createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  //GetX의 종속성 주입 기능을 사용하여 CocktailController 인스턴스를 생성하고 의존성을 주입합니다.
  //이렇게 하면 컨트롤러를 전역적으로 사용할 수 있습니다.
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
        //GetX의 반응형 상태 관리 기능을 사용하여 상태 변화에 따라 UI를 자동으로 업데이트합니다.
        //_controller.isLoading, _controller.errorMessage, _controller.cocktailRecipes의 상태를 관찰하여 UI를 업데이트합니다.
        child: Obx(() {
          if (_controller.isLoading.value) {
            //데이터를 로드 중일 때 로딩 스피너를 표시합니다.
            return Center(child: CircularProgressIndicator());
          } else if (_controller.errorMessage.isNotEmpty) {
            //에러 메시지가 있을 때 에러 메시지를 표시합니다.
            return Center(child: Text('Error: ${_controller.errorMessage}'));
          } else {
            //로드된 칵테일 레시피 리스트를 그리드 뷰로 표시합니다.
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
