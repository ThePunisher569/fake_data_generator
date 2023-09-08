import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              expandedHeight: size.height * 0.16,
              centerTitle: true,
              title: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(Constants.appName,
                        textStyle:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 250),
                        curve: Curves.decelerate)
                  ],
                  repeatForever: true,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  Constants.appDesc,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              sliver: SliverList.separated(
                itemBuilder: (context, index) {
                  return ListItemWidget(
                    name: Constants.contentList[index],
                    image: Image.network(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                    colors: Constants.gradientList[index],
                  );
                },
                itemCount: Constants.contentList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
