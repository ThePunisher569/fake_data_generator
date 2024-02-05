import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/constants.dart';
import 'categories_list_item_widget.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(64),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 4,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                ),
                padding: const EdgeInsets.all(48),
                alignment: Alignment.center,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(80),
            child: StaggeredGrid.count(
                crossAxisCount: Constants.contentList.length,
                mainAxisSpacing: 60,
                crossAxisSpacing: 100,
                children: Constants.contentList
                    .map((e) => StaggeredGridTile.fit(
                  crossAxisCellCount: 3,
                  child: ListItemWidget(
                    name: e,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
                    ),
                    colors: Constants
                        .gradientList[Constants.contentList.indexOf(e)],
                  ),
                ))
                    .toList()),
          )
        ],
      ),
    );
  }
}
