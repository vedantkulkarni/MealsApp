class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Affordability affordability;
  final Complexity complexity;

  const Meal(
      {required this.id,
      required this.title,
      required this.categories,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.affordability,
      required this.complexity});
}

enum Affordability { Affordable, Pricey, Luxurious }

enum Complexity { Simple, Hard, Challenging }
