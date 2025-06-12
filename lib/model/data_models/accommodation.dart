class Accommodation {
  final int id;
  final String name;
  final String? accomodationType;
  final String classType;
  final String zone;
  final int zoneId;
  final String governorate;
  final int governorateId;
  final int rating;
  final String placeType;
  final int averagePricePerAdult;
  final bool hasKidsArea;
  final String description;
  final String address;
  final String? mapLink;
  final String? contactLink;
  final String? imageUrl;
  final int numOfBeds;
  final String bedStatus;
  final int numOfPersons;
  final double score;

  Accommodation({
    required this.id,
    required this.name,
    this.accomodationType,
    required this.classType,
    required this.zone,
    required this.zoneId,
    required this.governorate,
    required this.governorateId,
    required this.rating,
    required this.placeType,
    required this.averagePricePerAdult,
    required this.hasKidsArea,
    required this.description,
    required this.address,
    this.mapLink,
    this.contactLink,
    this.imageUrl,
    required this.numOfBeds,
    required this.bedStatus,
    required this.numOfPersons,
    required this.score,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      accomodationType: json['accomodationType'],
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate'] ?? '',
      governorateId: json['governorateId'] ?? 0,
      rating: json['rating'] ?? 0,
      placeType: json['placeType'] ?? '',
      averagePricePerAdult: json['averagePricePerAdult'] ?? 0,
      hasKidsArea: json['hasKidsArea'] ?? false,
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      mapLink: json['mapLink'],
      contactLink: json['contactLink'],
      imageUrl: json['imageUrl'],
      numOfBeds: json['numOfBeds'] ?? 0,
      bedStatus: json['bedStatus'] ?? '',
      numOfPersons: json['numOfPersons'] ?? 0,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
