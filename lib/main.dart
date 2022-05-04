import 'package:flutter/material.dart';
import 'package:flutter_api_demo/app.dart';
import 'package:flutter_api_demo/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const App(),
    ),
  );
}
