import 'package:advertech_task/ui/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Fields testing', () {
    testWidgets('Name field validation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));
      final sendButton = find.text('Send');

      await tester.enterText(find.byKey(const Key('name_field')), 'abc');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid name'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('name_field')), 'Ladon Skliarov');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid name'), findsNothing);

      await tester.pumpAndSettle();
    });

    testWidgets('Email field validation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));
      final sendButton = find.text('Send');

      await tester.enterText(find.byKey(const Key('email_field')), ' ');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('email_field')), 'ladon');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('email_field')),
          'ladonskliarov@gmail.com');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid email address'), findsNothing);

      await tester.pumpAndSettle();
    });

    testWidgets('Message field validation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ContactPage()));
      final sendButton = find.text('Send');

      await tester.enterText(find.byKey(const Key('message_field')), 'Short');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid message'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('message_field')), 'Valid message');
      await tester.tap(sendButton);
      await tester.pump();

      expect(find.text('Please enter a valid message'), findsNothing);

      await tester.pumpAndSettle();
    });
  });
}
