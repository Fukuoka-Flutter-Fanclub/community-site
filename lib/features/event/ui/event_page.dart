import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  static String routeName = '/event';

  const EventPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Event Page'),
      ),
    );
  }
}
