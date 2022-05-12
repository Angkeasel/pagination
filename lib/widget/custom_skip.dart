import 'package:flutter/material.dart';

class CustomSkip extends StatelessWidget {
  const CustomSkip({Key? key, this.onTapback, this.child, this.onTapForward})
      : super(key: key);
  final GestureTapCallback? onTapback;
  final GestureTapCallback? onTapForward;

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTapback,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 1)),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Container(
          child: child,
        ),
      ],
    );
  }
}
