import 'package:graduation/model/data_models/accommodation.dart';
import 'package:graduation/model/data_models/entertainment.dart';
import 'package:graduation/model/data_models/restaurant.dart';
import 'package:graduation/model/data_models/tourism_area.dart';

abstract class TripItem {
  final int id;
  final String name;
  final String classType;
  final String zone;
  final int zoneId;
  final String governorate;
  final int governorateId;
  final double rating;
  final String placeType;
  final int averagePricePerAdult;
  final bool hasKidsArea;
  final String description;
  final String address;
  final String? mapLink;
  final String? contactLink;
  final String? imageUrl;
  final double score;

  const TripItem({
    required this.id,
    required this.name,
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
    required this.score,
  });

  /// Polymorphic factory method
  factory TripItem.fromJson(Map<String, dynamic> json) {
    final type = json['placeType'];

    switch (type) {
      case 0:
        return Accommodation.fromJson(json);
      case 1:
        return Restaurant.fromJson(json);
      case 2:
        return Entertainment.fromJson(json);
      case 3:
        return TourismArea.fromJson(json);
      default:
        throw Exception('Unknown placeType: $type');
    }
  }

  
}
