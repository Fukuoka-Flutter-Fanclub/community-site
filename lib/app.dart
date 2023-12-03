import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fukuoka_flutter_fanclub/core/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flavors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: F.title,
      debugShowCheckedModeBanner: F.isDev,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("ja")],
      locale: const Locale('ja', 'JP'),
    );
  }
}
