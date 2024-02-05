import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'animated_app_bar.dart';
import 'categories_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appBarTextTheme = Theme.of(context).textTheme.displayLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.lightBlueAccent,
        );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
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
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: Alignment.topCenter,
          child: CustomScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,
            ),
            slivers: [
              AnimatedAppBar(size: size, appBarTextTheme: appBarTextTheme),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 32.0,
                    right: 32.0,
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  child: Text(
                    Constants.appDesc,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                  ),
                ),
              ),
              const CategoriesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

