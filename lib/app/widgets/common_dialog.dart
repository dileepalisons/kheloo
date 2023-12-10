import 'package:flutter/material.dart';
import 'package:kheloo/app/data/colors.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(
                  color: AppColors.accentText,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
