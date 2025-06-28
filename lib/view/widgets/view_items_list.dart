import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'package:graduation/view/widgets/item_card.dart';

class TripSection<T extends TripItem> extends StatelessWidget {
  final String title;
  final Future<List<T>> Function() fetchItems;
  final Widget Function(T item) itemBuilder;

  const TripSection({
    required this.title,
    required this.fetchItems,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 200,
          child: FutureBuilder<List<T>>(
            future: fetchItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No items found'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ItemCard(place: item,);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}