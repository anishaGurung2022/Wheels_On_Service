// To parse this JSON data, do
//
//     final serviceCenterServices = serviceCenterServicesFromJson(jsonString);

import 'dart:convert';

ServiceCenterServices serviceCenterServicesFromJson(String str) =>
    ServiceCenterServices.fromJson(json.decode(str));

String serviceCenterServicesToJson(ServiceCenterServices data) =>
    json.encode(data.toJson());

class ServiceCenterServices {
  ServiceCenterServices({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.serviceCenterId,
    required this.image,
  });

  String id;
  String name;
  String description;
  String price;
  String categoryId;
  String serviceCenterId;
  String image;

  factory ServiceCenterServices.fromJson(Map<String, dynamic> json) =>
      ServiceCenterServices(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        categoryId: json["category_id"],
        serviceCenterId: json["serviceCenter_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "category_id": categoryId,
        "serviceCenter_id": serviceCenterId,
        "image": image,
      };
}
