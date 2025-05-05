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
            const Image(image: AssetImage("assets/image/AbdeenPalace.jpg"),width: double.infinity,height: 200,fit: BoxFit.cover,),
            ListTile(
              title: const Text("Abdeen Palace"),
              subtitle: const Text("Cairo"),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_outlined,size: 40,)),
            )
          ],
        ),
      ),
    );
  }
}
