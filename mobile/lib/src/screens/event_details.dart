import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/src/cores/cores.dart';
import 'package:mobile/src/model/events.dart';
import 'package:mobile/src/screens/scann_screen.dart';
import 'package:mobile/src/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EventsDetailsScreen extends StatelessWidget {
  final Data data;

  const EventsDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(50),
              Text(data.title),
              YMargin(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Total Registered Users"),
                      XMargin(10),
                      Text(data.registered.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Text("Checked In Users"),
                      XMargin(10),
                      Text(data.approved.toString())
                    ],
                  )
                ],
              ),
              YMargin(20),
              Text(data.body),
              YMargin(100),
              ButtonComp(
                title: "Check-In",
                onTap: () {
                  Get.to(ScanScreenWidget());
                },
                height: 40,
                width: 90,
                color: AppColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
