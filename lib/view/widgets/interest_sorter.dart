import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

class InterestSorter extends StatefulWidget {
  final List<String> initial;

  const InterestSorter({required this.initial, super.key});

  @override
  State<InterestSorter> createState() => _InterestSorterState();
}

class _InterestSorterState extends State<InterestSorter> {
  late List<String> items;

  @override
  void initState() {
    super.initState();
    items = List.from(widget.initial);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    return ReorderableListView(
      shrinkWrap: true,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex--;
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
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
    );
  }
}
