import 'package:flame/components.dart';
import 'package:zombies/components/components.dart';
import 'package:zombies/gen/assets.gen.dart';
import 'package:zombies/zombies_game.dart';

class ZombieWorld extends World with HasGameRef<ZombieGame> {
  final List<Land> land = [];
  late final Player player;
  static Vector2 size = Vector2.all(100);

  ZombieWorld({super.children});

  @override
  Future<void> onLoad() async {
    //

    final greenLandImage = game.images.fromCache(Assets.town.tile0000.path);
    land.add(Land(position: Vector2.all(0), sprite: Sprite(greenLandImage)));
    add(land.last);

    final playerImage = game.images.fromCache(
      Assets.character.adventurer.poses.adventurerAction1.path,
    );
    player = Player(position: Vector2.all(20), sprite: Sprite(playerImage));
    add(player);
  }
}
