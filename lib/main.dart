import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/app_constants/routes_manager.dart';
import 'package:graduation/firebase_options.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/screens/auth/login.dart';
import 'package:graduation/view/screens/auth/signup.dart';
import 'package:graduation/view/screens/basic_form/form.dart';
import 'package:graduation/view/screens/home/home.dart';
import 'package:graduation/view/screens/onboarding.dart';
import 'package:graduation/view/theme/light.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
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
      builder: (_, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          routes: {
            RoutesManager.home: (_) => const Home(),
            RoutesManager.baseForm: (_) => const BasicTripForm(),
            RoutesManager.onboardingScreen: (_) => const OnboardingScreen(),
            RoutesManager.loginScreen: (_) => const LoginScreen(),
            RoutesManager.signupScreen: (_) => const SignupScreen(),
          },
          initialRoute: RoutesManager.onboardingScreen,
        );
      },
    );
  }
}
