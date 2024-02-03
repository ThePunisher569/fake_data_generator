import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/address/address_screen.dart';
import 'ui/appliance/appliance_screen.dart';
import 'ui/bank/bank_screen.dart';
import 'ui/blood_type/blood_type_screen.dart';
import 'ui/credit_card/credit_card_screen.dart';
import 'ui/home/home.dart';
import 'ui/user/user_screen.dart';

const _animationDuration = Duration(milliseconds: 700);

final myRouter = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const Home(),
          );
        }),
    GoRoute(
        path: '/user',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const UserScreen(),
          );
        }),
    GoRoute(
        path: '/address',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const AddressScreen(),
          );
        }),
    GoRoute(
        path: '/bank',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const BankScreen(),
          );
        }),
    GoRoute(
        path: '/appliance',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const ApplianceScreen(),
          );
        }),
    GoRoute(
        path: '/credit-card',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const CreditCardScreen(),
          );
        }),
    GoRoute(
        path: '/blood-type',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: _animationDuration,
            reverseTransitionDuration: _animationDuration,
            transitionsBuilder: _transit,
            child: const BloodTypeScreen(),
          );
        }),
  ],
);

Widget _transit(context, animation, secondaryAnimation, Widget child) {
  final slideAnimation = Tween(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
    parent: animation,
  ));

  final slideOutAnimation = Tween(
    begin: Offset.zero,
    end: const Offset(-0.3, 0.0),
  ).animate(CurvedAnimation(
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
    parent: secondaryAnimation,
  ));

  final isRoot =
      GoRouter.of(context).routeInformationProvider.value.uri.toString() == '/';
  return SlideTransition(
    textDirection: isRoot ? TextDirection.rtl : null,
    position: slideAnimation,
    child: SlideTransition(
      textDirection: isRoot ? null : TextDirection.ltr,
      position: slideOutAnimation,
      child: child,
    ),
  );
}
