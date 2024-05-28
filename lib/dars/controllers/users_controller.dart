import 'dart:convert';

import 'package:lesson_44/dars/models/user.dart';

class UsersController {
  late User user;
  String json = '''{
      "id": 1,
      "email": "samaultjdd@gmail.com",
      "firstName" : "Sam",
      "lastName" : "Aultun",
      "image" : "https://reqres.in/img/faces/1-image.jpg",
      "age": 30,
      "address" : {
        "city" : "Tashkent",
        "street" : "Amir Temur"
      }
    }
''';

  void getUser() {
    final mapData = jsonDecode(json);
    user = User.fromJson(mapData);
  }

  void sendNewUser() {
    Map<String, dynamic> mapData = user.toJson();
    String jsonFormat = jsonEncode(mapData);
  }
}
