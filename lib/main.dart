// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:sec/pages/onboarding_form_page.dart';
import 'package:sec/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sec/pages/onboarding_form_page.dart';
import 'package:sec/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isOnboardingComplete = prefs.getBool('isOnboardingComplete') ?? false;

  runApp(MyApp(isOnboardingComplete: isOnboardingComplete));
}

class MyApp extends StatelessWidget {
  final bool isOnboardingComplete;

  MyApp({Key? key, required this.isOnboardingComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Empowerment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(
            0, 
            16, 
            247, 
            1,
          ),
        ),
        useMaterial3: true,
      ),
      home: isOnboardingComplete ? OnboardingPage() : OnboardingFormPage(),
    );
  }
}
