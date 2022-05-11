import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListItemShimmer extends StatelessWidget {
  const CustomListItemShimmer({Key? key, this.height, this.width, this.color})
      : super(key: key);
  final double? height;
  final double? width;
  final Color? color;
  Widget cart() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      // child: Column(
      //   children: [
      //     Container(width: width, height: height, color: Colors.black),
      //     Container(width: width, height: height, color: Colors.black),
      //     Container(width: width, height: height, color: Colors.black),
      //     Container(width: width, height: height, color: Colors.black),
      //   ],
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: color!, highlightColor: Colors.grey[300]!, child: cart());
  }
}
