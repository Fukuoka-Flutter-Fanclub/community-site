import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  static String routeName = '/game';

  const GamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Game Page'),
      ),
    );
  }
}
