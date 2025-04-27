import 'package:flutter/material.dart';

class CustomTripCard extends StatelessWidget {
  const CustomTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Image(image: AssetImage("assets/image/AbdeenPalace.jpg"),width: double.infinity,height: 200,fit: BoxFit.cover,),
            ListTile(
              title: Text("Abdeen Palace"),
              subtitle: Text("Cairo"),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_outlined,size: 40,)),
            )
          ],
        ),
      ),
    );
  }
}
