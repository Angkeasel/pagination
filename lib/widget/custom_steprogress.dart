import 'dart:async';

import 'package:flutter/material.dart';

class CustomSteprogress extends StatefulWidget {
  const CustomSteprogress({Key? key, this.status, this.initColor})
      : super(key: key);
  final String? status;
  final Color? initColor;

  @override
  State<CustomSteprogress> createState() => _CustomSteprogressState();
}

class _CustomSteprogressState extends State<CustomSteprogress> {
  bool initLine1 = false;
  bool initLine2 = false;
  bool initLine3 = false;
  bool initStep1 = false;
  bool initStep2 = false;
  bool initStep3 = false;
  bool initStep4 = false;

  bool isFinish = false;

  @override
  void initState() {
    super.initState();
    initStepper();
  }

  void initStepper() {
    if (widget.status == 'originalProduct') {
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          initLine1 = true;
        });
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            initStep2 = true;
          });
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              isFinish = true;
            });
          });
        });
      });
    } else if (widget.status == 'freeShipping') {
      initLine1 = true;
      initStep2 = true;
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          initLine2 = true;
        });
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            initStep3 = true;
          });
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              isFinish = true;
            });
          });
        });
      });
    } else if (widget.status == 'fastDelivery') {
      initLine1 = true;
      initLine2 = true;
      initStep3 = true;
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          initLine3 = true;
        });
        Timer(const Duration(milliseconds: 500), () {
          setState(() {
            initStep4 = true;
          });
          Timer(const Duration(milliseconds: 500), () {
            setState(() {
              isFinish = true;
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * 0.5 - 88,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400),
              ),
              AnimatedContainer(
                width: initLine1 || initLine2 || initLine3
                    ? MediaQuery.of(context).size.width * 0.5 - 80
                    : 0,
                height: 3,
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                    color: (() {
                      if (isFinish == true) {
                        return Colors.green;
                      } else {
                        return widget.initColor;
                      }
                    }()),
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * 0.5 - 88,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400),
              ),
              AnimatedContainer(
                width: initLine1 || initLine2 || initLine3
                    ? MediaQuery.of(context).size.width * 0.5 - 80
                    : 0,
                height: 3,
                duration: const Duration(milliseconds: 1500),
                decoration: BoxDecoration(
                    color: (() {
                      if (isFinish == true &&
                          (widget.status == 'freeShipping' ||
                              widget.status == 'fastDelivery')) {
                        return Colors.green;
                      } else {
                        return widget.initColor;
                      }
                    }()),
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * 0.5 - 88,
                height: 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade400),
              ),
              AnimatedContainer(
                width: initLine1 || initLine2 || initLine3
                    ? MediaQuery.of(context).size.width * 0.5 - 80
                    : 0,
                height: 3,
                duration: const Duration(milliseconds: 2000),
                decoration: BoxDecoration(
                    color: (() {
                      if (isFinish == true && widget.status == 'fastDelivery') {
                        return Colors.green;
                      } else {
                        return widget.initColor;
                      }
                    }()),
                    borderRadius: BorderRadius.circular(5)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
