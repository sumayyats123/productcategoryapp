class Product {
  final String name;
  final String price;
  final String discount;
  final String imageUrl;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'] ?? '',
      price: json['price'].toString(),
      discount: json['discountPrice'].toString(),
      imageUrl: json['image'] != null && json['image'].isNotEmpty
          ? json['image'][0]['url']
          : '',
      category: json['category'] ?? 'All',
    );
  }
}
