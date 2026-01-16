class LocationModel {
  final String name;
  final String displayName;
  final Address address;

  LocationModel({
    required this.name,
    required this.displayName,
    required this.address,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    name: json["name"],
    displayName: json["display_name"],
    address: Address.fromJson(json["address"]),
  );
}

class Address {
  final String city;
  final String county;
  final String country;

  Address({required this.city, required this.county, required this.country});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    city: json["city"],
    county: json["county"],
    country: json["country"],
  );
}
