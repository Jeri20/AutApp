class Product {
  final String name;

  Product({required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
    );
  }
}
