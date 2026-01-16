class AddressModel {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final String? country;

  AddressModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    country: json["country"],
  );
}
