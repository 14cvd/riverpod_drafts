import 'package:flutter/material.dart';
import 'package:flutter_application_3/screen/mainScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
