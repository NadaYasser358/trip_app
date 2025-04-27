import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/model_view/trip_request_provider.dart';
import 'package:provider/provider.dart';

import '../../../../app_constants/ids.dart';

class Destination extends StatefulWidget {
  const Destination({super.key});
  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {

  String selectedGov = "Cairo";
  String selectedZone = "Maadi";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TripRequestProvider>(context);
    final currentGovZones = DataIds.zones[selectedGov];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/image/location.jpeg"),width: 200.w,height: 200.h,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Text("Let's start your trip",style: Theme.of(context).textTheme.headlineLarge,),
            ),
            Text('What is your destination?',style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 20.h,),
            DropdownButtonFormField<String>(

              value: selectedGov,
              items: DataIds.governorates
                  .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedGov = value;
                    //selectedZone = DataIds.zones[value].first;
                  });
                  provider.updateGovernorate( DataIds.governorates.indexOf(value) + 1);
                  provider.updateZone(1); // reset zone to first of new list
                }
              },

            ),
            SizedBox(height: 40.h,),
            Text("If you want a specific area?!",style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 20.h,),
            DropdownButtonFormField<String>(
              value: selectedZone,
              items: currentGovZones
                  ?.map((zone) => DropdownMenuItem(value: zone, child: Text(zone)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedZone = value);
                  provider.updateZone(currentGovZones!.indexOf(value) + 1);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

