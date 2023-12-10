import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kheloo/app/data/images.dart';
import 'package:kheloo/app/modules/home/models/game.dart';

class HomeController extends GetxController {
  final caroualImages = [
    AppImages.carousal1,
    AppImages.carousal2,
    AppImages.carousal3,
    AppImages.carousal4,
  ];
  final languages = ['English', 'हिन्दी', 'తెలుగు', 'ಕನ್ನಡ', 'मराठी', '...'];

  final games = {
    'Most Popular': <Game>[
      Game(
        image: AppImages.game1,
        min: 10,
        max: 100,
      ),
      Game(
        image: AppImages.game2,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game3,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game4,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game5,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game6,
        min: 100,
        max: 100,
      ),
    ],
    'Playtech Live': <Game>[
      Game(
        image: AppImages.game7,
        min: 10,
        max: 100,
      ),
      Game(
        image: AppImages.game8,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game9,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game10,
        min: 100,
        max: 100,
      ),
      Game(
        image: AppImages.game11,
        min: 100,
        max: 100,
      ),
    ],
  };
  final showMoreControl = <RxBool>[
    false.obs,
    false.obs,
    false.obs,
  ];

  final currentCarousalIndex = 0.obs;
  late PageController pageController;
  final scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: 0,
    );
    pageChange();
  }

  pageChange() async {
    Timer.periodic(
        const Duration(
          milliseconds: 2500,
        ), (timer) {
      if (pageController.page! == caroualImages.length - 1) {
        pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
