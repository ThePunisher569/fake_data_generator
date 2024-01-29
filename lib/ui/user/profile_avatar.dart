import 'package:flutter/material.dart';

import '../../api/models/user/user.dart';
import '../../utils/constants.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        color: Colors.blueAccent,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: Image.network(
        user!.avatar,
        alignment: Alignment.bottomCenter,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        loadingBuilder: (context, child, loadingProgress) =>
        loadingProgress?.cumulativeBytesLoaded ==
            loadingProgress?.expectedTotalBytes
            ? child
            : const Center(
          child: Column(
            children: [
              Icon(Icons.downloading_rounded),
              gapV8,
              Text('Loading Avatar...'),
            ],
          ),
        ),
        errorBuilder: (context, error, stackTrace) => Center(
          child: Column(
            children: [
              Icon(
                Icons.error_rounded,
                color: Colors.red.shade800,
              ),
              gapV8,
              const Text('Unable to load the Avatar'),
            ],
          ),
        ),
      ),
    );
  }
}
