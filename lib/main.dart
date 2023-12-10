import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kheloo/app/data/colors.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kheloo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    ),
  );
}
