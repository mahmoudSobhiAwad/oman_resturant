class AddressModel {
  final String? placeName;
  final num? lat;
  final num? long;

  AddressModel({
    required this.placeName,
    required this.lat,
    required this.long,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": placeName,
      "coordinates": [long, lat],
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      placeName: json['type'],
      lat: (json['coordinates'] != null && json['coordinates'].isNotEmpty)
          ? json['coordinates'][1] ?? 0.0
          : 0.0,
      long: (json['coordinates'] != null && json['coordinates'].isNotEmpty)
          ? json['coordinates'][0] ?? 0.0
          : 0.0,
    );
  }
}
