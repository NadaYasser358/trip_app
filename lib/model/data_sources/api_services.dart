import 'dart:convert';

import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_request.dart';
import 'package:http/http.dart' as https;
import '../data_models/trip_generated.dart';
import '../data_models/restaurant.dart';
import '../data_models/entertainment.dart';
import '../data_models/tourism_area.dart';
import '../data_models/accommodation.dart';

class ApiServices {
  static Future<TripGenerated> getGeneratedTrip(TripRequest tripRequest) async {
    var url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.tripSuggesterEndPoint);

    final response = await https.post(
      url,
      headers: {
        'Content-Type': 'application/json', // ✅ required!
      },
      body: jsonEncode(tripRequest.toJson()), // ✅ required!
    );

    if (response.statusCode == 200) {
      return TripGenerated.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to generate trip: ${response.body}');
    }
  }

  static Future<Restaurant> getRestaurantById(int id) async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/restaurant/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Restaurant.fromJson(data['data']);
    } else {
      throw Exception('Failed to get restaurant: ${response.body}');
    }
  }

  static Future<Entertainment> getEntertainmentById(int id) async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/entertainment/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Entertainment.fromJson(data['data']);
    } else {
      throw Exception('Failed to get entertainment: ${response.body}');
    }
  }

  static Future<TourismArea> getTourismAreaById(int id) async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/tourismArea/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return TourismArea.fromJson(data['data']);
    } else {
      throw Exception('Failed to get tourism area: ${response.body}');
    }
  }

  static Future<Accommodation> getAccommodationById(int id) async {
    var url = Uri.https(ApiConstants.baseUrl, '/Api/v1/accommodation/$id');
    final response = await https.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Accommodation.fromJson(data['data']);
    } else {
      throw Exception('Failed to get accommodation: ${response.body}');
    }
  }
}
