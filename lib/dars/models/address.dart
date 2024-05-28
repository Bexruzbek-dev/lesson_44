class Address {
  String city;
  String street;
  Address(this.city, this.street);

  factory Address.fromJson(Map<String, dynamic> mapData) {
    return Address(mapData["city"], mapData["street"]);
  }
  Map<String, dynamic> toJson() {
    return {"city": city, "street": street};
  }
}
