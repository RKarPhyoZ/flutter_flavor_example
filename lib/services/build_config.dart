class FlavorSettings {
  final String apiBaseUrl;

  FlavorSettings.development()
      : apiBaseUrl = 'https://dev.flutter-flavors.chwe.at';

  FlavorSettings.production() : apiBaseUrl = 'https://flutter-flavors.chwe.at';

  FlavorSettings.staging()
      : apiBaseUrl = 'https://staging.flutter-flavors.chwe.at';
}

Future<FlavorSettings> getFlavorSettings() async {
  const String? appFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR') != ''
      ? String.fromEnvironment('FLUTTER_APP_FLAVOR')
      : null;
  if (appFlavor == 'development') {
    return FlavorSettings.development();
  } else if (appFlavor == 'staging') {
    return FlavorSettings.staging();
  } else if (appFlavor == 'production') {
    return FlavorSettings.production();
  }
  return FlavorSettings.development();
}
