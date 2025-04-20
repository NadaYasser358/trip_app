import 'package:flutter/material.dart';

class InterestSorter extends StatefulWidget {
  final List<String> initial;
  final Function(List<String>) onChanged;

  const InterestSorter({required this.initial, required this.onChanged, super.key});

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
    return ReorderableListView(
      shrinkWrap: true,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex--;
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
        widget.onChanged(items);
      },
      children: [
        for (final item in items)
          ListTile(
            key: ValueKey(item),
            title: Text(item),
            leading: const Icon(Icons.drag_handle),
          )
      ],
    );
  }
}