import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/constants.dart';
import 'list_item_widget.dart';

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
              image: const AssetImage('assets/bg.jpg'),
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
              SliverAppBar.medium(
                expandedHeight: size.height * 0.18,
                centerTitle: true,
                elevation: 16,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                surfaceTintColor: Colors.black12,
                forceMaterialTransparency: true,
                title: Center(
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        Constants.appName,
                        textStyle: appBarTextTheme,
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 600),
                        curve: Curves.decelerate,
                        cursor: ' ....',
                      ),
                      WavyAnimatedText(
                        Constants.appName,
                        textStyle: appBarTextTheme,
                        speed: const Duration(seconds: 1),
                      ),
                      ColorizeAnimatedText(
                        Constants.appName,
                        textStyle: appBarTextTheme,
                        colors: Constants.mixedColors,
                        speed: const Duration(milliseconds: 800),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                      ),
                      FlickerAnimatedText(
                        Constants.appName,
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                        speed: const Duration(seconds: 2),
                        textAlign: TextAlign.center,
                      ),
                      RotateAnimatedText(
                        'Fake',
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      RotateAnimatedText(
                        'Data',
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      RotateAnimatedText(
                        'Generator',
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      TyperAnimatedText(
                        Constants.appName,
                        textStyle:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlueAccent,
                                ),
                        speed: const Duration(milliseconds: 500),
                        textAlign: TextAlign.center,
                      ),
                      ScaleAnimatedText(
                        'Fake',
                        textStyle: appBarTextTheme,
                        duration: const Duration(seconds: 1),
                        textAlign: TextAlign.center,
                      ),
                      ScaleAnimatedText(
                        'Data',
                        textStyle: appBarTextTheme,
                        duration: const Duration(seconds: 1),
                        textAlign: TextAlign.center,
                      ),
                      ScaleAnimatedText(
                        'Generator',
                        textStyle: appBarTextTheme,
                        duration: const Duration(seconds: 1),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
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
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(64),
                  ),
                  padding: const EdgeInsets.all(48),
                  alignment: Alignment.center,
                  child: StaggeredGrid.count(
                    crossAxisCount: Constants.contentList.length,
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    children: [
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 3,
                        child: ListItemWidget(
                          name: Constants.contentList[0],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[0],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 4,
                        child: ListItemWidget(
                          name: Constants.contentList[1],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[1],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 3,
                        child: ListItemWidget(
                          name: Constants.contentList[2],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[2],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 4,
                        child: ListItemWidget(
                          name: Constants.contentList[3],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[3],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 3,
                        child: ListItemWidget(
                          name: Constants.contentList[4],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[4],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 4,
                        child: ListItemWidget(
                          name: Constants.contentList[5],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[5],
                        ),
                      ),
                      StaggeredGridTile.fit(
                        crossAxisCellCount: 3,
                        child: ListItemWidget(
                          name: Constants.contentList[6],
                          image: Image.network(
                            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                          ),
                          colors: Constants.gradientList[6],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
