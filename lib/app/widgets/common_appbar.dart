import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/images.dart';
import 'package:kheloo/app/widgets/signin_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Column(
        children: [
          Image.asset(
            AppImages.logo,
            height: 45,
          ),
        ],
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.promotion,
              height: 25,
              width: 25,
            ),
            const Text('Promotions',
                style: TextStyle(
                  color: AppColors.accentText,
                  fontSize: 11,
                ))
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Get.dialog(
              const SignInWidget(),
            );
          },
          child: Container(
            width: 60,
            height: MediaQuery.of(context).size.height,
            color: AppColors.accentText,
            child: const Center(
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
