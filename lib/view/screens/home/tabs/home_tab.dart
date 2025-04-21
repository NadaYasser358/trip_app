import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image(image: AssetImage("assets/imges/egypt.jpeg")),
          TextField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.search),border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide(color: Colors.white))),

          )
        ],
      ),
    );
  }
}
