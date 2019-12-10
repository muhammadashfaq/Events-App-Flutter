import 'package:flutter/material.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/styleguide.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  EventWidget({this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                event.imagePath,
                height: 160,
                fit: BoxFit.fitWidth,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                event.location,
                                style: eventLocationTextStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      event.duration,
                      style: eventLocationTextStyle.copyWith(
                          fontWeight: FontWeight.w900),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
