import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/components/custom_form_field.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/core/models/login_model.dart';
import 'package:flutter_app/core/services/security_service.dart';
import 'package:flutter_app/pages/accueil/accueil_page.dart';
import 'package:flutter_app/pages/register/register_page.dart';
import 'package:flutter_app/pages/verification/verification_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String errorText = "";
  LoginModel? _loginModel;

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
                        image: AssetImage('assets/login.png'),
                        height: 200,
                        width: 250,
                      ),
                      const Text(
                        "Se connecter",
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
                        height: 20,
                      ),
                      CustomFormField(
                        controller: _usernameController,
                        icon: Icons.email_outlined,
                        hintText: 'Entrez votre email/username',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Entrer un email valide';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomFormField(
                        controller: _passwordController,
                        icon: Icons.visibility_off_outlined,
                        obscureText: true,
                        hintText: 'Entrez votre mot de passe',
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Entrer votre mot de passe';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Mot de passe oublié?",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      InkWell(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            //Formualaire valide
                            //Prendre les valeurs et les mettre dans les controllers
                            _formKey.currentState!.save();
                            LoginModel loginModel = LoginModel(
                                username: _usernameController.text,
                                password: _passwordController.text);
                            //Se connecter
                            
                            await SecurityService.getConnectedUser(loginModel);
                            if (SecurityService.connectedUser != null) {
                              //Connexion réussi
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, AccueilPage.routeName);
                            } else {
                              //echec connexion
                              setState(() {
                                //Pour lui dire qu'il y a un changement
                                errorText = "Login ou mot de passe incorrect";
                              });
                            }
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Text(
                            'Se connecter',
                            style: TextStyle(
                                color: Colors.white,
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
                              text: 'Pas de compte? ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                color: Colors.black, // Default text color
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Inscrivez-vous',
                                  style: const TextStyle(
                                    color:
                                        secondaryColor, // Color for the clickable text
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 17,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, RegisterPage.routeName);
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
