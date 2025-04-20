import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation/model_view/trip_request_provider.dart';

class BudgetTravelers extends StatelessWidget {
  BudgetTravelers({super.key,required this.provider});
  final TripRequestProvider provider;
  final budgetController = TextEditingController();
  final travelersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: budgetController,
          onChanged: (value) {
            provider.tripRequest.budgetPerAdult=int.parse(value);
          },
          decoration: InputDecoration(labelText: "Budget"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        TextFormField(
          onChanged: (value) {
            provider.tripRequest.numberOfTravelers=int.parse(value);
          },
          controller: travelersController,
          decoration: InputDecoration(labelText: "Travelers"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        //text form field
      ],
    );
  }
}
