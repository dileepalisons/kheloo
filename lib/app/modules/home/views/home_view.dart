import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/constants.dart';
import 'package:kheloo/app/data/images.dart';
import 'package:kheloo/app/widgets/app_floating_button.dart';
import 'package:kheloo/app/widgets/category_title.dart';
import 'package:kheloo/app/widgets/common_appbar.dart';
import 'package:kheloo/app/widgets/common_bottombar.dart';
import 'package:kheloo/app/widgets/common_dialog.dart';
import 'package:kheloo/app/widgets/game_grid.dart';
import 'package:kheloo/app/widgets/jackpot.dart';
import 'package:kheloo/app/widgets/section_title.dart';
import 'package:kheloo/app/widgets/user_grid.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const CommonAppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              //carousal
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.caroualImages.length,
                  itemBuilder: (context, i) {
                    return Image.asset(
                      controller.caroualImages[i],
                      fit: BoxFit.cover,
                    );
                  },
                  onPageChanged: (i) async {
                    controller.currentCarousalIndex(i);
                  },
                ),
              ),
              //index of carousal
              Container(
                color: AppColors.black,
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.caroualImages.length,
                      itemBuilder: (context, i) {
                        return Center(
                          child: Obx(
                            () => AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              color: controller.currentCarousalIndex.value == i
                                  ? AppColors.accentText
                                  : AppColors.grey,
                              height: controller.currentCarousalIndex.value == i
                                  ? 3
                                  : 2,
                              margin: const EdgeInsets.all(5),
                              width: 20,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImages.langBg,
                    ),
                  ),
                ),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.languages.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          if (controller.languages[i] == '...') {
                            Get.dialog(
                              CommonDialog(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Select Language',
                                            style: GoogleFonts.nunito(
                                              color: AppColors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.all(10),
                                          itemCount:
                                              controller.languages.length - 1,
                                          itemBuilder: (context, i) {
                                            return Container(
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                color: AppColors.halfWhite,
                                              )),
                                              child: Center(
                                                child: Text(
                                                  controller.languages[i],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.accentText,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              controller.languages[i],
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.accentTextLight,
                                height: 1,
                              ),
                              textAlign: TextAlign.center,
                              strutStyle: const StrutStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: AppColors.black,
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: const JackPot(),
              ),
              const SectionTitle(
                text: 'LIVE WITHDRAWAL',
              ),

              ///
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.userBoard,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: const Center(
                  child: UserGrid(),
                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.275,
                color: AppColors.primary,
                child: const VimeoPlayer(
                  videoId: AppConstants.videoId,
                ),
              ),
              const SectionTitle(
                text: 'GAMES',
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.games.values.length,
                  itemBuilder: (context, i) {
                    return Obx(
                      () => Column(
                        children: [
                          CategoryTitle(
                            title: controller.games.keys.elementAtOrNull(i)!,
                            totalItems:
                                '${controller.games.values.elementAtOrNull(i)!.length}',
                            isShow: controller.showMoreControl[i].isFalse,
                            onTap: () {
                              controller.showMoreControl[i].toggle();
                            },
                          ),
                          GameGrid(
                            games: controller.games.values.elementAtOrNull(i),
                            isShow: controller.showMoreControl[i].isTrue,
                          )
                        ],
                      ),
                    );
                  }),

              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const AppFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CommonBottomBar(),
    );
  }
}
