class ProductModel {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool? inFavorites;
  final bool? inCart;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: double.parse(json['price'].toString()),
      oldPrice: double.parse(json['old_price'].toString()),
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: json['images'] == null
          ? []
          : List.castFrom<dynamic, String>(json['images']),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
