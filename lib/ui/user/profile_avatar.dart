import 'dart:math';

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
        shape: BoxShape.circle,
        color: Constants
            .mixedColors[Random().nextInt(Constants.mixedColors.length)]
            .shade300,
      ),
      alignment: Alignment.center,
      child: ImageNetwork(
        image: user!.avatar,
        width: mediaQ.width * 0.22,
        height: mediaQ.height * 0.44,
        fitWeb: BoxFitWeb.fill,
        onLoading: const LoadingWidget(),
        onError: const LoadingWidget(
          title: 'Unable to load Avatar!!!',
          icon: Icons.error_rounded,
        ),
      ),
    );
  }
}
