import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/app_constants/routes_manager.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/screens/basic_form/form.dart';
import 'package:graduation/view/screens/customize_form/customize_trip_form.dart';
import 'package:graduation/view/screens/home/home.dart';
import 'package:graduation/view/screens/trip_details.dart';
import 'package:graduation/view/theme/light.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TripRequestProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          routes: {
            RoutesManager.home: (_) => const Home(),
            RoutesManager.baseForm: (_) => const BasicTripForm(),
            RoutesManager.tripDetailsScreen: (_) => const TripDetailsStepper(),
            RoutesManager.customizationForm: (_)=> const CustomizationForm()
          },
          initialRoute: RoutesManager.tripDetailsScreen,
        );
      },
    );
  }
}


