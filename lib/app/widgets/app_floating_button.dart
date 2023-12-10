import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/widgets/signin_widget.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: FloatingActionButton.small(
        backgroundColor: AppColors.accentText,
        onPressed: () {
          Get.dialog(
            const SignInWidget(),
          );
        },
        shape: const CircleBorder(),
        child: const Text(
          "+",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
