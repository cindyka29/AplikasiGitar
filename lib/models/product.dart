class Product {
  int? id;
  String name;
  String code;
  String category;
  String description;
  String images;

  Product(
      {this.id,
      required this.name,
      required this.code,
      required this.category,
      required this.images,
      required this.description});

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        code = res["code"],
        category = res["category"],
        images = res["images"],
        description = res["description"];

  get price => 700;

  get searchKeywords => null;

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'category': category,
      'images': images,
      'description': description
    };
  }
}
