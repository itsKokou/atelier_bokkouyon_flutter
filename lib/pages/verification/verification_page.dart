import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/core/constants/font_constants.dart';
import 'package:flutter_app/pages/accueil/accueil_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});
  static String routeName = "/verification";

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: double.infinity,
          width: double.infinity,
          // decoration:
          //     const BoxDecoration(color: Color.fromARGB(255, 226, 245, 248)),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/verification.png'),
                    height: 200,
                    width: 250,
                  ),
                  const Text(
                    "Vérification",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 40,
                      letterSpacing: 1,
                    ),
                  ),
                  Container(
                    height: 5,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        )),
                    child: const Text(''),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Un code vous a été envoyé par sms',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: police,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromARGB(255, 124, 121, 121)),
                  ),
                  if (errorText.isNotEmpty) ...[
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        errorText,
                        style: const TextStyle(color: Colors.red, fontSize: 15),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: 
                        PinCodeTextField(
                          appContext: context,
                          length: 4,
                          onChanged: (value) {},
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.underline,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            selectedColor: Colors.blue,
                          ),
                        ),
                    )
                    ),

                  const SizedBox(
                    height: 40,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AccueilPage.routeName);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Vérifier',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AccueilPage.routeName);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text(
                        'Renvoyer le code',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Besoin d'aide? ",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            color: Colors.black, // Default text color
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Contactez-nous',
                              style: const TextStyle(
                                color:
                                    secondaryColor, // Color for the clickable text
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
