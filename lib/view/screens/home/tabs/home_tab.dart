import 'package:flutter/material.dart';
import 'package:graduation/app_constants/routes_manager.dart';
import 'package:graduation/view/widgets/custom_trip_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
//hideable
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => GestureDetector(child: CustomTripCard(),onTap: ()=>Navigator.pushNamed(context, RoutesManager.tripDetailsScreen),),
      itemCount: 10,
    );
  }
}
