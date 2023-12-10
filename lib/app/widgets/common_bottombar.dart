import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/custom_shapes/skewToLeft.dart';
import 'package:kheloo/app/data/custom_shapes/skewToRight.dart';
import 'package:kheloo/app/data/images.dart';
import 'package:kheloo/app/modules/home/controllers/home_controller.dart';
import 'package:kheloo/app/widgets/footer_item.dart';
import 'package:kheloo/app/widgets/signin_widget.dart';

class CommonBottomBar extends StatelessWidget {
  const CommonBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: EdgeInsets.zero,
      height: 80,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.black,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipPath(
                  clipper: SkewCut1(),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        AppColors.footerGradient2,
                        AppColors.footerGradient1,
                      ],
                    )),
                  ),
                ),
                ClipPath(
                  clipper: SkewCut2(),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        AppColors.footerGradient1,
                        AppColors.footerGradient2,
                      ],
                    )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FooterItem(
                  image: AppImages.footer1,
                  title: 'Support',
                  onTap: () {
                    Get.dialog(
                      const SignInWidget(),
                    );
                  },
                ),
                FooterItem(
                  image: AppImages.footer2,
                  title: 'Sports',
                  onTap: () {
                    Get.dialog(
                      const SignInWidget(),
                    );
                  },
                ),
                FooterItem(
                  image: AppImages.footer3,
                  title: 'Live Casino',
                  onTap: () {
                    Get.find<HomeController>().scrollController.animateTo(800,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.bounceOut);
                  },
                ),
                FooterItem(
                  image: AppImages.footer4,
                  title: 'Register',
                  onTap: () {
                    Get.dialog(
                      const SignInWidget(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
