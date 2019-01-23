// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leyline_game/custom_dialog.dart';

void main() {
    testWidgets('Reset button triggers callback when pressed', (
        WidgetTester tester) async {
        var dialogTitle = "Test";
        var dialogContent = "Test Content";
        var callbackTriggered = false;
        var callback = () => callbackTriggered = true;

        await tester.pumpWidget(
            new MaterialApp(
                home: new CustomDialog(dialogTitle, dialogContent, callback)
            )
        );

        expect(find.text(dialogTitle), findsOneWidget);
        expect(find.text(dialogContent), findsOneWidget);
        expect(callbackTriggered, isFalse);

        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.widgetWithText(FlatButton, "Reset"));
        await tester.pump();

        expect(callbackTriggered, isTrue);
    });
}
