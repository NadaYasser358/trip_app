import 'package:graduation/model/data_models/trip_generated.dart';

class TripModel {
  String? id;
  String? name;
  String? location;
  int? budgetPerAdult;
  int? numOfAdults;
  List<String>? interests;
  String? image;
  TripData? trip;

  TripModel({
    this.id,
    this.name,
    this.location,
    this.image,
    this.trip,
    this.budgetPerAdult,
    this.interests,
    this.numOfAdults
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      trip: json['trip'] != null
          ? TripData.fromJson(json['trip'])
          : null,
      budgetPerAdult: json['budgetPerAdult'] as int?,
      interests: json['interests'] != null
          ? List<String>.from(json['interests'])
          : null,
      numOfAdults: json['numOfAdults'] as int?,
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'image': image,
      'trip': trip?.toJson(),
      'budgetPerAdult': budgetPerAdult,
      'interests': interests,
      'numOfAdults': numOfAdults,
    };
  }
}
