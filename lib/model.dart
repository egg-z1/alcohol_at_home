List<CocktailRecipe> cocktailRecipesFromJson(dynamic str) =>
    List<CocktailRecipe>.from(
        (str['drinks']).map((x) => CocktailRecipe.fromJson(x)));

class CocktailRecipe {
  String? idDrink;
  String? strDrink;
  String? strDrinkThumb;

  CocktailRecipe({this.idDrink, this.strDrink, this.strDrinkThumb});

  CocktailRecipe.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
  }

  Map<String, dynamic> toJson() => {
        'idDrink': idDrink,
        'strDrink': strDrink,
        'strDrinkThumb': strDrinkThumb,
      };
}
