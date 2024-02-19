import 'package:fake_data_generator/router.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../utils/constants.dart';

//TODO add illustration, gradient
class ListItemWidget extends StatelessWidget {
  final String name;

  final List<Color> colors;

  const ListItemWidget({
    super.key,
    required this.name,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        switch (name) {
          case 'Person':
            myRouter.go('/user');
            break;
          case 'Address':
            myRouter.go('/address');
            break;
          case 'Bank':
            myRouter.go('/bank');
            break;
          case 'Blood Type':
            myRouter.go('/blood-type');
            break;
          case 'Appliance':
            myRouter.go('/appliance');
            break;
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
              transform: const GradientRotation(math.pi / 8),
              tileMode: TileMode.repeated,
              center: Alignment.center,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.16,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(get3dIcon()),
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) => logger.e(
                        '${exception.toString()}\n\n ${stackTrace.toString()}'),
                  ),
                ),
              ),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }

  String get3dIcon() {
    switch (name) {
      case 'Person':
        return 'assets/user.png';
      case 'Address':
        return 'assets/address.png';
      case 'Bank':
        return 'assets/bank.png';
      case 'Blood Type':
        return 'assets/blood.png';
      case 'Appliance':
        return 'assets/appliance.png';
      case _:
        return 'assets/cc.png';
    }
  }
}
