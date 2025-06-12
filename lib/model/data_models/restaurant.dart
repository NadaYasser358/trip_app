class Restaurant {
  final int id;
  final String name;
  final String foodCategory;
  final String classType;
  final String zone;
  final int zoneId;
  final String governorate;
  final int governorateId;
  final int rating;
  final String placeType;
  final int averagePricePerAdult;
  final bool hasKidsArea;
  final String? description;
  final String address;
  final String? mapLink;
  final String? contactLink;
  final String? imageUrl;
  final double score;

  Restaurant({
    required this.id,
    required this.name,
    required this.foodCategory,
    required this.classType,
    required this.zone,
    required this.zoneId,
    required this.governorate,
    required this.governorateId,
    required this.rating,
    required this.placeType,
    required this.averagePricePerAdult,
    required this.hasKidsArea,
    this.description,
    required this.address,
    this.mapLink,
    this.contactLink,
    this.imageUrl,
    required this.score,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      foodCategory: json['foodCategory'] ?? '',
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate'] ?? '',
      governorateId: json['governorateId'] ?? 0,
      rating: json['rating'] ?? 0,
      placeType: json['placeType'] ?? '',
      averagePricePerAdult: json['averagePricePerAdult'] ?? 0,
      hasKidsArea: json['hasKidsArea'] ?? false,
      description: json['description'],
      address: json['address'] ?? '',
      mapLink: json['mapLink'],
      contactLink: json['contactLink'],
      imageUrl: json['imageUrl'],
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
