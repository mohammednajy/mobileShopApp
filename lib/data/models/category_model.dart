// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String name;
  final String image;
  final int id;
  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      name: map["name"],
      image: map["image"],
      id: map["id"],
    );
  }
}
