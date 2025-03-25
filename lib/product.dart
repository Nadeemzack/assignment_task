class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final double discount;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['title'] ?? 'Unknown',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['thumbnail'] ?? '',
      discount: (json['discountPercentage'] ?? 0).toDouble(),
    );
  }
}
