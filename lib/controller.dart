import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/api/cocktail.dart';
import 'package:alcohol_at_home/model.dart';

class CocktailController extends GetxController {
  //GetX의 반응형 상태 관리를 위해 사용됩니다. .obs를 붙여서 반응형으로 만듭니다.
  //현재 선택된 인덱스를 저장하는 반응형 정수입니다.
  final RxInt selectedIndex = 0.obs;

  //스크롤 동작을 제어하는 컨트롤러입니다.
  final ScrollController scrollController = ScrollController();

  //API 통신을 담당하는 클래스의 인스턴스입니다.
  final CocktailProvider cocktailProvider = CocktailProvider();

  //칵테일 레시피 리스트를 저장하는 반응형 리스트입니다.
  final RxList<CocktailRecipe> cocktailRecipes = <CocktailRecipe>[].obs;

  //데이터를 로드 중인지 나타내는 반응형 부울 값입니다.
  final RxBool isLoading = true.obs;

  //에러 메시지를 저장하는 반응형 문자열입니다.
  final RxString errorMessage = ''.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  //API에서 칵테일 레시피를 가져오고 상태를 업데이트합니다.
  void fetchCocktailRecipes() async {
    try {
      isLoading(true);
      //API에서 데이터를 비동기적으로 가져옵니다.
      final response = await cocktailProvider.getCocktailRecipes();
      if (response != null) {
        //response 리스트의 모든 요소를 cocktailRecipes에 할당합니다.
        //여기서 response는 API 호출 결과로 받아온 새로운 CocktailRecipe 객체의 리스트입니다.
        cocktailRecipes.assignAll(response);
        errorMessage('');
      } else {
        errorMessage('No recipes found');
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  //controller 생명주기 메서드

  @override
  void onInit() {
    super.onInit();
    fetchCocktailRecipes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
