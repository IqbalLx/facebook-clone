import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/config/palette.dart';

class RoomsContainer extends StatelessWidget {
  final List<User> onlineUsers;

  const RoomsContainer({
    Key key, 
    @required this.onlineUsers
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal:10, vertical: 4),
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length + 1,
        itemBuilder: (BuildContext context, int index){
          if (index == 0) {
              return Container(
                margin: EdgeInsets.only(right: 8),
                child: _CreateRoomButton()
              );
            }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 40,
            height: 50,
            child: ProfileAvatar(
              imageUrl: this.onlineUsers[index-1].imageUrl,
              isActive: true,
            ),
          );
        })
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
          onPressed: (){},
          color: Colors.blueAccent[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          borderSide: BorderSide(
            width: 3,
            color: Colors.blueAccent[100]
          ),
          textColor: Palette.facebookBlue,
          child: Row(
            children: [
              ShaderMask(
                shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
                child: Icon(Icons.video_call, size: 35, color: Colors.white)
              ),
              const SizedBox(width: 4),
              Text('Create\nRoom')
            ],
          ),
      );
  }
}