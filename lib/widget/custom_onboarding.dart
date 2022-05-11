import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text("Original Product"),
          Text(
            "Original with 1000 product from a lot of  different brand accros the world. buy so easy with just simple step then your item will send it.",
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
