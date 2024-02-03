
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AnimatedAppBar extends StatelessWidget {
  const AnimatedAppBar({
    super.key,
    required this.size,
    required this.appBarTextTheme,
  });

  final Size size;
  final TextStyle appBarTextTheme;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      expandedHeight: size.height * 0.16,
      centerTitle: true,
      elevation: 16,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.black12,
      forceMaterialTransparency: true,
      title: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              Constants.appName,
              textStyle: appBarTextTheme,
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 600),
              curve: Curves.decelerate,
              cursor: ' ....',
            ),
            WavyAnimatedText(
              Constants.appName,
              textStyle: appBarTextTheme,
              speed: const Duration(seconds: 1),
            ),
            ColorizeAnimatedText(
              Constants.appName,
              textStyle: appBarTextTheme,
              colors: Constants.mixedColors,
              speed: const Duration(milliseconds: 800),
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
            ),
            FlickerAnimatedText(
              Constants.appName,
              textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
              speed: const Duration(seconds: 2),
              textAlign: TextAlign.center,
            ),
            RotateAnimatedText(
              'Fake',
              textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            RotateAnimatedText(
              'Data',
              textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            RotateAnimatedText(
              'Generator',
              textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            TyperAnimatedText(
              Constants.appName,
              textStyle:
              Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
              speed: const Duration(milliseconds: 500),
              textAlign: TextAlign.center,
            ),
            ScaleAnimatedText(
              'Fake',
              textStyle: appBarTextTheme,
              duration: const Duration(seconds: 1),
              textAlign: TextAlign.center,
            ),
            ScaleAnimatedText(
              'Data',
              textStyle: appBarTextTheme,
              duration: const Duration(seconds: 1),
              textAlign: TextAlign.center,
            ),
            ScaleAnimatedText(
              'Generator',
              textStyle: appBarTextTheme,
              duration: const Duration(seconds: 1),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}