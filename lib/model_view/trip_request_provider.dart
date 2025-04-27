import 'package:graduation/model/data_models/trip_request.dart';
import 'package:flutter/material.dart';

class TripRequestProvider extends ChangeNotifier {
  int governorateId = 0;
  int zoneId = 0;
  int budgetPerAdult = 0;
  int numberOfTravelers =0;
  final List<String> _interests = [];
  int maxRestaurants = 0;
  int maxAccommodations = 0;
  int maxEntertainments = 0;
  int maxTourismAreas = 0;

  List<String> get interestList => _interests;

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

  void food(bool selected) {
    _toggleInterest("food", selected);
  }

  void accommodation(bool selected) {
    _toggleInterest("accommodation", selected);
  }

  void enter(bool selected) {
    _toggleInterest("entertainments", selected);
  }

  void tourism(bool selected) {
    _toggleInterest("tourismAreas", selected);
  }

  void orderedInterests(List<String> values) {
    _interests
      ..clear()
      ..addAll(values);
    notifyListeners();
  }

  void _toggleInterest(String name, bool isSelected) {
    if (isSelected && !_interests.contains(name)) {
      _interests.add(name);
    } else if (!isSelected && _interests.contains(name)) {
      _interests.remove(name);
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

