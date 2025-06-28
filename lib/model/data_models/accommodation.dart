import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;

class Accommodation extends TripItem {
  final String accomodationType;

  final int numOfBeds;
  final String bedStatus;
  final int numOfPersons;

  Accommodation({
    required int id,
    required String name,
    required String classType,
    required String zone,
    required int zoneId,
    required String governorate,
    required int governorateId,
    required double rating,
    required String placeType,
    required int averagePricePerAdult,
    required bool hasKidsArea,
    required String description,
    required String address,
    String? mapLink,
    String? contactLink,
    String? imageUrl,
    required double score,
    required this.accomodationType,
    required this.numOfBeds,
    required this.bedStatus,
    required this.numOfPersons,
  }) : super(
          id: id,
          name: name,
          classType: classType,
          zone: zone,
          zoneId: zoneId,
          governorate: governorate,
          governorateId: governorateId,
          rating: rating,
          placeType: placeType,
          averagePricePerAdult: averagePricePerAdult,
          hasKidsArea: hasKidsArea,
          description: description,
          address: address,
          mapLink: mapLink,
          contactLink: contactLink,
          imageUrl: imageUrl,
          score: score,
        );

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate'] ?? '',
      governorateId: json['governorateId'] ?? 0,
      rating: (json['rating'] as num).toDouble(),
      placeType: json['placeType'] ?? '',
      averagePricePerAdult: json['averagePricePerAdult'] ?? 0,
      hasKidsArea: json['hasKidsArea'] ?? false,
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      mapLink: json['mapLink'] as String?,
      contactLink: json['contactLink'] as String?,
      imageUrl: json['imageUrl'] as String?,
      score: (json['score'] as num).toDouble(),
      accomodationType: json['accomodationType'] ?? '',
      numOfBeds: json['numOfBeds'] ?? 0,
      bedStatus: json['bedStatus'] ?? '',
      numOfPersons: json['numOfPersons'] ?? 0,
    );
  }

  static Future<Accommodation> getItemById(int id) async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/accommodation/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Accommodation data: ${data['data'].toString()}');
      return Accommodation.fromJson(data['data']);
    } else {
      throw Exception('Failed to get accommodation: ${response.body}');
    }
  }

  static Future<List<Accommodation>> getAllItems() async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/accommodation/list');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Accommodation list data: ${data['data'].toString()}');
      List<dynamic> items = data['data'];
      return items.map((item) => Accommodation.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get accommodations: ${response.body}');
    }
  }
}
