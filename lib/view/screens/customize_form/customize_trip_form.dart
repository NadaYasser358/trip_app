import 'package:flutter/material.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

class CustomizationForm extends StatefulWidget {
  const CustomizationForm({super.key});

  @override
  State<CustomizationForm> createState() => _CustomizationFormState();
}

class _CustomizationFormState extends State<CustomizationForm> {
  final _pageController = PageController();
  int _pageIndex = 0;
  int pagesCount = 0;

  void _nextPage() {
    FocusScope.of(context).unfocus();
    if (_pageIndex < pagesCount) {
      setState(() => _pageIndex++);
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    FocusScope.of(context).unfocus();
    if (_pageIndex >= 0) {
      setState(() => _pageIndex--);
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    pagesCount = provider.filters.length;
    return Scaffold(
      appBar: AppBar(title: const Text("Trip Customizer")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: provider.filters,
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
                      if (_pageIndex < pagesCount-1)
                        ElevatedButton(
                            onPressed: _nextPage, child: const Text("Next"))
                      else
                        ElevatedButton(
                          onPressed: () {},
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
