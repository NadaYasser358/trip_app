import 'package:flutter/material.dart';

class TripDetailsStepper extends StatefulWidget {
  const TripDetailsStepper({super.key});

  @override
  State<TripDetailsStepper> createState() => _TripDetailsStepperState();
}

class _TripDetailsStepperState extends State<TripDetailsStepper> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trip Details'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepTapped: (index) => setState(() => _currentStep = index),
        onStepContinue: () => setState(() => _currentStep = (_currentStep + 1).clamp(0, 3)),
        onStepCancel: () => setState(() => _currentStep = (_currentStep - 1).clamp(0, 3)),
        steps: [
          Step(
            title: const Text('Accommodation'),
            content: _buildCardList('Hotel Al Masah', 'Luxury stay with pool and spa.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Restaurants'),
            content: _buildCardList('Nile View Restaurant', 'Enjoy dinner by the river.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Entertainment'),
            content: _buildCardList('City Cinema', 'Latest movies and shows.'),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('Tourism Areas'),
            content: _buildCardList('Giza Pyramids', 'Explore the wonders of ancient Egypt.'),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
    );
  }

  Widget _buildCardList(String title, String description) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _showDetailsDialog(title, description),
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade200, Colors.blue.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.place, size: 32, color: Colors.blue.shade900),
                    const SizedBox(height: 8),
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(description, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetailsDialog(String title, String description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          )
        ],
      ),
    );
  }
}

