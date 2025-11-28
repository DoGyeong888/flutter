import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/config/app_config.dart';

void main() {
  const environment = String.fromEnvironment('APP_ENV', defaultValue: 'dev');
  const config = AppConfig.fromEnvironment(environment);

  runApp(const MyApp(config: config));
}
