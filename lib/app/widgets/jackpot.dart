import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/images.dart';

class JackPot extends StatefulWidget {
  const JackPot({
    super.key,
  });

  @override
  State<JackPot> createState() => _JackPotState();
}

class _JackPotState extends State<JackPot> {
  int value = 1034091;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        value = value + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            AppImages.jackpot,
            height: 120,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: const Alignment(0.15, 0.1),
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 30,
                color: AppColors.jackpotText,
                fontWeight: FontWeight.w900,
                letterSpacing: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
