import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/rendering.dart';
import 'package:flame_spine/flame_spine.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSpineFlutter(enableMemoryDebugging: false);
  final game = MyGame();
  runApp(MaterialApp(
    home: Scaffold(body: GameWidget<MyGame>(game: game)),
  ));
}

class MyGame extends FlameGame {
  MyGame();

  @override
  void onLoad() async {
    camera.viewport = FixedResolutionViewport(resolution: size);
    camera.viewfinder.position = size / 2;
    camera.viewport.anchor = Anchor.center;
    camera.viewfinder.anchor = Anchor.center;

    final background = RectangleComponent(
        size: size, paint: Paint()..color = Colors.yellowAccent);
    world.add(background);

    final atlas = await Atlas.fromAsset('assets/spineboy.atlas');
    final skeleton =
        await SkeletonData.fromAsset(atlas, 'assets/spineboy-pro.skel');
    final spineBoy = SpineComponent(SkeletonDrawable(atlas, skeleton, true),
        scale: Vector2.all(.5));

    spineBoy.animationState.setAnimationByName(0, "run", true);

    final shadow = Shadow3DDecorator(

    );
    spineBoy.decorator.addLast(shadow);

    await world.add(spineBoy);
  }
}
