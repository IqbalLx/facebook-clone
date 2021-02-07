import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key key, 
    @required this.imageUrl, 
    this.isActive = false,
    this.hasBorder = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive ? Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Palette.online,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              shape: BoxShape.circle
            ),
          )
        ) : SizedBox.shrink()
      ],
    );
  }
}
