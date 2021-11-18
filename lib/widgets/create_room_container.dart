import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class Createroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: _Createroombutton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Profileavatar(
              imageURL: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _Createroombutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 3.0,
          color: Palette.tuneGreen,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return Palette.createRoomGradient.createShader(rect);
            },
            child: Icon(
              Icons.video_call,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            'Create Room',
            style: TextStyle(
              color: Palette.tuneGreen,
            ),
          ),
        ],
      ),
      onPressed: () {
        print(
          'Create Room!',
        );
      },
    );
  }
}
