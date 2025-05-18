class Dish {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final int price;

  Dish({required this.id, required this.name, required this.description, required this.imagePath, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imagePath': imagePath,
      'price': price,
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imagePath: map['imagePath'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'Dish{id: $id, name: $name, description: $description, imagePath: $imagePath, price: $price}';
  }
}




