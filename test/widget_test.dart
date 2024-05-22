import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_test_app/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
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
    'Click result page',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const ClickResultPage(),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'click_result_page');
    },
  );

  testGoldens(
    'Click result page increment test by key',
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

      await screenMatchesGolden(tester, 'click_result_page_increment_by_key');
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
    'Click result page increment test by semnatic label',
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
          tester, 'click_result_page_increment_by_sementic_label');
    },
  );

  testGoldens(
    'Click result page increment twice test',
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

      await screenMatchesGolden(tester, 'click_result_page_increment_twice');
    },
  );

  testGoldens(
    'Click result page decremant test',
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

      await screenMatchesGolden(tester, 'click_result_page_decrement');
    },
  );

  testGoldens(
    'Click result page decremant twice test',
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

      await screenMatchesGolden(tester, 'click_result_page_decrement_twice');
    },
  );

  testGoldens(
    'Click result page reset test',
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

      await screenMatchesGolden(tester, 'click_result_page_reset');
    },
  );

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
}
