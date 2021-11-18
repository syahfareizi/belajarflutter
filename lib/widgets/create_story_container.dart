import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/story_model.dart';

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
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image(
                      height: double.infinity,
                      width: 110,
                      image: CachedNetworkImageProvider(currentUser.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          }
          final Story story = stories[index - 1];
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image(
                    height: double.infinity,
                    width: 110,
                    image: CachedNetworkImageProvider(story.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
