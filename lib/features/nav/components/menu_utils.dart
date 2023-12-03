import 'package:flutter/material.dart';
import 'package:fukuoka_flutter_fanclub/features/event/ui/event_page.dart';
import 'package:fukuoka_flutter_fanclub/features/game/ui/game_page.dart';
import 'package:fukuoka_flutter_fanclub/features/home/ui/home_page.dart';

enum MenuType {
  home,
  event,
  game;

  IconData get icon {
    switch (this) {
      // ユーザー用メニュー
      case MenuType.home:
        return Icons.home;
      case MenuType.event:
        return Icons.calendar_today;
      case MenuType.game:
        return Icons.sports_esports;
    }
  }

  String get label {
    switch (this) {
      case MenuType.home:
        return 'Home';
      case MenuType.event:
        return 'Event';
      case MenuType.game:
        return 'Game';
    }
  }

  String get path {
    switch (this) {
      case MenuType.home:
        return HomePage.routeName;
      case MenuType.event:
        return EventPage.routeName;
      case MenuType.game:
        return GamePage.routeName;
    }
  }
}
