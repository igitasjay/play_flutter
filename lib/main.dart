import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:play/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: Consumer(builder: (context, themeProvider, child) {
        return AdaptiveTheme(
            light: appTheme(Brightness.light),
            dark: appTheme(Brightness.dark),
            initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
            builder: (theme, darkTheme) {
              return MaterialApp(
                theme: theme,
                darkTheme: darkTheme,
                home: OnboardingScreen(),
              );
            });
      }),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Placeholder());
  }
}
