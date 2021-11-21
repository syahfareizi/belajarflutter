import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Postcontainer extends StatelessWidget {
  final Post post;

  const Postcontainer({
    Key key,
    @required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Postheader(post: post),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('${post.caption}'),
          ),
          SizedBox(
            height: 8,
          ),
          post.imageUrl != null
              ? Image(
                  image: CachedNetworkImageProvider(post.imageUrl),
                )
              : SizedBox.shrink(),
          _Poststats(post: post),
          _Postaction(),
        ],
      ),
    );
  }
}

class _Postaction extends StatelessWidget {
  const _Postaction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Textbutton(
          icon: Icons.thumb_up_alt_outlined,
          colors: Colors.grey[600],
          text: 'Like',
          onPressed: () {
            print('Like it!');
          },
          fontsize: 12,
          warna: Colors.grey[600],
        ),
        VerticalDivider(
          width: 8,
        ),
        Textbutton(
          icon: Icons.comment_outlined,
          colors: Colors.grey[600],
          text: 'Comment',
          onPressed: () => print(
            'Comment now! ',
          ),
          fontsize: 12,
          warna: Colors.grey[600],
        ),
        VerticalDivider(
          width: 8,
        ),
        Textbutton(
          icon: Icons.share_outlined,
          colors: Colors.grey[600],
          text: 'Share',
          onPressed: () => print('Share '),
          fontsize: 12,
          warna: Colors.grey[600],
        ),
      ],
    );
  }
}

class _Poststats extends StatelessWidget {
  const _Poststats({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Palette.tuneGreen),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            '${post.likes} Likes',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        Text(
          '${post.comments} Comments',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          '${post.shares} Shares',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}

class _Postheader extends StatelessWidget {
  const _Postheader({
    Key key,
    @required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Profileavatar(imageURL: post.user.imageUrl),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.user.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      '${post.timeAgo} - ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    Icon(
                      Icons.public,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              print('More');
            },
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
