class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price; // New field for price

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price, // Updated constructor to include price
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      imageUrl: (json['photos'] != null && json['photos'].isNotEmpty)
          ? 'https://api.timbu.cloud/images/${json['photos'][0]['url']}'
          : '',
      price: json['price'] ?? 0.0, // Example assuming price is a double in JSON
    );
  }
}