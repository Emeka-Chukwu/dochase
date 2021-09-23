import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/src/model/events.dart';
import 'package:mobile/src/repositories/http_resquest_class.dart';

class EventsGet extends GetxController {
  RequestsCalls calls = RequestsCalls();
  EventModel eventsList = EventModel(data: [
    Data(
      id: "ll",
      title: "title",
      body: "body",
      approved: 3,
      registered: 10,
      createdAt: "u",
      updatedAt: "updatedAt",
    ),
    Data(
      id: "ll",
      title: "title",
      body: "body",
      approved: 3,
      registered: 10,
      createdAt: "u",
      updatedAt: "updatedAt",
    ),
    Data(
      id: "ll",
      title: "title",
      body: "body",
      approved: 3,
      registered: 10,
      createdAt: "u",
      updatedAt: "updatedAt",
    )
  ], message: 'Success', success: true);

  void getEventList() async {
    final events = await calls.get("events");
    final Map<String, dynamic> data = json.decode(events.body);
    eventsList = EventModel.fromJson(data);
    update();
  }
}
