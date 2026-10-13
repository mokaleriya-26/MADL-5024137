import 'package:flutter_test/flutter_test.dart';
import 'package:task_10/main.dart';

void main() {
  testWidgets('Expense Tracker loads', (WidgetTester tester) async {
    await tester.pumpWidget(const ExpenseTrackerApp());

    expect(find.text('Expense Tracker'), findsOneWidget);
    expect(find.text('Recent Expenses'), findsOneWidget);
  });
}