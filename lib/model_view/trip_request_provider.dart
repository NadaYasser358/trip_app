import 'package:graduation/model/data_models/trip_request.dart';
import 'package:flutter/material.dart';


class TripRequestProvider extends ChangeNotifier {
  int governorateId = 0;
  int zoneId = 0;
  int budgetPerAdult = 0;
  int numberOfTravelers = 0;
  final List<String> _interests = [];
  int maxRestaurants = 3;
  int maxAccommodations = 1;
  int maxEntertainments = 2;
  int maxTourismAreas = 2;

  List<String> get interestList => _interests;

  bool _food = false;
  set food(bool value) {
    _food = value;
    notifyListeners();
  }
  bool _enter = false;
  set enter(bool value) {
    _enter = value;
    notifyListeners();
  }
  bool _acc = false;
  set acc(bool value) {
    _acc = value;
    notifyListeners();
  }
  bool _tourism = false;
  set tourism(bool value) {
    _tourism = value;
    notifyListeners();
  }
  void updateGovernorate(int value) {
    governorateId = value;
    notifyListeners();
  }

  void updateZone(int value) {
    zoneId = value;
    notifyListeners();
  }

  void updateBudget(int value) {
    budgetPerAdult = value;
    notifyListeners();
  }

  void updateTravelers(int value) {
    numberOfTravelers = value;
    notifyListeners();
  }

  void orderedInterests(List<String> values) {
    _interests
      ..clear()
      ..addAll(values);
    notifyListeners();
  }

  

  void checkedInterest() {
    _interests.clear();

    if (_food) {
      _interests.add("food");
    } 
    if (_acc) {
      _interests.add("accommodation");
    }
    if (_enter) {
      _interests.add("entertainment");
    }
    if (_tourism) {
      _interests.add("tourism");
    }
    notifyListeners();
  }

  void updateLimits({
    int? restaurants,
    int? accommodations,
    int? entertainments,
    int? tourismAreas,
  }) {
    maxRestaurants = restaurants ?? maxRestaurants;
    maxAccommodations = accommodations ?? maxAccommodations;
    maxEntertainments = entertainments ?? maxEntertainments;
    maxTourismAreas = tourismAreas ?? maxTourismAreas;
    notifyListeners();
  }

  TripRequest buildRequest() {
    return TripRequest(
      governorateId: governorateId,
      zoneId: zoneId,
      budgetPerAdult: budgetPerAdult,
      numberOfTravelers: numberOfTravelers,
      interests: _interests,
      maxRestaurants: maxRestaurants,
      maxAccommodations: maxAccommodations,
      maxEntertainments: maxEntertainments,
      maxTourismAreas: maxTourismAreas,
    );
  }

 
}
