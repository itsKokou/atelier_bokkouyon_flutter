import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/core/constants/font_constants.dart';
import 'package:flutter_app/pages/payement/Payement_operateur_page.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  static String routeName = "/accueil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/map.png"),
                  fit: BoxFit.cover,
                  opacity: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // premier div On
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // colonne 1 on
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Choisir",
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 40,
                                fontFamily: police),
                          )
                        ],
                      ),
                      // colonne 1 off

                      // colonne 2 on
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: const BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  )),
                              child: const Text(" "),
                            ),
                          )
                        ],
                      )
                      // colonne 2 off
                    ],
                  ),
                  // premier div off
                  const SizedBox(height: 30),
                  // deuxiem div on
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, PayementOperateur.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 153, 197, 227),
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image on
                              Image.asset(
                                "assets/accueil1.png",
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              // image off
                              // Text on
                              const Text(
                                "Conducteur",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: police,
                                    color: primaryColor),
                              )
                              // Text off
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // deuxiem div off

                  const SizedBox(height: 30),
                  // troisieme div on
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 153, 197, 227),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                        child: Text("OR",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))),
                  ),
                  // troisieme div off

                  const SizedBox(height: 20),
                  // quatrieme div on
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, PayementOperateur.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 189, 238),
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image on
                              Image.asset(
                                "assets/accueil2.png",
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                              // image off
                              // Text on
                              const Text(
                                "Passager",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: police,
                                    color: primaryColor),
                              )
                              // Text off
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // quatrieme div off
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
