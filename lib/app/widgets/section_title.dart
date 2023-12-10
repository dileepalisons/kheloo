import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kheloo/app/data/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.black,
          height: 75,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ShaderMask(
              blendMode: BlendMode.modulate,
              shaderCallback: (size) => const LinearGradient(
                begin: Alignment(0.5, 1),
                end: Alignment(0.5, 0),
                colors: <Color>[
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(234, 251, 201, 91),
                ],
                stops: [0.4, 1],
                tileMode: TileMode.clamp,
              ).createShader(
                Rect.fromLTWH(0, 0, size.width, size.height),
              ),
              child: Text(
                text,
                style: GoogleFonts.anton(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  height: 2.4,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
            ),
          ),
        ),
        //line
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: AppColors.lineColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
