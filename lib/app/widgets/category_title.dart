import 'package:flutter/material.dart';
import 'package:kheloo/app/data/colors.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
    required this.title,
    required this.totalItems,
    required this.isShow,
    required this.onTap,
  });
  final String title;
  final String totalItems;
  final bool isShow;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 6,
                decoration: BoxDecoration(
                  color: AppColors.lineColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                ' ($totalItems)',
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.lineColor,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  isShow ? 'Show More' : 'Hide',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
