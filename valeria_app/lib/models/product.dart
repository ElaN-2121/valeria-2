class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final String category;
  final String description;
  final List<String> notes;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
    required this.notes,
  });
}