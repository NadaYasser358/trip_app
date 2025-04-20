import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/trip_request.dart';

class TripRequestProvider with ChangeNotifier{
  TripRequest tripRequest=TripRequest();
  late bool interestFood;
  late bool interestEntertain;
  late bool interestAcc;
  late bool interestTourist;
  List<String> interestList=[];
  set governorateId(int val){
    tripRequest.governorateId=val;
    notifyListeners();
  }



  set zoneId(int val)
  {
    tripRequest.zoneId=val;
    notifyListeners();
  }

  set budget(int val)
  {
    tripRequest.budgetPerAdult=val;
    notifyListeners();
  }

  set numOfTravelers(int val)
  {
    tripRequest.numberOfTravelers=val;
    notifyListeners();
  }

  void food(bool val){
    interestFood=val;
    if(interestFood){
      interestList.add("food");
    }
    notifyListeners();
  }

  void accommodation(bool val){
    interestAcc=val;
    if(interestAcc){
      interestList.add("accommodation");
    }
    notifyListeners();
  }

  void enter(bool val){
    interestEntertain=val;
    if(interestEntertain)
      {
        interestList.add("entertainment");
      }
    notifyListeners();
  }

  void tourism(bool val){
    interestTourist=val;
    if(interestTourist)
      {
        interestList.add("tourism");
      }
    notifyListeners();
  }

  void orderedInterests(List<String> ordered)
  {
    tripRequest.interests=ordered;
    notifyListeners();
  }

  void printRequest()
  {
    print(tripRequest.toJson());
  }



}