import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/ui/event_details/event_detail_background.dart';
import 'package:local_events/ui/event_details/event_detail_content.dart';
import 'package:provider/provider.dart';


class EventDetail extends StatelessWidget {


  final Event event;
  EventDetail({ this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: <Widget>[
            EventDetailBackground(),
            EventDetailContent()
          ],
        ),
      ),
    );
  }
}

