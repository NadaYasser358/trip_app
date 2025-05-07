import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/view/widgets/custom_trip_card.dart';

class TripDetailsStepper extends StatefulWidget {
  const TripDetailsStepper({super.key});

  @override
  State<TripDetailsStepper> createState() => _TripDetailsStepperState();
}

class _TripDetailsStepperState extends State<TripDetailsStepper> {
  int _currentStep = 0;
  final  TripGenerated staticTripGenerated = TripGenerated(
  statusCode: 0,
  meta: Meta(
    totalItems: 5,
    totalSolutions: 1,
  ),
  succeeded: true,
  message: 'Trip plan optimized successfully',
  errors: null,
  errorsBag: null,
  data: TripData(
    accommodation: Place(
      id: 12,
      name: 'Sonesta 2 Tower & Casino Cairo',
      classType: 'A',
      averagePricePerAdult: 8147,
      score: 2.88,
      placeType: 0,
      rating: 0,
      imageSource: null,
    ),
    restaurants: [
      Place(
        id: 18,
        name: 'If Tarboosh is old food',
        classType: 'A',
        averagePricePerAdult: 720,
        score: 4.0,
        placeType: 1,
        rating: 0,
        imageSource: null,
      ),
      Place(
        id: 62,
        name: 'Arabiata',
        classType: 'D',
        averagePricePerAdult: 100,
        score: 1.0,
        placeType: 1,
        rating: 0,
        imageSource: null,
      ),
    ],
    entertainments: [
      Place(
        id: 11,
        name: 'El Wonderland',
        classType: 'A',
        averagePricePerAdult: 200,
        score: 4.4,
        placeType: 2,
        rating: 0,
        imageSource: null,
      ),
    ],
    tourismAreas: [
      Place(
        id: 44,
        name: 'International Garden',
        classType: 'B',
        averagePricePerAdult: 10,
        score: 4.32,
        placeType: 3,
        rating: 0,
        imageSource: null,
      ),
    ],
  ),
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (index) => setState(() => _currentStep = index),
        onStepContinue: () =>
            setState(() => _currentStep = (_currentStep + 1).clamp(0, 3)),
        onStepCancel: () =>
            setState(() => _currentStep = (_currentStep - 1).clamp(0, 3)),
        steps: [
          Step(
            title: const Text('Accommodation'),
            content: CustomPlaceCard(place: staticTripGenerated.data.accommodation),
            // _buildCardList(staticTripGenerated.data.accommodation),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Restaurants'),
            content: _buildCardList(staticTripGenerated.data.restaurants
                ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Entertainment'),
            content: _buildCardList(staticTripGenerated.data.entertainments),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('Tourism Areas'),
            content: _buildCardList(
                staticTripGenerated.data.tourismAreas),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
    );
  }

  Widget _buildCardList(List<Place> places) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: places.length,
        itemBuilder: (context, index) {
          return CustomPlaceCard(place: places[index]);
        },
      ),
    );
  }

}
