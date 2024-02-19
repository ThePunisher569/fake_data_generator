import 'dart:math';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../api/models/user/user.dart';
import '../../utils/constants.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key, required this.user});

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
      color: Colors.transparent,
      shadowColor: Colors.lightGreenAccent.shade200,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            width: 2,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: mediaQ.height * 0.4,
              width: 280,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(48),
              ),
              child: Tooltip(
                message: 'Subscribed Service',
                child: Brand(
                  Constants.brands[Random().nextInt(Constants.brands.length)],
                  size: 120,
                ),
              ),
            ),
            gapH48,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: mediaQ.width * 0.20,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Iconsax.watch_status_bold,
                                size: 28,
                                color: Colors.white70,
                              ),
                              gapH16,
                              Text(
                                'Status',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                user!.subscription.status,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: getStatusColor(),
                                  letterSpacing: 2.4,
                                ),
                              ),
                              gapH16,
                              Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: getStatusColor(),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    gapV24,
                    Container(
                      width: mediaQ.width * 0.20,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                const Icon(
                                  Iconsax.bank_outline,
                                  size: 28,
                                  color: Colors.white70,
                                ),
                                gapH16,
                                Text(
                                  'Payment Mode',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          gapH16,
                          Tooltip(
                            message: user!.subscription.paymentMethod,
                            child: Brand(getPaymentMethod(), size: 72),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getStatusColor() {
    switch (user!.subscription.status) {
      case 'Active':
        return Colors.lightGreenAccent;
      case 'Pending':
      case 'Idle':
        return Colors.orangeAccent;
      default:
        return Colors.redAccent;
    }
  }

  String getPaymentMethod() {
    switch (user!.subscription.paymentMethod) {
      case 'Apply Pay':
        return Brands.apple_pay;
      case 'WeChat Pay':
        return Brands.wechat;
      case 'Paypal':
        return Brands.paypal;
      case 'Google Pay':
        return Brands.google_pay;
      case 'Alipay':
        return Brands.aliexpress;
      case 'Bitcoins':
        return Brands.bitcoin;
      case 'Visa checkout':
        return Brands.visa;
      case 'Debit card':
        return Brands.mastercard;
    }

    return Brands.cash_app;
  }
}
