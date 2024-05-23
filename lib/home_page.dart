import 'package:flutter/material.dart';

import 'click_result_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter = _counter - 1;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'click count : $_counter',
              key: const Key('result_text'),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              key: const Key('first_home_button'),
              onPressed: _incrementCounter,
              child: const Text("Click here"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: const Key('2nd_home_button'),
              onPressed: _decrementCounter,
              child: const Text("No ! Click heree"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: const Key('3rd_home_button'),
              onPressed: _resetCounter,
              child: const Text("here ! here !"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              key: const Key('4th_home_button'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClickResultPage(
                            key: Key('click_result_page'),
                          )),
                );
              },
              child: const Text("don't click "),
            )
          ],
        ),
      ),
    );
  }
}
