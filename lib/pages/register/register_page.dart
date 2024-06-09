import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/custom_form_field.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/core/models/register_model.dart';
import 'package:flutter_app/core/services/security_service.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomCompletController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();

  String errorText = "";
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "L'email est obligatoire";
                          }
                          // Regex for email validation
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Adresse email invalide ';
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
                            return 'Entrer un nom valid';
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
                            return 'Entrer un téléphone';
                          }
                          return null;
                        },
                      ),
                      CustomFormField(
                        controller: _passwordController,
                        icon: Icons.visibility_off_outlined,
                        obscureText: true,
                        hintText: 'Entrez votre mot de passe',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Entrer un mot de passe valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    //Formualaire valide
                                    //Prendre les valeurs et les mettre dans les controllers
                                    _formKey.currentState!.save();
                                    _registerModel = RegisterModel(
                                        username: _usernameController.text,
                                        password: _passwordController.text,
                                        nomComplet:
                                            _nomCompletController.text,
                                        telephone:
                                            _telephoneController.text);
                                    //Se connecter
                                    var user = await SecurityService.createPassager(
                                        _registerModel!);
                                    if (user != null) {
                                      //Création réussi
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, LoginPage.routeName);
                                    } else {
                                      //Erreur enregistrement
                                      setState(() {
                                        errorText =
                                            "Erreur d'enrégistrement !!!";
                                        SecurityService.connectedUser =
                                            null;
                                      });
                                    }
                                  };
                                },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'Continuez',
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
                                    color:
                                        secondaryColor, // Color for the clickable text
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = (){
                                      Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, LoginPage.routeName);
                                    }
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
