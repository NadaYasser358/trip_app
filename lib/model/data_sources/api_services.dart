import 'dart:convert';

import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_request.dart';
import 'package:http/http.dart' as https;
import '../data_models/trip_generated.dart';


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

  static Future<TripGenerated> getGreedyTrip(TripRequest tripRequest) async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.greedyEndPoint);

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

 

 

  

  
}
