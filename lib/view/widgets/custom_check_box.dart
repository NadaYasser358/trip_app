import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key,
      required this.checker,
      required this.changed,
      required this.title});
  final bool checker;
  final Function(bool?) changed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
      child: CheckboxListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        value: checker,
        onChanged: changed,
        activeColor: Colors.blue,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: checker ? Colors.blue : Colors.white),
            borderRadius: BorderRadius.circular(25.r)),
        tileColor:checker? Colors.blue.shade50 : Colors.white,
      ),
    );
  }
}
