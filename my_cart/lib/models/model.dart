class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  bool? favorite;


  Product.getIDContructor({required this.id});

  Product({this.id, this.name, this.description, this.price, this.favorite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['favorite'] = this.favorite;
    return data;
  }
}
