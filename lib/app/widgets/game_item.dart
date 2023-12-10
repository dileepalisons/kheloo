import 'package:flutter/widgets.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/images.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    required this.currentIndex,
    required this.min,
    required this.max,
    required this.image,
  });
  final int currentIndex;
  final int min, max;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.gameFGColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: AppColors.accentText,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                10,
              ),
              topRight: Radius.circular(
                10,
              ),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: currentIndex.isOdd ? 0 : null,
                  bottom: currentIndex % 12 == 0
                      ? null
                      : currentIndex % 3 == 0 &&
                              currentIndex != 0 &&
                              (currentIndex - 1) % 4 != 0
                          ? 0
                          : (currentIndex + 1) % 4 == 0
                              ? 0
                              : currentIndex % 2 == 0 && currentIndex % 4 != 0
                                  ? 0
                                  : null,
                  child: RotatedBox(
                    quarterTurns: currentIndex.isEven
                        ? currentIndex == 0 || currentIndex % 4 == 0
                            ? 0
                            : 3
                        : (currentIndex - 1) % 4 == 0
                            ? 1
                            : 2,
                    child: Image.asset(
                      AppImages.gameFG,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Min.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                '₹',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.rupeeSymbolColor,
                ),
              ),
              Text(
                '$min',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                width: 1,
                color: AppColors.rupeeSymbolColor,
                height: 10,
              ),
              const Text(
                'Max.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                '₹',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.rupeeSymbolColor,
                ),
              ),
              Text(
                '${max}k',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
