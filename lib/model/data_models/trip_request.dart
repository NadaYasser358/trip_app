class TripRequest {
  final int? governorateId;
  final int? zoneId;
  final int? budgetPerAdult;
  final int? numberOfTravelers;
  final List<String> interests;
  final int? maxRestaurants;
  final int? maxAccommodations;
  final int? maxEntertainments;
  final int? maxTourismAreas;

  TripRequest({
    required this.governorateId,
    required this.zoneId,
    required this.budgetPerAdult,
    required this.numberOfTravelers,
    required this.interests,
    required this.maxRestaurants,
    required this.maxAccommodations,
    required this.maxEntertainments,
    required this.maxTourismAreas,
  });

  factory TripRequest.fromJson(Map<String, dynamic> json) {
    return TripRequest(
      governorateId: json['governorateId'],
      zoneId: json['zoneId'],
      budgetPerAdult: json['budgetPerAdult'],
      numberOfTravelers: json['numberOfTravelers'],
      interests: List<String>.from(json['interests']),
      maxRestaurants: json['maxRestaurants'],
      maxAccommodations: json['maxAccommodations'],
      maxEntertainments: json['maxEntertainments'],
      maxTourismAreas: json['maxTourismAreas'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'governorateId': governorateId,
      'zoneId': zoneId,
      'budgetPerAdult': budgetPerAdult,
      'numberOfTravelers': numberOfTravelers,
      'interests': interests,
      'maxRestaurants': maxRestaurants,
      'maxAccommodations': maxAccommodations,
      'maxEntertainments': maxEntertainments,
      'maxTourismAreas': maxTourismAreas,
    };
  }
}