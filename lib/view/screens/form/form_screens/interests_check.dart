import 'package:flutter/material.dart';
import 'package:graduation/app_constants/app_styles.dart';
import 'package:graduation/model_view/trip_request_provider.dart';

class InterestsCheck extends StatefulWidget {
  InterestsCheck({super.key,required this.provider});
  final TripRequestProvider provider;
  @override
  State<InterestsCheck> createState() => _InterestsCheckState();
}


class _InterestsCheckState extends State<InterestsCheck> {
  final List<String> interests = [
    "Food",
    "Accommodation",
    "Entertainments",
    "Tourism Areas"
  ];
  bool food=false;
  bool acc=false;
  bool inter=false;
  bool tourist=false;

  final List<String> chooseInterests=[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Text('Choose your trip interests',style: AppTextStyles.interestTitleStyle,),
          CheckboxListTile(
            title: const Text("Food",style: AppTextStyles.interestStyle,),
            value: food,
            onChanged: (value) {
              setState(() {
                food=!food;
                widget.provider.food(food);
              });
            },
            checkColor: Colors.white,
            activeColor: Colors.lightBlue,

          ),
          CheckboxListTile(
            title: const Text("Accommodation",style: AppTextStyles.interestStyle,),
            value: acc,
            onChanged: (value) {
              setState(() {
                acc=!acc;
                widget.provider.accommodation(acc);
              });
            },
            checkColor: Colors.white,
            activeColor: Colors.lightBlue,
          ),
          CheckboxListTile(
            title: const Text("Entertainments",style: AppTextStyles.interestStyle,),
            value: inter,
            onChanged: (value) {
              setState(() {
                inter=!inter;
                widget.provider.enter(inter);
              });
            },
            checkColor: Colors.white,
            activeColor: Colors.lightBlue,
          ),
          CheckboxListTile(
            title: const Text("Tourism Areas",style: AppTextStyles.interestStyle,),
            value: tourist,
            onChanged: (value) {
              setState(() {
                tourist=!tourist;
                widget.provider.tourism(tourist);
              });
            },
            checkColor: Colors.white,
            activeColor: Colors.lightBlue,
          )
        ],
      ),
    );
  }
}
