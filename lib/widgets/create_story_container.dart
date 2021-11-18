import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/story_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class Createstories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _Storiescard(
              isAddStory: true,
            );
          }
          final Story story = stories[index - 1];
          return _Storiescard(
            story: story,
            isAddStory: false,
          );
        },
      ),
    );
  }
}

class _Storiescard extends StatelessWidget {
  final bool isAddStory;
  final Story story;
  final bool isViewed;

  const _Storiescard({
    Key key,
    this.isAddStory = true,
    this.story,
    this.isViewed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image(
              height: double.infinity,
              width: 110,
              image: CachedNetworkImageProvider(
                  isAddStory ? currentUser.imageUrl : story.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: 110,
            decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: isAddStory
                  ? IconButton(
                      onPressed: () {
                        print('Add to Story');
                      },
                      icon: Icon(
                        Icons.add,
                        color: Palette.tuneGreen,
                      ),
                    )
                  : Profileavatar(
                      imageURL: story.user.imageUrl,
                      hasBorder: story.isViewed,
                    ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Text(
              isAddStory ? 'Add to Story' : story.user.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
