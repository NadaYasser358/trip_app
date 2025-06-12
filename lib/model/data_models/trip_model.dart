import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/model/data_models/trip_request.dart';

class TripModel {
  String? id;
  String? name;
  String? description;
  String? startDate;
  String? endDate;
  String? location;
  String? image;
  TripGenerated? tripGenerated;
  TripRequest? tripRequest;

  TripModel({
    this.id,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.location,
    this.image,
    this.tripGenerated,
    this.tripRequest,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      location: json['location'] as String?,
      image: json['image'] as String?,
      tripGenerated: json['tripGenerated'] != null
          ? TripGenerated.fromJson(json['tripGenerated'])
          : null,
      tripRequest: json['tripRequest'] != null
          ? TripRequest.fromJson(json['tripRequest'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'image': image,
      'tripGenerated': tripGenerated?.toJson(),
      'tripRequest': tripRequest?.toJson(),
    };
  }
}
