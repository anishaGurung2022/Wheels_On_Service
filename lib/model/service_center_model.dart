class ServiceCenter {
  ServiceCenter({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.userName,
    this.image,
    required this.cities,
  });

  String id;
  String name;
  String phone;
  String address;
  String email;
  String userName;
  String? image;
  String cities;

  factory ServiceCenter.fromJson(Map<String, dynamic> json) => ServiceCenter(
        id: json["id"].toString(),
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        email: json["email"],
        userName: json["userName"],
        image: json["image"] ?? "assets\\images\\logo.jpg",
        cities: json["cities"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "email": email,
        "userName": userName,
        "image": image,
        "cities": cities,
      };
}
