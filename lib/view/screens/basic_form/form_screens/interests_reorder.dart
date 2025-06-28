import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/interest_sorter.dart';

class InterestsReorder extends StatefulWidget {
  const InterestsReorder({super.key});

  @override
  State<InterestsReorder> createState() => _InterestsReorderState();
}

class _InterestsReorderState extends State<InterestsReorder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TripRequestProvider>(context, listen: false)
          .checkedInterest();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    // if (provider.interestList.isEmpty) {
    //   return Center(
    //     child: Text(
    //       "Please select your interests first",
    //       style: Theme.of(context).textTheme.titleMedium,
    //     ),
    //   );
    // }
    final items = provider.interestList;
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/image/elmond.jpeg"),
          width: 200.w,
          height: 200.h,
        ),
        Text(
          "Order Your interests according to your priority",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "Drag and move up",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ReorderableListView(
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
            provider.orderedInterests(List<String>.from(items));
          },
          children: [
            for (final item in items)
              Padding(
                key: ValueKey(item),
                padding: EdgeInsets.all(10.0.r),
                child: ListTile(
                    title: Text(
                      item,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: const Icon(Icons.check),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(25.r))),
              )
          ],
        )
      ],
    );
  }
}
