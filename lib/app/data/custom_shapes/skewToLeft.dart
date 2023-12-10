import 'package:flutter/widgets.dart';

class SkewCut2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width - (size.width / 1.2), 0);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(SkewCut2 oldClipper) => false;
}
