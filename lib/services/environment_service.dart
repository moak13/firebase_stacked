class EnvironmentService {
  static const String messagingId = String.fromEnvironment('MESSAGING_ID');
  static const String projectId = String.fromEnvironment('PROJECT_ID');
  static const String storageBucket = String.fromEnvironment('STORAGE_BUCKET');
  static const String androidApiKey = String.fromEnvironment('ANDROID_API_KEY');
  static const String androidAppId = String.fromEnvironment('ANDROID_APP_ID');
  static const String iosApiKey = String.fromEnvironment('IOS_API_KEY');
  static const String iosAppId = String.fromEnvironment('IOS_APP_ID');
  static const String dbUrl = String.fromEnvironment('DB_URL');
}
