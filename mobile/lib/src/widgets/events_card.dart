import 'package:flutter/material.dart';
import 'package:mobile/src/model/events.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({Key? key, required this.event, required this.onTap})
      : super(key: key);
  final Data event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        child: Text(
          event.title,
          style: TextStyle(),
        ),
      ),
    );
  }
}
