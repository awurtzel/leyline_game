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

        await tester.tap(find.widgetWithText(FlatButton, "Reset"));
        await tester.pump();

        expect(callbackTriggered, isTrue);
    });
}
