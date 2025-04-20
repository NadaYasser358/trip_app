import 'package:flutter/material.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/screens/form/form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ChangeNotifierProvider(create: (_)=> TripRequestProvider(),child: const TripFormPageView(),),
      ),
    );
  }
}


