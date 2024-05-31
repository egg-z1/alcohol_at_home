import 'package:get/get.dart';
import 'package:alcohol_at_home/api/cocktail.dart';
import 'package:alcohol_at_home/model.dart';

class CocktailController extends GetxController
    with StateMixin<List<CocktailRecipe>> {
  final RxInt selectedIndex = 0.obs;
  CocktailProvider cocktailProvider = CocktailProvider();

  void changeIndex(int index) {
    selectedIndex(index);
  }

  void fetchCocktailRecipes() {
    cocktailProvider.getCocktailRecipes().then(
      (response) {
        change(response, status: RxStatus.success());
        print(response);
      },
      onError: (e) {
        change(null, status: RxStatus.error(e.toString()));
      },
    );
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
    super.onClose();
  }
}
