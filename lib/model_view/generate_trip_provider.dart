import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/model/data_sources/api_services.dart';
import '../model/data_models/trip_request.dart';

class TripNotifier extends StateNotifier<TripRequest> {
  TripNotifier() : super(TripRequest());
  TripGenerated? trip;
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

  Future<void> generateTrip() async
  {
    print('generate trip called');
    try{
       trip = await ApiServices.getGeneratedTrip(state);
       if(!trip!.succeeded)
         {
           SnackBar(content: Text(trip!.message));
         }
       else {
         SnackBar(content: Text(trip!.message),);
       }
    }catch(e){
      print(e);
    }
  }
}
