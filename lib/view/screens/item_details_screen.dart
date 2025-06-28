import 'package:flutter/material.dart';
import 'package:graduation/model/data_models/accommodation.dart';
import 'package:graduation/model/data_models/entertainment.dart';
import 'package:graduation/model/data_models/restaurant.dart';
import 'package:graduation/model/data_models/tourism_area.dart';
import 'package:graduation/model/data_models/trip_item.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key, required this.item});
  final TripItem item;
  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Builder(
        builder: (context) {
          final item = widget.item;
          // You can build your UI here using 'item'
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.imageUrl != null)
                  Image.network(item.imageUrl!,
                      fit: BoxFit.cover, height: 200, width: double.infinity),
                Text(item.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(item.description, style: const TextStyle(fontSize: 16)),
                if (item is Accommodation)
                  Column(
                    children: [
                      _infoRow("Accommodaion type", item.accomodationType),
                      _infoRow("Number of Beds", item.numOfBeds.toString()),
                      _infoRow("Bed Status", item.bedStatus),
                      _infoRow(
                          "Number of Persons", item.numOfPersons.toString()),
                    ],
                  ),
                if (item is Restaurant)
                  _infoRow('Food Category', item.foodCategory),
                if (item is Entertainment)
                  _infoRow('Entertainment Type', item.entertainmentType),
                if (item is TourismArea)
                  _infoRow('Tourism Area Type', item.tourismType),
                const SizedBox(height: 16),
                _infoRow('Class Type', item.classType),
                _infoRow('Zone', item.zone),
                _infoRow('Governorate', item.governorate),
                _infoRow('Rating', item.rating.toString()),
                _infoRow('Average Price per Adult',
                    item.averagePricePerAdult.toString()),
                _infoRow('Has Kids Area', item.hasKidsArea.toString()),
                _infoRow('Address', item.address),
                SizedBox(height: 16),
                if (item.mapLink != null)
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          // Handle map link navigation
                          final Uri url = Uri.parse(item.mapLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Could not launch map')),
                            );
                          }
                        },
                        child: const Text('View on Map')),
                  ),
                SizedBox(height: 16),
                if (item.contactLink != null)
                  Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          // Handle map link navigation
                          final Uri url = Uri.parse(item.contactLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Could not launch map')),
                            );
                          }
                        },
                        child: const Text('contact us')),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.brown, fontWeight: FontWeight.w500)),
          Flexible(
            child: Text(value,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
