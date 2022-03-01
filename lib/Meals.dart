class Meals {
  // Model to restruct our data for easier way to code
  String strInstructions;
  String strMeal;
  String strMealThumb;

  Meals(
      {required this.strMeal,
      required this.strInstructions,
      required this.strMealThumb});

  factory Meals.fromJson(Map map) {
    return Meals(
        strMeal: map['strMeal'] ?? 'null',
        strInstructions: map['strInstructions'] ?? 'null',
        strMealThumb: map['strMealThumb'] ?? 'null');
  }
}
