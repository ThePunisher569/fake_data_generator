import 'package:flutter/cupertino.dart';
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

    return isLoading
        ? SafeArea(
            child: Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(
                  color: Colors.deepPurpleAccent.shade200,
                  radius: 48,
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/bg.jpg'),
                    filterQuality: FilterQuality.high,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                    onError: (exception, stackTrace) => logger.e(
                        '${exception.toString()}\n\n ${stackTrace.toString()}'),
                  ),
                ),
                child: Center(
                  child: GlassmorphicContainer(
                    width: mediaQ.width * 0.88,
                    height: mediaQ.height * 0.92,
                    borderRadius: 32,
                    blur: 8,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(32),
                    border: 3,
                    linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.6),
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
                      padding: const EdgeInsets.all(32),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ProfileAvatar(user: user),
                              gapH80,
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
                                cvv: card!.id.toString().substring(0, 2),
                                bankName: "Axis Bank",
                                cardType: cc.CardType.discover,
                                // Optional if you want to override Card Type
                                showBackSide: false,
                                frontBackground: cc.CardBackgrounds.custom(
                                  Colors.blueGrey.shade800.value,
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
            ),
          );
  }
}


