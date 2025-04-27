import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/interest_sorter.dart';

class InterestsReorder extends StatelessWidget {
  const InterestsReorder({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    return Column(
      children: [
        Image(image: AssetImage("assets/image/elmond.jpeg"),width: 200.w,height: 200.h,),
        Text("Order Your interests according to your priority",style: Theme.of(context).textTheme.titleMedium,),
        Text("Drag and move up",style: Theme.of(context).textTheme.titleMedium,),
        InterestSorter(
          initial: provider.interestList,
          onChanged: (values) => provider.orderedInterests(values),
        )
      ],
    );
  }
}

