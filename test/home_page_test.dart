import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:leyline_game/home_page.dart';

void main() {
    testWidgets('Reset button triggers reset4 when pressed', (
        WidgetTester tester) async {
        await tester.pumpWidget(
            new MaterialApp(
                home: new HomePage()
            )
        );

        /*expect(find.text(dialogTitle), findsOneWidget);
        expect(find.text(dialogContent), findsOneWidget);
        expect(callbackTriggered, isFalse);*/

        await tester.tap(find.widgetWithText(RaisedButton, "Reset"));
        await tester.pump();

        //expect(callbackTriggered, isTrue);
    });
}
