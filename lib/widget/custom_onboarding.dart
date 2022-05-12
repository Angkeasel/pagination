import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOnBoarding extends StatelessWidget {
  const CustomOnBoarding({Key? key, this.title, this.subTitle, this.url})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('$url'),
              const SizedBox(height: 80),
              Text(
                "$title",
                style: const TextStyle(
                    color: Color(0xff2B2F7E),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "$subTitle",
                style: TextStyle(
                    color: Colors.indigo.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
