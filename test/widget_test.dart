import 'package:flutter_test/flutter_test.dart';
import 'package:give_hope/main.dart';

void main() {
  testWidgets('GiveHope app smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const GiveHopeApp());

    // Verify the splash screen loads
    expect(find.text('GiveHope'), findsOneWidget);
  });
}
