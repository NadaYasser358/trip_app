import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model_view/trip_request_provider.dart';
import 'form_screens/budget.dart';
import 'form_screens/distnation.dart';
import 'form_screens/interests_check.dart';
import 'form_screens/interests_reorder.dart';

class BasicTripForm extends StatefulWidget {
  const BasicTripForm({super.key});

  @override
  State<BasicTripForm> createState() => _BasicTripFormState();
}

class _BasicTripFormState extends State<BasicTripForm> {
  final _pageController = PageController();
  int _pageIndex = 0;

  void _nextPage() {
    FocusScope.of(context).unfocus();
    if (_pageIndex < 3) {
      setState(() => _pageIndex++);
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    FocusScope.of(context).unfocus();
    if (_pageIndex > 0) {
      setState(() => _pageIndex--);
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripRequestProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Plan Your Trip")),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Destination(provider: tripProvider,),
                BudgetTravelers(provider: tripProvider,),
                InterestsCheck(provider: tripProvider,),
                InterestsReorder(provider: tripProvider,),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_pageIndex > 0)
                TextButton(onPressed: _prevPage, child: const Text("Back")),
              if (_pageIndex < 3)
                ElevatedButton(onPressed: _nextPage, child: const Text("Next"))
              else
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    tripProvider.printRequest();
                  },
                  child: const Text("Submit"),
                ),
            ],
          )
        ],
      ),
    );
  }


}
