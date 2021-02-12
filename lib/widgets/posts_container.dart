import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostsContainer extends StatelessWidget {
  final Post post;

  const PostsContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: this.post),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(this.post.caption),
                  this.post.imageUrl != null
                      ? SizedBox.shrink()
                      : SizedBox(
                          height: 8.0,
                        )
                ],
              ),
            ),
            this.post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CachedNetworkImage(imageUrl: this.post.imageUrl),
                  )
                : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Palette.facebookBlue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.thumb_up,
                        size: 10.0,
                        color: Colors.white,
                      )),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text(
                      '${this.post.likes}',
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    ),
                  ),
                  Text(
                    '${this.post.comments} Comments',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '${this.post.shares} Shares',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  )
                ],
              ),
            ),
            SizedBox(height: 8.0),
            const Divider(height: 8, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.thumbUpOutline,
                    color: Colors.grey[600],
                  ),
                  label: Text('Like'),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.commentOutline,
                    color: Colors.grey[600],
                  ),
                  label: Text('Comment'),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.shareOutline,
                    color: Colors.grey[600],
                  ),
                  label: Text('Share'),
                ),
              ],
            ),
          ],
        ));
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ProfileAvatar(imageUrl: this.post.user.imageUrl),
        SizedBox(width: 8.0),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('${this.post.user.name}'),
            Row(
              children: [
                Text('${this.post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    )),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12.0,
                ),
              ],
            )
          ]),
        ),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: () => {})
      ],
    ));
  }
}
