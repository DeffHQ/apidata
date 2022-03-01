class Meals {


  // Model to restruct our data for easier way to code
  String strMealThumb;
  String strMeal;
  String strInstructions;

  Meals(
      {required this.strMeal,
        required this.strMealThumb,
        required this.strInstructions});

  factory Meals.fromJson(Map map) {
    return Meals(
        strMeal: map['strMeal'] ?? 'null',
        strMealThumb: map['strMealThumb'] ?? 'null',
        strInstructions: map['strInstructions'] ?? 'null');
  }
}
