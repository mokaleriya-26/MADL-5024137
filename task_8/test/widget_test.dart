import 'package:flutter_test/flutter_test.dart';
import 'package:task_8/main.dart';

void main() {
  testWidgets(
    'File Handling App loads successfully',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const FileHandlingApp(),
      );

      expect(
        find.text('Flutter File Handling'),
        findsOneWidget,
      );
    },
  );
}