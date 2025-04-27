class TripGenerated {
  final int statusCode;
  final Meta meta;
  final bool succeeded;
  final String message;
  final dynamic errors;
  final dynamic errorsBag;
  final TripData data;

  TripGenerated({
    required this.statusCode,
    required this.meta,
    required this.succeeded,
    required this.message,
    this.errors,
    this.errorsBag,
    required this.data,
  });

  factory TripGenerated.fromJson(Map<String, dynamic> json) {
    return TripGenerated(
      statusCode: json['statusCode'],
      meta: Meta.fromJson(json['meta']),
      succeeded: json['succeeded'],
      message: json['message'],
      errors: json['errors'],
      errorsBag: json['errorsBag'],
      data: json['data'] != null
          ? TripData.fromJson(json['data'])
          : TripData.empty(), // Add an empty fallback or make it nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'meta': meta.toJson(),
      'succeeded': succeeded,
      'message': message,
      'errors': errors,
      'errorsBag': errorsBag,
      'data': data.toJson(),
    };
  }
}

class Meta {
  final int totalItems;
  final int totalSolutions;

  Meta({required this.totalItems, required this.totalSolutions});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      totalItems: json['totalItems'],
      totalSolutions: json['totalSolutions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalItems': totalItems,
      'totalSolutions': totalSolutions,
    };
  }
}

class TripData {
  final Place accommodation;
  final List<Place> restaurants;
  final List<Place> entertainments;
  final List<Place> tourismAreas;

  TripData({
    required this.accommodation,
    required this.restaurants,
    required this.entertainments,
    required this.tourismAreas,
  });
  factory TripData.empty() {
    return TripData(
      accommodation: Place.empty(),
      restaurants: [],
      entertainments: [],
      tourismAreas: [],
    );
  }
  factory TripData.fromJson(Map<String, dynamic> json) {
    return TripData(
      accommodation: Place.fromJson(json['accommodation']),
      restaurants: List<Place>.from(json['restaurants'].map((x) => Place.fromJson(x))),
      entertainments: List<Place>.from(json['entertainments'].map((x) => Place.fromJson(x))),
      tourismAreas: List<Place>.from(json['tourismAreas'].map((x) => Place.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accommodation': accommodation.toJson(),
      'restaurants': restaurants.map((x) => x.toJson()).toList(),
      'entertainments': entertainments.map((x) => x.toJson()).toList(),
      'tourismAreas': tourismAreas.map((x) => x.toJson()).toList(),
    };
  }
}

class Place {
  final int id;
  final String name;
  final String classType;
  final int averagePricePerAdult;
  final double score;
  final int placeType;
  final int rating;
  final String? imageSource;

  Place({
    required this.id,
    required this.name,
    required this.classType,
    required this.averagePricePerAdult,
    required this.score,
    required this.placeType,
    required this.rating,
    this.imageSource,
  });
  factory Place.empty() {
    return Place(
      id: 0,
      name: '',
      classType: '',
      averagePricePerAdult: 0,
      score: 0.0,
      placeType: 0,
      rating: 0,
      imageSource: null,
    );
  }
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      classType: json['classType'],
      averagePricePerAdult: json['averagePricePerAdult'],
      score: (json['score'] as num).toDouble(),
      placeType: json['placeType'],
      rating: json['rating'],
      imageSource: json['imageSource'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'classType': classType,
      'averagePricePerAdult': averagePricePerAdult,
      'score': score,
      'placeType': placeType,
      'rating': rating,
      'imageSource': imageSource,
    };
  }
}
