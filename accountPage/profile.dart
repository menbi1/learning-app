import 'package:flutter/material.dart';
class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(
        horizontal: 40,
      ).copyWith(
        bottom: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.blueAccent,
              blurRadius: 6,
              offset: Offset(0,2)

          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 25,
            color: Colors.blue[900],
          ),
          SizedBox(width: 15),
          Text(
            this.text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 15,
            ),

        ],
      ),
    );
  }
}