import 'package:flutter/material.dart';
import 'package:flutter_app/pages/carrouselPage/carrousel_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 226, 245, 248)),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, CarrouselPage.routeName);
                    },
                    child: const Image(image: AssetImage('assets/logo.png'))),
                const Text(
                  "BokkouYon",
                  style: TextStyle(
                    color: Color.fromARGB(255, 40, 177, 255),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 40, 177, 255),
                    letterSpacing: 5,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
