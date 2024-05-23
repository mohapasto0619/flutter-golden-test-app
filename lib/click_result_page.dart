import 'package:flutter/material.dart';

class ClickResultPage extends StatefulWidget {
  const ClickResultPage({super.key});

  @override
  State<ClickResultPage> createState() => _ClickResultPageState();
}

class _ClickResultPageState extends State<ClickResultPage> {
  bool _isConnected = false;

  void _authenticate() {
    setState(() {
      _isConnected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hello, please enter your informations."),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                key: Key('first_input'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                key: Key('2nd_input'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                key: const Key('form_button'),
                onPressed: _authenticate,
                child: const Text("Validate"),
              ),
              const SizedBox(
                height: 40,
              ),
              if (_isConnected)
                const Text(
                  'User successfully authenticated !',
                )
            ],
          ),
        ),
      ),
    );
  }
}
