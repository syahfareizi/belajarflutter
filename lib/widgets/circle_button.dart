import 'package:flutter/material.dart';

class Circlebutton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;

  const Circlebutton({
    Key key,
    @required this.icon,
    @required this.onPressed,
    @required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        iconSize: iconSize,
        onPressed: onPressed,
      ),
    );
  }
}
