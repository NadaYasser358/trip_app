import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/trip_generated.dart';

class CustomPlaceCard extends StatelessWidget {
 const CustomPlaceCard({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
            
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: place.imageSource != null
                    ? BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(place.imageSource!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      )
                    : BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Colors.blue.shade200, Colors.blue.shade50],
                     begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                   ),
                   borderRadius: BorderRadius.circular(16),
                 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.place, size: 32, color: Colors.blue.shade900),
                    const SizedBox(height: 8),
                    Text(place.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(place.averagePricePerAdult != 0
                        ? "Avg Price: ${place.averagePricePerAdult} EGP"
                        : "Price not available",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.white70)),
                  ],
                ),
              ),
            ),
          )
    );
  }
}
