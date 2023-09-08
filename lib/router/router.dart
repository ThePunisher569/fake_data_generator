import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/address/address_screen.dart';
import '../ui/appliance/appliance_screen.dart';
import '../ui/bank/bank_screen.dart';
import '../ui/beer/beer_screen.dart';
import '../ui/blood_type/blood_type_screen.dart';
import '../ui/credit_card/credit_card_screen.dart';
import '../ui/home/home.dart';
import '../ui/user/user_screen.dart';

// TODO add different custom animation for each route

final myRouter = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/user',
      builder: (context, state) => const UserScreen(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: '/beer',
      builder: (context, state) => const BeerScreen(),
    ),
    GoRoute(
      path: '/bank',
      builder: (context, state) => const BankScreen(),
    ),
    GoRoute(
      path: '/appliance',
      builder: (context, state) => const ApplianceScreen(),
    ),
    GoRoute(
      path: '/credit-card',
      builder: (context, state) => const CreditCardScreen(),
    ),
    GoRoute(
      path: '/blood-type',
      builder: (context, state) => const BloodTypeScreen(),
    ),
  ],
);
