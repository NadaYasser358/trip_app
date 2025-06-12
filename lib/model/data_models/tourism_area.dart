class TourismArea {
  final int id;
  final String name;
  final String? description;
  final String classType;
  final String zone;
  final int zoneId;
  final String? governorate;
  final int governorateId;
  final int rating;
  final int averagePricePerAdult;
  final String tourismType;
  final bool hasKidsArea;
  final String address;
  final String? mapLink;
  final String? contactLink;
  final String? imageUrl;
  final String placeType;
  final double score;

  TourismArea({
    required this.id,
    required this.name,
    this.description,
    required this.classType,
    required this.zone,
    required this.zoneId,
    this.governorate,
    required this.governorateId,
    required this.rating,
    required this.averagePricePerAdult,
    required this.tourismType,
    required this.hasKidsArea,
    required this.address,
    this.mapLink,
    this.contactLink,
    this.imageUrl,
    required this.placeType,
    required this.score,
  });

  factory TourismArea.fromJson(Map<String, dynamic> json) {
    return TourismArea(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'],
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate'],
      governorateId: json['governorateId'] ?? 0,
      rating: json['rating'] ?? 0,
      averagePricePerAdult: json['averagePricePerAdult'] ?? 0,
      tourismType: json['tourismType'] ?? '',
      hasKidsArea: json['hasKidsArea'] ?? false,
      address: json['address'] ?? '',
      mapLink: json['mapLink'],
      contactLink: json['contactLink'],
      imageUrl: json['imageUrl'],
      placeType: json['placeType'] ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
