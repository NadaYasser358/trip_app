class TripRequest {
  int? governorateId;
  int? zoneId;
  int? budgetPerAdult;
  int? numberOfTravelers;
  List<String>? interests;
  int? maxRestaurants;
  int? maxAccommodations;
  int? maxEntertainments;
  int? maxTourismAreas;

  TripRequest({
    this.governorateId,
    this.zoneId,
    this.budgetPerAdult,
    this.numberOfTravelers,
    this.interests,
    this.maxRestaurants,
    this.maxAccommodations,
    this.maxEntertainments,
    this.maxTourismAreas,
  });

  TripRequest copyWith({
    int? governorateId,
    int? zoneId,
    int? budgetPerAdult,
    int? numberOfTravelers,
    List<String>? interests,
    int? maxRestaurants,
    int? maxAccommodations,
    int? maxEntertainments,
    int? maxTourismAreas,
  }) {
    return TripRequest(
      governorateId: governorateId ?? this.governorateId,
      zoneId: zoneId ?? this.zoneId,
      budgetPerAdult: budgetPerAdult ?? this.budgetPerAdult,
      numberOfTravelers: numberOfTravelers ?? this.numberOfTravelers,
      interests: interests ?? this.interests,
      maxRestaurants: maxRestaurants ?? this.maxRestaurants,
      maxAccommodations: maxAccommodations ?? this.maxAccommodations,
      maxEntertainments: maxEntertainments ?? this.maxEntertainments,
      maxTourismAreas: maxTourismAreas ?? this.maxTourismAreas,
    );
  }

  Map<String, dynamic> toJson() => {
    "governorateId": governorateId,
    "zoneId": zoneId,
    "budgetPerAdult": budgetPerAdult,
    "numberOfTravelers": numberOfTravelers,
    "interests": interests,
    "maxRestaurants": maxRestaurants,
    "maxAccommodations": maxAccommodations,
    "maxEntertainments": maxEntertainments,
    "maxTourismAreas": maxTourismAreas,
  };
}