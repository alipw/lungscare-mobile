import 'package:flutter/material.dart';

class loadingView extends StatelessWidget {
  const loadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
