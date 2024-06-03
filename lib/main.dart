import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'navigation/navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter aviasales app',
      //here we use Themes for all app
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        // useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const NavigationPage(),
    );
  }
}
