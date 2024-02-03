class ProductModel {
  final int id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String imageUrl;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'].toString(),
        category: json['category'],
        imageUrl: json['image']);
  }
}
