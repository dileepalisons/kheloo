import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image, title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
