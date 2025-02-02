import 'package:flutter_dotenv/flutter_dotenv.dart';

String get baseUrl => dotenv.env['BASE_URL']!;

class NetworkConfig {
  static String BASE_URL = baseUrl;
}
