import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/custom_form_field.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/core/models/register_model.dart';
import 'package:flutter_app/pages/login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String routeName = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passworController = TextEditingController();
  final TextEditingController _nomCompletController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  String errorText = "";
  bool _rememberMe = false;
  RegisterModel? _registerModel;

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
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/register.png'),
                        height: 150,
                        width: 200,
                      ),
                      const Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 35,
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
                      if (errorText.isNotEmpty) ...[
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: Text(
                            errorText,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 15),
                          ),
                        ),
                      ],
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                        controller: _usernameController,
                        icon: Icons.email_outlined,
                        hintText: 'Entrez votre email/username',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        controller: _nomCompletController,
                        icon: Icons.person,
                        hintText: 'Entrez votre nom complet',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        controller: _telephoneController,
                        icon: Icons.phone_android_outlined,
                        hintText: 'Entrez votre telephone',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        controller: _passworController,
                        icon: Icons.visibility_off_outlined,
                        obscureText: true,
                        hintText: 'Entrez votre mot de passe',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Enter valid name';
                          }
                          return null;
                        },
                      ),
                      
                    const SizedBox(
                        height: 40,
                      ),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, LoginPage.routeName);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Text('Continuez', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 22, 
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 30,
                    ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Vous êtes déjà inscrit? ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                color: Colors.black, // Default text color
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Connectez-vous',
                                  style: const TextStyle(
                                    color: secondaryColor, // Color for the clickable text
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                  ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  print('Connectez-vous tapped');
                                },
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
        ));
  }
}
