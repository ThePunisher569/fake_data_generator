import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../api/models/user/user.dart';
import '../../utils/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQ = MediaQuery.sizeOf(context);

    return Card(
      elevation: 32,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      shadowColor: Colors.lightGreenAccent.shade200,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          gradient: LinearGradient(
            colors: [
              Colors.red.withOpacity(0.7),
              Colors.purple.withOpacity(0.7),
              Colors.indigo.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.3, 0.6, 1],
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(18, 32),
              blurRadius: 48,
              spreadRadius: 16,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user!.firstName} ${user!.lastName}',
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            gapV32,
            Row(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        Uri mailtoUrl = Uri.parse(
                            'mailto:${user!.email}?subject=Mailing you because your information has been generated here');

                        if (await canLaunchUrl(mailtoUrl)) {
                          launchUrl(mailtoUrl);
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cannot send email'),
                              ),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.email_rounded),
                    ),
                    gapH8,
                    Text(
                      user!.email,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
                gapH24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.work_rounded),
                    ),
                    gapH8,
                    Text(
                      user!.employment.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    )
                  ],
                )
              ],
            ),
            gapV16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: 'Date of Birth',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sunny),
                      ),
                      gapH8,
                      Text(
                        DateFormat.yMMMMEEEEd()
                            .format(DateTime.parse(user!.dateOfBirth)),
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                gapH24,
                Tooltip(
                  message: 'Social Insurance Number',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.security_rounded),
                      ),
                      gapH8,
                      Text(
                        user!.socialInsuranceNumber,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapV16,
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_rounded),
                ),
                gapH8,
                Text(
                  user!.phoneNumber,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            gapV16,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  tooltip:
                      'lat: ${user!.address.coordinates.lat}, log: ${user!.address.coordinates.lng}',
                  onPressed: () async {
                    Uri mapUrl = Uri.https('google.com', '/maps', {
                      'q':
                          '${user!.address.coordinates.lat},${user!.address.coordinates.lng}'
                    });
                    if (await canLaunchUrl(mapUrl)) {
                      launchUrl(mapUrl);
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cannot open google maps'),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.location_on_rounded),
                ),
                gapH8,
                Text(
                  '${user!.address.streetName}, ${user!.address.streetAddress}, ${user!.address.city}, ${user!.address.state}, ${user!.address.zipCode}, ${user!.address.country}',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
