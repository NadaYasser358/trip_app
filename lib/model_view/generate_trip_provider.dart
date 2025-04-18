import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/trip_request.dart';

class TripNotifier extends StateNotifier<TripRequest> {
  TripNotifier() : super(TripRequest());

  void updateGovernorate(int id) => state = state.copyWith(governorateId: id);
  void updateZone(int id) => state = state.copyWith(zoneId: id);
  void updateBudget(int budget) =>
      state = state.copyWith(budgetPerAdult: budget);
  void updateTravelers(int count) =>
      state = state.copyWith(numberOfTravelers: count);
  void updateInterests(List<String> sortedInterests) =>
      state = state.copyWith(interests: sortedInterests);
  void updateMaxLimits(
          {int? restaurants,
          int? accommodations,
          int? entertainments,
          int? tourism}) =>
      state = state.copyWith(
        maxRestaurants: restaurants,
        maxAccommodations: accommodations,
        maxEntertainments: entertainments,
        maxTourismAreas: tourism,
      );
}
