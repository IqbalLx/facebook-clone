import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:facebook_clone/data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          title: Text(
            'facebook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          floating: true,
          actions: [
            CircleButton(icon: Icons.search, iconSize: 25.0, onPressed: () {}),
            CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 25.0,
                onPressed: () {})
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
              child: RoomsContainer(onlineUsers: onlineUsers)),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
              child: StoriesContainer(
            stories: stories,
            currentUser: currentUser,
          )),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return PostsContainer(post: posts[index]);
        }, childCount: posts.length))
      ],
    ));
  }
}
