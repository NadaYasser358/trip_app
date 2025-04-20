import 'package:flutter/material.dart';
import 'package:graduation/app_constants/app_styles.dart';
import 'package:graduation/model_view/trip_request_provider.dart';

class Destination extends StatefulWidget {
  Destination({super.key, required this.provider});
  final TripRequestProvider provider;
  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  final List<String> governorates = ["Cairo", "Giza", "Alexandria"];
  String selectedGov = "Cairo";
  String selectedZone = "Maadi";
  late final int? zoneId;
  late final int? govId;
  final List<String> cairoZones = [
    "Nasr City",
    "New Cairo",
    "El Hussein",
    "Maadi",
    "Downtown",
    "Zamalek",
    "Heliopolis",
    "Rehab",
    "Madinaty",
    "Garden City",
    "Corniche",
    "Shubra",
    "Cairo"
  ];

  final List<String> gizaZones = [];

  final List<String> alexZones = [];

  final Map<String, List<String>> govZones = {
    "Cairo": [
      "Nasr City",
      "New Cairo",
      "El Hussein",
      "Maadi",
      "Downtown",
      "Zamalek",
      "Heliopolis",
      "Rehab",
      "Madinaty",
      "Garden City",
      "Corniche",
      "Shubra",
      "Cairo"
    ],
    "Giza": [],
    "Alexandria": []
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Where to?!",
          style: AppTextStyles.interestTitleStyle,
        ),
        DropdownButtonFormField<String>(
          padding: EdgeInsets.all(10),
          value: selectedGov,
          items: governorates
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedGov = value!;
              govId = governorates.indexOf(selectedGov) + 1;
              widget.provider.tripRequest.governorateId = govId;
            });
          },
          decoration: InputDecoration(labelText: "Select a governorate"),
        ),
        DropdownButtonFormField<String>(
          value: selectedZone,
          items: (govZones[selectedGov])?.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedZone = value!;
            });
            zoneId = govZones[selectedGov]!.indexOf(selectedZone) + 1;
            widget.provider.tripRequest.zoneId = zoneId;

            print(
                "gov $selectedGov govId $govId zone $selectedZone zoneId $zoneId");
          },
          decoration: InputDecoration(labelText: 'Choose a zone'),
        )
      ],
    );
  }
}
