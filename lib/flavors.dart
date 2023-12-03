enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isDev => appFlavor == Flavor.dev;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Fukuoka_Flutter_Fanclub_dev';
      case Flavor.prod:
        return 'Fukuoka_Flutter_Fanclub';
      default:
        return 'title';
    }
  }
}
