

import 'package:json_annotation/json_annotation.dart';
import 'package:lesson_44/dars/models/address.dart';



part 'user.g.dart';


@JsonSerializable()
class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String image;
  Address address;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> mapData) {
    return User(
      id: mapData["id"],
      email: mapData["email"],
      firstName: mapData["firstName"],
      lastName: mapData["lastName"],
      image: mapData["image"],
      address:
          Address.fromJson(mapData)
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "firstname": firstName,
      "lastName": lastName,
      "image": image,
      "adress": {
        "city": address.city,
        "street": address.toJson(),
      }
    };
  }
}
