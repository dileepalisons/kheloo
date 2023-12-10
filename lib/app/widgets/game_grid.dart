import 'package:flutter/widgets.dart';
import 'package:kheloo/app/modules/home/models/game.dart';
import 'package:kheloo/app/widgets/game_item.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({
    super.key,
    this.games,
    required this.isShow,
  });
  final List<Game>? games;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: !isShow ? 4 : games!.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1.75,
      ),
      itemBuilder: (context, i) {
        return GameItem(
          currentIndex: i,
          min: games![i].min,
          max: games![i].max,
          image: games![i].image,
        );
      },
    );
  }
}
