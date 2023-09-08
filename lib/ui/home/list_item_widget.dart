import 'package:fake_data_generator/router/router.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

//TODO add illustration, gradient
class ListItemWidget extends StatelessWidget {
  final String name;
  final Image image;

  final List<Color> colors;

  const ListItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (name) {
          case 'Person':
            myRouter.go('/user');
          case 'Address':
            myRouter.go('/address');
          case 'Beer':
            myRouter.go('/beer');
          case 'Bank':
            myRouter.go('/bank');
          case 'Blood Type':
            myRouter.go('/blood-type');
          case 'Appliance':
            myRouter.go('/appliance');
          case _:
            myRouter.go('/credit-card');
        }
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: SweepGradient(
                  colors: colors,
                  transform: const GradientRotation(math.pi),
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 48, bottom: 48),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
