import 'dart:convert';

import 'package:graduation/app_constants/api_constants.dart';
import 'package:graduation/model/data_models/trip_request.dart';
import 'package:http/http.dart' as http;
import '../data_models/trip_generated.dart';

class ApiServices{
  static Future<TripGenerated> getGeneratedTrip(TripRequest tripRequest)async{
    print('get generated trip called');
    var url=Uri.https(ApiConstants.baseUrl,ApiConstants.tripSuggesterEndPoint);
    var response = await http.post(url,body: tripRequest.toJson());
    print(response.body);
    var json=jsonDecode(response.body);
    return TripGenerated.fromJson(json);
  }


}