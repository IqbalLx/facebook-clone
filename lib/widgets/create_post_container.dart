import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: currentUser.imageUrl
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Hi, ${this.currentUser.name}! What\'s up?'
                  ),
                ),
              )
            ],
          ),
          const Divider(height: 8, thickness: 0.5),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.videocam, color: Colors.red,),
                  label: Text('Live'),
                ),
                const VerticalDivider(width: 8),
                FlatButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.photo_library, color: Colors.green,),
                  label: Text('Photo'),
                ),
                const VerticalDivider(width: 8),
                FlatButton.icon(
                  onPressed: (){}, 
                  icon: Icon(Icons.video_call, color: Colors.purple,),
                  label: Text('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
