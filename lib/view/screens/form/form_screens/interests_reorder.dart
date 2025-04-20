import 'package:flutter/material.dart';
import 'package:graduation/model_view/trip_request_provider.dart';

import '../../../widgets/interest_sorter.dart';

class InterestsReorder extends StatelessWidget {
  InterestsReorder({super.key,required this.provider});
  final TripRequestProvider provider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Order Your interests according to your priorty"),
        Text("Drag and move up"),
        InterestSorter(initial: provider.interestList, onChanged: (p0) => provider.orderedInterests(p0),)
      ],
    );
  }
}
