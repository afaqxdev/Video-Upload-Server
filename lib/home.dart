
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:vahaninspect/utils/theemColor.dart';
import 'package:vahaninspect/valuation/homevaluation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<String> _selectedSegment = ValueNotifier('all');
  void _onSegmentChanged(String newValue) {
    _selectedSegment.value = newValue;
  }

  var pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            AppColors.primaryColor, // Set the background color of the AppBar
        title: const Text('Vahan Inspect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Notification icon
            onPressed: () {
              // Handle notification icon press here
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors
                    .primaryColor, // Set the background color of the DrawerHeader
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: ListView(children: [
        Center(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Welcome to the Vahan Inspect',
                  style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeValuation()),
                );
              },
              child: Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 253, 24, 24),
                      Color.fromARGB(255, 244, 179, 15)
                    ], // Replace with your desired colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 91, 91,
                        91), // Replace with your desired border color
                    width: 2.0, // Adjust the border width as needed
                  ),
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'images/car002.png',
                      height: 150,
                      width: 150,
                    ),
                    const Center(
                      child: Text(
                        'Valuation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 300.0,
                height: 200.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 253, 24, 24),
                      Color.fromARGB(255, 249, 249, 249)
                    ], // Replace with your desired colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 91, 91,
                        91), // Replace with your desired border color
                    width: 2.0, // Adjust the border width as needed
                  ),
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('images/car001.png', height: 150),
                      const Text(
                        'Preinspection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            // Row(
            //   children: [
            //     SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Scrollbar(
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //           child: ToggleSwitch(
            //             customWidths: [120.0, 110.0, 105.0],
            //             cornerRadius: 0.0,
            //             activeBgColors: const [
            //               [Colors.green],
            //               [Colors.redAccent],
            //               [Colors.blue]
            //             ],
            //             activeFgColor: Colors.white,
            //             inactiveBgColor: Colors.grey,
            //             inactiveFgColor: Colors.white,
            //             labels: const ['Order', 'Notification', 'Offline'],
            //             initialLabelIndex: pageIndex,
            //             onToggle: (index) {
            //               log('switched to: $index');
            //               if (index != null) {
            //                 setState(() {
            //                   pageIndex = index;
            //                 });
            //               }
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // ListView(
            //   scrollDirection:Axis.vertical,
            //   shrinkWrap: true,
            //   children: [
            //     pageIndex == 0
            //         ? Ordermain()
            //         : pageIndex == 1
            //             ? Container(
            //                 child: Text('Notification'),
            //               )
            //             : pageIndex == 2
            //                 ? Container(
            //                     child: Text('Offline'),
            //                   )
            //                 : Container(
            //                     child: Text('Select tab'),
            //                   ),
            //   ],
            // )
          ],
        )),
      ]),
    );
  }
}
