import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/create_room_container.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: Text(
              'TUNE',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Palette.tuneGreen,
                letterSpacing: -1.2,
              ),
            ),
            floating: true,
            actions: [
              Circlebutton(
                icon: Icons.search,
                onPressed: () {
                  print('Search');
                },
                iconSize: 30,
              ),
              Circlebutton(
                  icon: MdiIcons.facebookMessenger,
                  onPressed: () {
                    print('Messenger');
                  },
                  iconSize: 30),
            ],
          ),
          SliverToBoxAdapter(
            child: Createpostcontainer(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Createroom(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Createstories(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return Postcontainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
