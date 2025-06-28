import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/accommodation.dart';
import 'package:graduation/model/data_models/entertainment.dart';
import 'package:graduation/model/data_models/restaurant.dart';
import 'package:graduation/model/data_models/tourism_area.dart';
import 'package:graduation/view/widgets/item_card.dart';
import 'package:graduation/view/widgets/view_items_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
//hideable
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripSection<Restaurant>(
              title: "🍽️ Restaurants",
              fetchItems: Restaurant.getAllItems,
              itemBuilder: (restaurant) => ItemCard(place: restaurant),
            ),
            TripSection<TourismArea>(
              title: "🏛️ Tourism Areas",
              fetchItems: TourismArea.getAllItems,
              itemBuilder: (area) => ItemCard(place: area),
            ),
            TripSection<Accommodation>(
              title: "🏨 Accommodations",
              fetchItems: Accommodation.getAllItems,
              itemBuilder: (hotel) => ItemCard(place: hotel),
            ),
            TripSection<Entertainment>(
              title: "🎭 Entertainments",
              fetchItems: Entertainment.getAllItems,
              itemBuilder: (ent) => ItemCard(place: ent),
            ),
          ],
        ),),
    );
  }
}
