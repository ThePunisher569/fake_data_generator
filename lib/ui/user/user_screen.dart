import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:awesome_card/awesome_card.dart' as cc;

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

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/bg.jpg'),
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
            blur: 6,
            alignment: Alignment.center,
            border: 2,
            linearGradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white.withOpacity(0),
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
                  ? loadingWidget
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton.extended(
                          backgroundColor: Colors.pink.shade900,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 32,
                          extendedIconLabelSpacing: 12.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          tooltip:
                              'Refresh this page to generate another information about user',
                          foregroundColor: Colors.orange.shade300,
                          focusElevation: 48,
                          onPressed: () {
                            getData();
                          },
                          label: Text(
                            'Generate Another Information',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.orange.shade300,
                            ),
                          ),
                          icon: const Icon(Icons.refresh_rounded),
                        ),
                        gapV24,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProfileAvatar(user: user),
                            gapH72,
                            UserInfo(user: user)
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

                            // TODO implement subscription
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
