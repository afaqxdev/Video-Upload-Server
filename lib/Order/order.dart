import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vahaninspect/valuation/Order/Orderview.dart';

class Ordermain extends StatefulWidget {
  const Ordermain({super.key});

  @override
  State<Ordermain> createState() => _OrdermainState();
}

class _OrdermainState extends State<Ordermain> {
  Future<void> openMapWithAddress(String address) async {
    // Encode the address for the URL
    final encodedAddress = Uri.encodeComponent(address);

    // Create the map URL with the encoded address
    final mapUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress');

    // Check if the URL can be launched
    if (await canLaunchUrl(mapUrl)) {
      await launchUrl(mapUrl);
    } else {
      throw 'Could not launch $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MH08FE2184'),
                        Text('Mahesh Kumar Vashney'),
                      ],
                    ),
                    SizedBox(width: 8), // Add some space between the columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Prio-High'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 15,
                              ),
                              Text('Pune, Maharastra'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                      child: const Text('Call'),
                      onPressed: () {},
                    )),
                    Expanded(
                        child: CupertinoButton(
                      child: const Text('Map'),
                      onPressed: () {
                        openMapWithAddress('pune, maharastra, India');
                      },
                    )),
                    Expanded(
                        child: CupertinoButton(
                      child: const Text('View'),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const OrderView();
                        }));
                      },
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MH08FE2184'),
                        Text('Mahesh Kumar Vashney'),
                      ],
                    ),
                    SizedBox(width: 8), // Add some space between the columns
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Prio-High'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.location_city,
                                size: 15,
                              ),
                              Text('Pune, Maharastra'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                      child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text('Call')),
                      onPressed: () {},
                    )),
                    Expanded(
                        child: CupertinoButton(
                      child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text('Map')),
                      onPressed: () {},
                    )),
                    Expanded(
                        child: CupertinoButton(
                      child: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Text('View')),
                      onPressed: () {},
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
