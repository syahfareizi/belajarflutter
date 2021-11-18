import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  final IconData icon;
  final Color colors;
  final String text;
  final Function onPressed;

  const Textbutton({
    Key key,
    @required this.icon,
    @required this.colors,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        children: [
          Icon(
            icon,
            color: colors,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
