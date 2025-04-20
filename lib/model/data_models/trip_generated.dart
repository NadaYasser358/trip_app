import 'package:graduation/model/data_models/resturant.dart';
import 'package:graduation/model/data_models/tourism_erea.dart';

import 'accomodation.dart';
import 'entertainments.dart';

class TripGenerated {
  late int statusCode;
  Meta? meta;
  late bool succeeded;
  late String message;
  Null errors;
  Null errorsBag;
  Data? data;

  TripGenerated(
      {required this.statusCode,
        this.meta,
        required this.succeeded,
        required this.message,
        this.errors,
        this.errorsBag,
        required this.data});

  TripGenerated.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    errorsBag = json['errorsBag'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['succeeded'] = succeeded;
    data['message'] = message;
    data['errors'] = errors;
    data['errorsBag'] = errorsBag;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  int? totalItems;
  int? totalSolutions;

  Meta({this.totalItems, this.totalSolutions});

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    totalSolutions = json['totalSolutions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItems'] = totalItems;
    data['totalSolutions'] = totalSolutions;
    return data;
  }
}

class Data {
  Accommodation? accommodation;
  List<Restaurant>? restaurants;
  List<Entertainment>? entertainments;
  List<TourismArea>? tourismAreas;

  Data(
      {this.accommodation,
        this.restaurants,
        this.entertainments,
        this.tourismAreas});

  Data.fromJson(Map<String, dynamic> json) {
    accommodation = json['accommodation'] != null
        ?  Accommodation.fromJson(json['accommodation'])
        : null;
    if (json['restaurants'] != null) {
      restaurants = <Restaurant>[];
      json['restaurants'].forEach((v) {
        restaurants!.add( Restaurant.fromJson(v));
      });
    }
    if (json['entertainments'] != null) {
      entertainments = <Entertainment>[];
      json['entertainments'].forEach((v) {
        entertainments!.add(Entertainment.fromJson(v));
      });
    }
    if (json['tourismAreas'] != null) {
      tourismAreas = <TourismArea>[];
      json['tourismAreas'].forEach((v) {
        tourismAreas!.add(TourismArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accommodation != null) {
      data['accommodation'] = accommodation!.toJson();
    }
    if (restaurants != null) {
      data['restaurants'] = restaurants!.map((v) => v.toJson()).toList();
    }
    if (entertainments != null) {
      data['entertainments'] =
          entertainments!.map((v) => v.toJson()).toList();
    }
    if (tourismAreas != null) {
      data['tourismAreas'] = tourismAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

