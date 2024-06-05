import 'package:get/get.dart';
import 'package:alcohol_at_home/model.dart';

class CocktailProvider extends GetConnect implements GetxService {
  static const _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<List<CocktailRecipe>?> getCocktailRecipes() async {
    final String url = '${_baseUrl}filter.php?c=Cocktail';
    final Response response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText ?? 'Error fetching data');
    } else {
      return cocktailRecipesFromJson(response.body);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
