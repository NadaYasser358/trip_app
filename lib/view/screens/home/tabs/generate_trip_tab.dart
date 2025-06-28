import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/app_constants/routes_manager.dart';

class GenerateTripTab extends StatelessWidget {
  const GenerateTripTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(image: const AssetImage("assets/image/travel.jpeg"),width: 400.w,height: 400.h,),
          ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, RoutesManager.baseForm), child: const Text("generate trip")),

        ],
      ),
    );
  }
}
