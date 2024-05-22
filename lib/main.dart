import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        key: Key('home_page'),
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

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

class ClickResultPage extends StatelessWidget {
  const ClickResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Hello, thanks for clicking !")],
        ),
      ),
    );
  }
}
