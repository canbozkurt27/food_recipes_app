class FoodListModel {
  String name;
  String image;
  double rating;
  String category;
  String? recipe;

  FoodListModel(
      {required this.name,
      required this.image,
      required this.rating,
      required this.category,
      this.recipe});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'rating': rating,
      'category': category,
      'recipe': recipe
    };
  }

  factory FoodListModel.fromMap(Map<String, dynamic> map) {
    return FoodListModel(
      name: map['name'] as String,
      image: map['image'] as String,
      rating: map['rating'] as double,
      category: map['category'] as String,
      recipe: map['recipe'] != null ? map['recipe'] as String : null,
    );
  }
}
