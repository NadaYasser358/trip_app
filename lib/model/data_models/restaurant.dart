
import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as https;

class Restaurant extends TripItem{
  
  final String foodCategory;
  

  Restaurant({
    required int id,
    required String name,
    required this.foodCategory,
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

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      foodCategory: json['foodCategory'] ?? '',
      classType: json['classType'] ?? '',
      zone: json['zone'] ?? '',
      zoneId: json['zoneId'] ?? 0,
      governorate: json['governorate'] ?? '',
      governorateId: json['governorateId'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      placeType: json['placeType'] ?? '',
      averagePricePerAdult: json['averagePricePerAdult'] ?? 0,
      hasKidsArea: json['hasKidsArea'] ?? false,
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      mapLink: json['mapLink'] ?? '',
      contactLink: json['contactLink']  ?? '',
      imageUrl: json['imageUrl']  ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
    );
  }
  
  static Future<Restaurant> getItemById(int id) async{
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/restaurant/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Restaurant data: ${data['data'].toString()}');
      return Restaurant.fromJson(data['data']);
    } else {
      throw Exception('Failed to get restaurant: ${response.body}');
    }
  }

  static Future<List<Restaurant>> getAllItems() async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/restaurant/list');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Restaurants data: ${data['data'].toString()}');
      return (data['data'] as List)
          .map((item) => Restaurant.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to get restaurants: ${response.body}');
    }
  }
}
