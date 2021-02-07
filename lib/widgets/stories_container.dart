import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class StoriesContainer extends StatelessWidget {
  final List<Story> stories;
  final User currentUser;

  const StoriesContainer({
    Key key, 
    @required this.stories,
    @required this.currentUser
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (BuildContext context, int index){
          if (index == 0){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser
              ),
            );
          }
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: stories[index-1]
            ),
          );
        },
      )
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({
    Key key, 
    this.isAddStory = false, 
    this.currentUser, 
    this.story
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                width: 120.0,
                height: double.infinity,
                imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
                fit: BoxFit.cover
              ),
            ),
            Container(
              width: 120.0,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: Palette.storyGradient,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Positioned(
              top: 8.0,
              left: 8.0,
              child: isAddStory ?
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add),
                    iconSize: 30.0,
                    onPressed: (){},
                    color: Palette.facebookBlue,
                  )
                ) :
              ProfileAvatar(
                imageUrl: story.user.imageUrl,
                hasBorder: !story.isViewed,
              ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              child: Text(
                isAddStory ? 'Add to Story' : story.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ),
          )
        ]
    );
  }
}