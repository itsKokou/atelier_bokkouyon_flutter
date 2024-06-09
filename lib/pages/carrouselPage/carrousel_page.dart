import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/pages/activeLocalisation/active_localisation.dart';
import 'package:flutter_app/pages/register/register_page.dart';

class CarrouselPage extends StatelessWidget {
  const CarrouselPage({super.key});
  static String routeName = "/carrousel-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
          ),
          items: [1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: const AssetImage('assets/carrousel1.png'),
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Trouver une voiture",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 35,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Center(
                          child: Text(
                            "Un chauffeur à proximité vient vous chercher",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: thirdColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, ActiveLocalisation.routeName);
                        },
                        child: const Text(
                          "Skip",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            letterSpacing: 2,
                          ),
                        ),
                      )
                    ],
                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 5.0),
                );
              },
            );
          }).toList(),
        ));
  }
}
