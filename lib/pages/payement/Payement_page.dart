import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants/color_constants.dart';
import 'package:flutter_app/pages/accueil/accueil_page.dart';

class PayementPage extends StatefulWidget {
  const PayementPage({super.key});
  static String routeName = "/payementPage";

  @override
  State<PayementPage> createState() => _PayementPageState();
}

class _PayementPageState extends State<PayementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            // 1er div on
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "km parcouru : 50km",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "prix : 2500fr",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Container(height: 200, child: Image.asset("assets/OM.png")),
                    Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: secondaryColor,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            "confirmé",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ))
            // 1er div off
          ],
        )),
      ),
    );
  }
}
