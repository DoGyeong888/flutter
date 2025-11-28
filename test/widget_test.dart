import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ready_flutter_template/src/app.dart';
import 'package:ready_flutter_template/src/config/app_config.dart';

void main() {
  testWidgets('Home screen shows tappable counter', (WidgetTester tester) async {
    const config = AppConfig.fromEnvironment('dev');
    await tester.pumpWidget(const MyApp(config: config));

    expect(find.textContaining('Times tapped'), findsOneWidget);
    expect(find.text('Times tapped: 0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.touch_app));
    await tester.pump();

    expect(find.text('Times tapped: 1'), findsOneWidget);
  });
}
