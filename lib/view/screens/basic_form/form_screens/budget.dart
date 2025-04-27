import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

class BudgetTravelers extends StatefulWidget {
  const BudgetTravelers({super.key});

  @override
  State<BudgetTravelers> createState() => _BudgetTravelersState();
}

class _BudgetTravelersState extends State<BudgetTravelers> {
  TextEditingController _budgetValue = TextEditingController();
  TextEditingController _travelersValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image(image: AssetImage("assets/image/money.jpeg"),width: 200.w,height: 200.h,),
            SizedBox(height: 20.h,),
            Text("Enter budget per adult",style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 10.h,),
            TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: _budgetValue,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                final parsed = int.tryParse(_budgetValue.text.trim());
                if (parsed != null) provider.updateBudget(parsed);
              },
            ),
            SizedBox(height: 20.h,),
            Text("Enter number of adults",style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 10.h,),
            TextFormField(
              style: Theme.of(context).textTheme.titleMedium,
              controller: _travelersValue,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                final parsed = int.tryParse(_travelersValue.text.trim());
                if (parsed != null) provider.updateTravelers(parsed);
              },
            ),
          ],
        ),
      ),
    );
  }
}

