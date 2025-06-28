import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'package:graduation/view/screens/item_details_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.place});
  final TripItem place;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.r),
        child: GestureDetector(
          onTap: () async {
           
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetailsScreen(item: place),
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
              decoration: place.imageUrl != null
                  ? BoxDecoration(
                      //color: Colors.black.withOpacity(0.7),
                      image: DecorationImage(
                        image: NetworkImage(place.imageUrl!),
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
