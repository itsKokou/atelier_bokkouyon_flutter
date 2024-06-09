import 'package:flutter/material.dart';
import 'package:flutter_app/pages/accueil/accueil_page.dart';
import 'package:flutter_app/pages/activeLocalisation/active_localisation.dart';
import 'package:flutter_app/pages/carrouselPage/carrousel_page.dart';
import 'package:flutter_app/pages/home/home_page.dart';
import 'package:flutter_app/pages/login/login_page.dart';
import 'package:flutter_app/pages/register/register_page.dart';
import 'package:flutter_app/pages/verification/verification_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const HomePage(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/carrousel-page": (context) => const CarrouselPage(),
        "/register": (context) => const RegisterPage(),
        "/active-localisation": (context) => const ActiveLocalisation(),
        "/login": (context) => const LoginPage(),
        "/accueil": (context) => const AccueilPage(),
        "/verification": (context) => const VerificationPage(),
      },
    );
  }
}
