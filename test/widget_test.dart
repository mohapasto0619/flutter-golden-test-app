import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test_app/app.dart';
import 'package:golden_test_app/click_result_page.dart';
import 'package:golden_test_app/home_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('home page tests', () {
    //golden test from flutter libarry
    testWidgets('My home page', (WidgetTester tester) async {
      const testWidget = MaterialApp(
          home: MyHomePage(
        title: "Flutter",
      ));
      await tester.pumpWidget(testWidget);

      // Use the 'matchesGoldenFile' matcher to compare the rendered output.
      expect(find.byType(MyHomePage),
          matchesGoldenFile('golden_files/my_home_page.png'));
    });

    //golden test from golden tool kit library
    testGoldens(
      'My home page',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const MyHomePage(
              title: 'My Home Page',
            ),
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'my_home_page');
      },
    );

    testGoldens(
      'home page increment test by key',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'click me Once tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final finder = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('first_home_button')),
              );
              expect(finder, findsOneWidget);
              await tester.tap(finder);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'home_page_increment_by_key');
      },
    );

    testGoldens(
      'home page increment test by semnatic label',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'click me Once tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final firstButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.bySemanticsLabel('Click here'),
              );
              expect(firstButton, findsOneWidget);
              await tester.tap(firstButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
            tester, 'home_page_increment_by_sementic_label');
      },
    );

    testWidgets('is right value displayed on increment',
        (WidgetTester tester) async {
      const testWidget = MaterialApp(
          home: MyHomePage(
        title: "Flutter",
      ));

      await tester.pumpWidget(testWidget);
      final firstButton = find.byKey(const Key('first_home_button'));
      await tester.tap(firstButton);

      await tester.pump();
      final count = find.text('click count : 1');
      expect(count, findsOneWidget);
    });

    testGoldens(
      'home page increment twice test',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'click me twice tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final firstButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('first_home_button')),
              );
              expect(firstButton, findsOneWidget);
              await tester.tap(firstButton);
              await tester.tap(firstButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'home_page_increment_twice');
      },
    );

    testGoldens(
      'home page decremant test',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'No ! Click heree Once tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final secondButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('2nd_home_button')),
              );
              expect(secondButton, findsOneWidget);
              await tester.tap(secondButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'home_page_decrement');
      },
    );

    testGoldens(
      'home page decremant twice test',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'No ! Click heree twice tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final secondButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('2nd_home_button')),
              );
              expect(secondButton, findsOneWidget);
              await tester.tap(secondButton);
              await tester.tap(secondButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'home_page_decrement_twice');
      },
    );

    testGoldens(
      'home page reset test',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'tap Click here ! twice then here ! here ! Once tap',
            widget: const MyHomePage(
              title: 'Flutter',
            ),
            onCreate: (scenarioWidgetKey) async {
              final firstButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('first_home_button')),
              );
              final thirdButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('3rd_home_button')),
              );
              expect(firstButton, findsOneWidget);
              expect(thirdButton, findsOneWidget);
              await tester.tap(firstButton);
              await tester.tap(firstButton);
              await tester.tap(thirdButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'home_page_reset');
      },
    );
  });

  group('Click result page tests', () {
    testGoldens(
      'Click result page',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const ClickResultPage(),
            onCreate: (scenarioWidgetKey) async {
              final textField = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byType(TextField),
              );
              final button = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byType(ElevatedButton),
              );
              expect(textField, findsNWidgets(2));
              expect(button, findsOneWidget);
            },
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'click_result_page');
      },
    );

    testGoldens(
      'on authenticate',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            widget: const ClickResultPage(),
            onCreate: (scenarioWidgetKey) async {
              final firstTextFiled = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('first_input')),
              );
              final secondTextField = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('2nd_input')),
              );
              final button = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('form_button')),
              );
              await tester.enterText(firstTextFiled, "Paul Newman");
              await tester.enterText(secondTextField, "Azerty*123");
              await tester.tap(button);
            },
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'on_authenticate');
      },
    );
  });

  group('navigation tests', () {
    testGoldens(
      'navigate test',
      (tester) async {
        final builder = DeviceBuilder()
          ..addScenario(
            name: 'navigate',
            widget: const MyApp(),
            onCreate: (scenarioWidgetKey) async {
              final fourthButton = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byKey(const Key('4th_home_button')),
              );
              expect(fourthButton, findsOneWidget);
              await tester.tap(fourthButton);
            },
          );
        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'navigate_to_click_result');
      },
    );

    testWidgets('navigate, content test', (WidgetTester tester) async {
      const testWidget = MaterialApp(
        home: MyApp(),
      );

      await tester.pumpWidget(testWidget);
      final myHomePage = find.byType(MyHomePage);
      expect(myHomePage, findsOneWidget);
      final fourthButton = find.byKey(const Key('4th_home_button'));
      await tester.tap(fourthButton);

      await tester.pumpAndSettle();
      final clickResultPage = find.byType(ClickResultPage);
      expect(clickResultPage, findsOneWidget);
    });
  });
}
