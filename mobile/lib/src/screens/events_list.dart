import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/src/controllers/admin.dart';
import 'package:mobile/src/controllers/events.dart';
import 'package:mobile/src/cores/cores.dart';
import 'package:mobile/src/screens/event_details.dart';
import 'package:mobile/src/widgets/button.dart';
import 'package:mobile/src/widgets/events_card.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final event = Get.put(EventsGet());
  final admin = Get.find<AdminRole>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event.getEventList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(30),
              Align(
                alignment: Alignment.centerRight,
                child: ButtonComp(
                  title: "Logout",
                  onTap: () {
                    admin.logoutAdmin(context);
                  },
                  height: 30,
                  width: 30,
                  color: AppColor.red,
                ),
              ),
              YMargin(20),
              Text(
                "Events",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              YMargin(30),
              GetBuilder<EventsGet>(
                  builder: (_) => Column(
                        children: _.eventsList.data
                            .map((e) => EventsCard(
                                event: e,
                                onTap: () {
                                  Get.to(EventsDetailsScreen(
                                    data: e,
                                  ));
                                }))
                            .toList(),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
