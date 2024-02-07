import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:awesome_card/awesome_card.dart' as cc;
import 'package:icons_plus/icons_plus.dart';

import '../../api/models/credit_card/credit_card.dart';
import '../../api/models/user/user.dart';
import '../../api/services/api.dart';
import '../../utils/constants.dart';
import 'profile_avatar.dart';
import 'user_info.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isLoading = true;

  ApiService api = ApiService();
  late User? user;
  late CreditCard? card;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });

      user = await api.getUser();
      card = await api.getCreditCard();

      setState(() {
        isLoading = false;
      });
    } on Exception catch (e, s) {
      logger
          .e('An error occurred ${e.toString()}\nStack Trace ${s.toString()}');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            elevation: 32,
            leading: Icon(
              Icons.error_rounded,
              color: Colors.red.shade800,
            ),
            content: Text(
              'Unable to Generate Person Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [
              IconButton.filledTonal(
                onPressed: () {
                  getData();
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                icon: const Icon(Icons.refresh_rounded),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQ = MediaQuery.sizeOf(context);

    final theme = Theme.of(context);

    Widget fab = FloatingActionButton.extended(
      backgroundColor: Colors.lightBlue.shade800,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 32,
      extendedIconLabelSpacing: 12.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      foregroundColor: Colors.lime,
      focusElevation: 48,
      onPressed: getData,
      label: Text(
        'Generate Another Information',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: Colors.lime,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      icon: const Icon(Icons.refresh_rounded),
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/back.png'),
              filterQuality: FilterQuality.high,
              alignment: Alignment.center,
              fit: BoxFit.fill,
              onError: (exception, stackTrace) => logger
                  .e('${exception.toString()}\n\n ${stackTrace.toString()}'),
            ),
          ),
          alignment: Alignment.center,
          child: GlassmorphicContainer(
            width: mediaQ.width * 0.88,
            height: mediaQ.height * 0.92,
            borderRadius: 32,
            blur: 2,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.white.withOpacity(0.016),
                Colors.white.withOpacity(0.2),
              ],
              stops: const [0.7, 1],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.4),
                const Color(0xFFFFFFFF).withOpacity(0.8),
              ],
            ),
            child: SingleChildScrollView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 48,
              ),
              physics: const BouncingScrollPhysics(),
              child: isLoading
                  ? const LoadingWidget(
                      title: 'Generating Information about random person...',
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        fab,
                        gapV24,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfileAvatar(user: user),
                            gapH64,
                            Expanded(child: UserInfo(user: user))
                          ],
                        ),
                        gapV48,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cc.CreditCard(
                              width: mediaQ.width * 0.34,
                              height: mediaQ.height * 0.4,
                              cardNumber: card!.creditCardNumber,
                              cardExpiry: card!.creditCardExpiryDate,
                              cardHolderName:
                                  '${user!.firstName} ${user!.lastName}',
                              mask: card!.creditCardType,
                              bankName: "Axis Bank",
                              cardType: cc.CardType.discover,
                              // Optional if you want to override Card Type
                              showBackSide: false,
                              frontBackground: cc.CardBackgrounds.custom(
                                Colors.pink.shade900.value,
                              ),
                              backBackground: cc.CardBackgrounds.black,
                              showShadow: true,
                              textExpDate: 'Exp. Date',
                              textName: 'Name',
                              textExpiry: 'MM/YY',
                            ),

                            gapH48,

                            // TODO implement subscription

                            Expanded(
                              child: Subscription(user: user),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

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
                message: 'Subscription Details',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          user!.subscription.status,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.4,
                          ),
                        ),
                        gapH16,
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: user!.subscription.status == 'Active'
                                ? Colors.lightGreenAccent
                                : user!.subscription.status == 'Pending' ||
                                        user!.subscription.status == 'Idle'
                                    ? Colors.lightBlue
                                    : Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
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
                          Brand(getPaymentMethod(), size: 72),
                        ],
                      ),
                    ),
                    gapV16,
              
                    // TODO add bento cards for 2 contents
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
    }

    return Brands.cash_app;
  }
}
