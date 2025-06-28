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
import 'package:lottie/lottie.dart';

class BasicTripForm extends StatefulWidget {
  const BasicTripForm({super.key});

  @override
  State<BasicTripForm> createState() => _BasicTripFormState();
}

class _BasicTripFormState extends State<BasicTripForm> {
  final _pageController = PageController();
  int _pageIndex = 0;
  bool _isLoading = false;
  String? _errorMessage;

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
    //Provider.of<TripRequestProvider>(context, listen: false).reset();
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
    required VoidCallback onOptimal,
    required VoidCallback onGreedy,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomizationDialog(
          title: 'Customize Your Trip',
          message:
              'Would you like to customize your trip with optimal or greedy algorithm?',
          primaryButtonText: 'optimal',
          secondaryButtonText: 'greedy',
          onPrimaryPressed: onOptimal,
          onSecondaryPressed: onGreedy,
        );
      },
    );
  }

  Future<void> _showErrorDialog(String message) async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    await Future.delayed(const Duration(seconds: 10));
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final tripProvider = Provider.of<TripRequestProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Plan Your Trip")),
      body: Stack(
        children: [
          Column(
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
                                onPressed: _prevPage,
                                child: const Text("Back")),
                          if (_pageIndex < 3)
                            ElevatedButton(
                                onPressed: _nextPage, child: const Text("Next"))
                          else
                            ElevatedButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => showCustomizationPopup(
                                        context: context,
                                        onOptimal: () =>
                                            _optimizeTrip(tripProvider),
                                        onGreedy: () =>
                                            _greedyTrip(tripProvider),
                                      ),
                              child: const Text("Submit"),
                            ),
                        ],
                      ),
              )
            ],
          ),
          if (_isLoading)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  Lottie.asset('assets/lotties/request_loading.json'),
                  const Text(
                    "Generating your trip, please wait...",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              )),
            ),
        ],
      ),
    );
  }

  Future<void> _optimizeTrip(TripRequestProvider tripProvider) async {
    Navigator.pop(context); // Close the customization dialog
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      TripRequest request = tripProvider.buildRequest();
      TripGenerated trip = await ApiServices.getGeneratedTrip(request);
      setState(() => _isLoading = false);
      if (!mounted) return; // Check if the widget is still mounted
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TripDetails(
            tripGenerated: trip,
            tripRequest: request,
          ),
        ),
      );
    } catch (e) {
    if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      await _showErrorDialog(e.toString());
    }
  }

  Future<void> _greedyTrip(TripRequestProvider tripProvider) async {
    Navigator.pop(context);
    if (!mounted) return; // Close the customization dialog
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      TripRequest request = tripProvider.buildRequest();
      TripGenerated trip = await ApiServices.getGreedyTrip(request);
      if (!mounted) return;
      setState(() => _isLoading = false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TripDetails(
            tripGenerated: trip,
            tripRequest: request,
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      await _showErrorDialog(e.toString());
    }
  }
}
