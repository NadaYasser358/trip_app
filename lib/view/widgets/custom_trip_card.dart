import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model/data_models/accommodation.dart';
import 'package:graduation/model/data_models/entertainment.dart';
import 'package:graduation/model/data_models/restaurant.dart';
import 'package:graduation/model/data_models/tourism_area.dart';
import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'package:graduation/view/screens/item_details_screen.dart';

class CustomPlaceCard extends StatelessWidget {
  const CustomPlaceCard({super.key, required this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.r),
        child: GestureDetector(
          onTap: () async {
            TripItem item;
            switch (place.placeType) {
              case 0:
                item = await Accommodation.getItemById(place.id);
                break;
              case 1:
                item = await Restaurant.getItemById(place.id);
                break;
              case 2:
                item = await Entertainment.getItemById(place.id);
                break;
              case 3:
                item = await TourismArea.getItemById(place.id);
                break;
              default:
                item = TripItem.fromJson({});
                break;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailsScreen(item: item),
              ),
            );
          },
          child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8.r),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              width: 200.w,
              height: 150.h,
              //padding: EdgeInsets.all(16.r),
              decoration: place.imageSource != null
                  ? BoxDecoration(
                      //color: Colors.black.withOpacity(0.7),
                      image: DecorationImage(
                        image: NetworkImage(place.imageSource!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    )
                  : BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade200, Colors.blue.shade50],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ],
                        center: Alignment.center,
                        radius: 0.9,
                      ),
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            place.placeType == 0
                                ? Icons.hotel
                                : place.placeType == 1
                                    ? Icons.restaurant
                                    : place.placeType == 2
                                        ? Icons.tv
                                        : Icons.attractions,
                            size: 32.sp,
                            color: Colors.white),
                        SizedBox(height: 8.h),
                        Text(place.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(height: 4.h),
                        Text(
                            place.averagePricePerAdult != 0
                                ? "Avg Price: ${place.averagePricePerAdult} EGP"
                                : "Price not available",
                            style: TextStyle(
                                fontSize: 14.sp, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
