// lib/pages/trip_form_page.dart

import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/trip_generated.dart';
import 'package:graduation/model/data_models/trip_request.dart';
import 'package:graduation/model/data_sources/api_services.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/screens/trip_details.dart';
import 'package:graduation/view/widgets/custom_dialog.dart';
import 'package:provider/provider.dart';
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
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }
  
  @override
  void initState() {
    super.initState();
    Provider.of<TripRequestProvider>(context, listen: false)
        .reset();
  }

  void _prevPage() {
    FocusScope.of(context).unfocus();
    if (_pageIndex >= 0) {
      setState(() => _pageIndex--);
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Future<void> showCustomizationPopup({
    required BuildContext context,
    required VoidCallback onCustomize,
    required VoidCallback onSkip,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomizationDialog(
          title: 'Customize Your Trip',
          message:
              'Would you like to further customize your interests before we generate your trip?',
          primaryButtonText: 'Yes, customize',
          secondaryButtonText: 'No, generate now',
          onPrimaryPressed: onCustomize,
          onSecondaryPressed: onSkip,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripRequestProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Plan Your Trip")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Destination(),
                BudgetTravelers(),
                InterestsCheck(),
                InterestsReorder(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _pageIndex == 0
                ? ElevatedButton(
                    onPressed: _nextPage, child: const Text("Next"))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_pageIndex > 0)
                        TextButton(
                            onPressed: _prevPage, child: const Text("Back")),
                      if (_pageIndex < 3)
                        ElevatedButton(
                            onPressed: _nextPage, child: const Text("Next"))
                      else
                        ElevatedButton(
                          onPressed: () async {
                            TripRequest request = tripProvider.buildRequest();
                            TripGenerated trip =
                                await ApiServices.getGeneratedTrip(request);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TripDetails(
                                          tripGenerated: trip,
                                          tripRequest: request,
                                        )));
                          },
                          child: const Text("Submit"),
                        ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
