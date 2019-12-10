import 'package:flutter/material.dart';
import 'package:local_events/app_state.dart';
import 'package:local_events/model/category.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/styleguide.dart';
import 'package:local_events/ui/event_details/event_detail_page.dart';
import 'package:local_events/ui/homepage/category_widget.dart';
import 'package:local_events/ui/homepage/event_widget.dart';
import 'package:local_events/ui/homepage/home_page_background.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 56,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Local Events',
                          style: fadedTextStyle,
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_outline,
                          size: 30,
                          color: Color(0x99FFFFFF),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'Whats Up',
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Consumer<AppState>(
                      builder: (context, appState, _) =>
                          SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (final category in categories)
                              CategoryWidget(category: category)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Consumer<AppState>(
                    builder: (context, appState, _) => Column(
                      children: <Widget>[
                        for (final event in events.where((e) => e.categoryIds
                            .contains(appState.selectedCategory)))
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EventDetail(event: event)
                              ));
                            },
                            child: EventWidget(
                              event: event,
                            ),
                          )
                      ],
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
