import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/pages/register/register_page.dart';

class ActiveLocalisation extends StatelessWidget {
  const ActiveLocalisation({super.key});
  static String routeName = "/active-localisation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/activelocalisation.png'),
                  // width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Activer votre géolocalisation",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      "Activer votre geolocalisation pour trouver des voitures autours de vous.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: thirdColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      'Activer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, RegisterPage.routeName);
                  },
                  child: const Text(
                    "Sauter cette étape",
                    style: const TextStyle(
                      color: thirdColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ))
        // margin: EdgeInsets.symmetric(horizontal: 5.0),
        );
  }
}
