import 'package:fake_data_generator/router.dart';
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 32,
        shadowColor: Colors.lime.shade300,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: colors,
              transform: const GradientRotation(math.pi/8),
              tileMode: TileMode.repeated,
              center: Alignment.center,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(
              right: 48,
              bottom: 48,
              top: 48,
            ),
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    inherit: true,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
