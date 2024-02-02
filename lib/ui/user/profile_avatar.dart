import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

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
    final mediaQ = MediaQuery.sizeOf(context);

    final theme = Theme.of(context);

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        color: Colors.blueAccent,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: ImageNetwork(
        image: user!.avatar,
        width: mediaQ.width * 0.22,
        height: mediaQ.height * 0.38,
        fitWeb: BoxFitWeb.contain,
        onLoading: const Column(
          children: [
            CupertinoActivityIndicator(
              radius: 48,
            ),
            gapV24,
            Icon(Icons.downloading_rounded),
            gapV8,
            Text('Loading Avatar...'),
          ],
        ),
        onError: Center(
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
