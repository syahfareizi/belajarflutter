import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class Profileavatar extends StatelessWidget {
  final String imageURL;
  final bool isActive;
  final bool hasBorder;

  const Profileavatar({
    Key key,
    @required this.imageURL,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.tuneGreen,
          child: CircleAvatar(
            radius: hasBorder ? 18 : 20,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(imageURL),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
