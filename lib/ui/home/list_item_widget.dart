import 'package:flutter/material.dart';

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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: SweepGradient(
                colors: colors,
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
    );
  }
}
