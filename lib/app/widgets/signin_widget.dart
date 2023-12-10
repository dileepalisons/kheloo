import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/images.dart';
import 'package:kheloo/app/widgets/app_textField.dart';
import 'package:kheloo/app/widgets/common_dialog.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'x',
                  style: GoogleFonts.nunito(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          AppImages.logo,
          height: 80,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'SIGN IN',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const AppTextField(
          hint: 'Mobile Number',
        ),
        const AppTextField(
          hint: 'Password',
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Forgot Password ?'),
            ),
          ],
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: AppColors.accentTextLight,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.accentTextLight,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'Register now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
