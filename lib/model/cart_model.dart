class CartModel {
  int? id;
  final String name;
  final String description;
  final String price;
  final String image;

  CartModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      this.id});

  static CartModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final description = map['description'] as String;
    final price = map['price'] as String;
    final image = map['image'] as String;

    return CartModel(
        id: id,
        name: name,
        description: description,
        price: price,
        image: image);
  }
}
