import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alcohol_at_home/api/cocktail.dart';
import 'package:alcohol_at_home/model.dart';

class CocktailController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final ScrollController scrollController = ScrollController();
  final CocktailProvider cocktailProvider = CocktailProvider();
  final RxList<CocktailRecipe> cocktailRecipes = <CocktailRecipe>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  void fetchCocktailRecipes() async {
    try {
      isLoading(true);
      final response = await cocktailProvider.getCocktailRecipes();
      if (response != null) {
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
