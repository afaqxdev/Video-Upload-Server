// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neonpen/neonpen.dart';
import 'package:vahaninspect/utils/theemColor.dart';
import 'package:vahaninspect/valuation/Order/task/backimage.dart';
import 'package:vahaninspect/valuation/Order/task/frontimage.dart';
import 'package:vahaninspect/valuation/Order/task/video.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            AppColors.primaryColor, // Set the background color of the AppBar
        title: const Text('Vahan Inspect - Order'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications), // Notification icon
            onPressed: () {
              // Handle notification icon press here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
              child: Neonpen(
                text: const Text(
                  'Case Number #123457845',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: const Color.fromARGB(255, 226, 10, 10),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                opacity: 0.3,
                emphasisWidth: 10,
                emphasisOpacity: 0.3,
                emphasisAngleDegree: 2,
                enableLineZiggle: true,
                lineZiggleLevel: 2,
                isDoubleLayer: false,
              ),
            ),
            const Row(
              children: [
                FaIcon(FontAwesomeIcons.building, size: 15),
                Text('Bank, Chola Finance'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.car,
                  size: 15,
                ),
                Text('Plate, MH 05 2568'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.person,
                  size: 15,
                ),
                Text('Owner Name, MH 05 2568'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Neonpen(
                text: const Text(
                  'Start taking photose or video',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: const Color.fromARGB(255, 250, 12, 12),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                opacity: 0.3,
                emphasisWidth: 8,
                emphasisOpacity: 0.1,
                emphasisAngleDegree: 0.8,
                enableLineZiggle: true,
                lineZiggleLevel: 1,
                isDoubleLayer: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Expanded(child: Frontimage()),
                Expanded(child: Backimage()),
              ],
            ),
              const Row(
              children: [
                Expanded(child: Frontimage()),
                Expanded(child: SizedBox(
                  width: 200,
                  height: 380,
                  child: VideoUploadScreen())),
              ],
            )
          ],
        ),
      ),
    );
  }
}
