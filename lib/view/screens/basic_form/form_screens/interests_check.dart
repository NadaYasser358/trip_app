import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:graduation/view/widgets/custom_check_box.dart';
import 'package:provider/provider.dart';

class InterestsCheck extends StatefulWidget {
  const InterestsCheck({super.key});

  @override
  State<InterestsCheck> createState() => _InterestsCheckState();
}

class _InterestsCheckState extends State<InterestsCheck> {
  bool food = false;
  bool acc = false;
  bool inter = false;
  bool tourist = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/image/elmond.jpeg"),
          width: 250.w,
          height: 250.h,
        ),
        Text(
          "Check the parameters\n you want in the trip",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        CustomCheckBox(
            checker: food,
            changed: (value) => setState(() {
                  food = value ?? false;
                  provider.food = food;
                }),
            title: "food"),
        CustomCheckBox(
            checker: acc,
            changed: (value) => setState(() {
                  acc = value ?? false;
                  provider.acc=acc;
                }),
            title: "Accommodation"),
        CustomCheckBox(
            checker: inter,
            changed: (value) => setState(() {
                  inter = value ?? false;
                  provider.enter=inter;
                }),
            title: "Entertainments"),
        CustomCheckBox(
            checker: tourist,
            changed: (value) => setState(() {
                  tourist = value ?? false;
                  provider.tourism=tourist;
                }),
            title: "Tourism areas"),
      ],
    );
  }
}
