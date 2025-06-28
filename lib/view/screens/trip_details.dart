import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/app_constants/ids.dart';
import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/model/data_models/trip_request.dart';
import 'package:graduation/view/widgets/custom_trip_card.dart';

class TripDetails extends StatelessWidget {
  const TripDetails(
      {super.key, required this.tripGenerated, required this.tripRequest});
  final TripGenerated tripGenerated;
  final TripRequest tripRequest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trip Details',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            Text(
              "Trip to: ${DataIds.governorates[tripRequest.governorateId! - 1]}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              "Explore city in a day with a focus on your interests: Food, Entertainment, Tourism, and Accommodation.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text("Your Trip Includes:",style: TextStyle(color: Colors.black),),
            const SizedBox(height: 10),
            Text("budget: ${tripRequest.budgetPerAdult} EGP",
                style: const TextStyle(color: Colors.blue,fontSize: 18)),
            // --- Trip Data Section by User Interests ---
            const SizedBox(height: 20),
            ...tripRequest.interests.map((interest) {
              switch (interest) {
                case "food":
                  if (tripGenerated.data.restaurants.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Food & Restaurants",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildCardList(tripGenerated.data.restaurants),
                      ],
                    );
                  }
                  break;
                case "entertainments":
                  if (tripGenerated.data.entertainments.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Entertainment",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildCardList(tripGenerated.data.entertainments),
                      ],
                    );
                  }
                  break;
                case "tourismAreas":
                  if (tripGenerated.data.tourismAreas.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Tourism Areas",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        _buildCardList(tripGenerated.data.tourismAreas),
                      ],
                    );
                  }
                  break;
                case "accommodation":
                  if (tripGenerated.data.accommodation.name.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Accommodation",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        CustomPlaceCard(
                            place: tripGenerated.data.accommodation),
                      ],
                    );
                  }
                  break;
              }
              return const SizedBox.shrink();
            }),
            
          ],
        ),
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
