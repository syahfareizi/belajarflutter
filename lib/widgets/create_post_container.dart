import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'widgets.dart';

class Createpostcontainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
        child: Column(
          children: [
            Row(
              children: [
                Profileavatar(
                  imageURL: currentUser.imageUrl,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind ?'),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 0.5,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Textbutton(
                  icon: Icons.videocam,
                  colors: Colors.red,
                  text: 'Live',
                  onPressed: () {
                    print('Go Live!');
                  },
                ),
                VerticalDivider(
                  width: 8,
                ),
                Textbutton(
                  icon: Icons.photo,
                  colors: Colors.green,
                  text: 'Photo',
                  onPressed: () => print(
                    'Upload Photo! ',
                  ),
                ),
                VerticalDivider(
                  width: 8,
                ),
                Textbutton(
                  icon: Icons.video_call,
                  colors: Colors.purple,
                  text: 'Room',
                  onPressed: () => print('Join Now! '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
