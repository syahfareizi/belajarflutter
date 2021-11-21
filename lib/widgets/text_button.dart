import 'package:flutter/material.dart';

class Textbutton extends StatelessWidget {
  final IconData icon;
  final Color colors;
  final String text;
  final Function onPressed;
  final double fontsize;
  final Color warna;

  const Textbutton({
    Key key,
    @required this.icon,
    @required this.colors,
    @required this.text,
    @required this.onPressed,
    this.fontsize = 20,
    this.warna = Colors.black,
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
              fontSize: fontsize,
              color: warna,
            ),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
