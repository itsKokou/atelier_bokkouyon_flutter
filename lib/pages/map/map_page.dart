import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  static String routeName = "/mapPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [Container()],
      )),
    );
  }
}
