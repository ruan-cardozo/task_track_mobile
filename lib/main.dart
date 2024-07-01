import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_track/src/provider/theme_provider.dart';
import 'package:task_track/src/views/Login/login_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeNotifier.currentTheme,
          home: const MyLoginPage(title: 'Página de login'),
        );
      },
    );
  }
}
