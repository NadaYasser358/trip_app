import 'package:flutter/material.dart';
import 'package:graduation/app_constants/routes_manager.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/screens/form/form.dart';
import 'package:graduation/view/screens/home/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RoutesManager.home:(_)=>const Home(),
        RoutesManager.baseForm:(_)=>const BasicTripForm()
      },
      initialRoute: RoutesManager.home,

    );
  }
}


