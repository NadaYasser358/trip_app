import 'package:graduation/model/data_models/trip_request.dart';
import 'package:flutter/material.dart';
import 'package:graduation/view/screens/customize_form/taps/accommodation_filters.dart';
import 'package:graduation/view/screens/customize_form/taps/entertainments_filter.dart';
import 'package:graduation/view/screens/customize_form/taps/food.dart';
import 'package:graduation/view/screens/customize_form/taps/tourizm_filter.dart';

class TripRequestProvider extends ChangeNotifier {
  int governorateId = 0;
  int zoneId = 0;
  int budgetPerAdult = 0;
  int numberOfTravelers = 0;
  final List<String> _interests = [];
  final List<Widget> filters = [];
  int maxRestaurants = 3;
  int maxAccommodations = 1;
  int maxEntertainments = 2;
  int maxTourismAreas = 2;

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

  void filtersList() {
    if (_interests.contains("food")) {
      filters.add(const FoodFilter());
    }
    if (_interests.contains("entertainments")) {
      filters.add(const EntertainmentsFilter());
    }
    if (_interests.contains("tourismAreas")) {
      filters.add(const TourismFilter());
    }
    if (_interests.contains("accommodation")) {
      filters.add(const AccommodationFilter());
    }
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
