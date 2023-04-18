import 'dart:convert';

List<Services?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Services?>.from(json.decode(str)!.map((x) => Services.fromJson(x)));

String productToJson(List<Services?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Services {
  Services({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.serviceCenter,
    this.image,
    this.quantity = 1,
  });

  String? id;
  String? name;
  String? description;
  String? price;
  String? category;
  String? serviceCenter;
  String? image;
  int? quantity;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        category: json["category"],
        serviceCenter: json["serviceCenter"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category": category,
        "serviceCenter": serviceCenter,
        "image": image,
      };
}
