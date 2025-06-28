import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;

class TourismArea extends TripItem {
  
  final String tourismType;
  

  TourismArea({
    
    required this.tourismType,
    required int id,
    required String name,
    required String description,
    required String classType,
    required String zone,
    required int zoneId,
    required String governorate,
    required int governorateId,
    required double rating,
    required int averagePricePerAdult,
    required bool hasKidsArea,
    required String address,
    String? mapLink,
    String? contactLink,
    String? imageUrl,
    required String placeType,
    required double score,
  }):super(
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

  factory TourismArea.fromJson(Map<String, dynamic> json) {
    return TourismArea(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate']  ?? '',
      governorateId: json['governorateId'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
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
  
  static Future<TourismArea> getItemById(int id) async{
     var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/tourismArea/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Tourism area data: ${data['data'].toString()}');
      return TourismArea.fromJson(data['data']);
    } else {
      throw Exception('Failed to get tourism area: ${response.body}');
    }
  }

  static Future<List<TourismArea>> getAllItems() async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/tourismArea/list');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Tourism areas data: ${data['data'].toString()}');
      List<dynamic> items = data['data'];
      return items.map((item) => TourismArea.fromJson(item)).toList();
    } else {
      throw Exception('Failed to get tourism areas: ${response.body}');
    }
  }
}
