import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_player_app/login_screen.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 75,
            width: 75,
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: 15,
                      widthFactor: 15,

                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Ehtshet Kassegn',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'ehtsherkassegn@gmail.com',
          ),
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue[900],
            ),
            child: MaterialButton(

              onPressed: () {
                _auth.signOut();
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginScreen()));
              },
              child: Center(
                child: Text(
                  'Log out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width:30),
        profileInfo,
        SizedBox(width: 30),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {  },
                  child: ProfileListItem(
                    icon: Icons.download,
                    text: 'Downloaded Videos',
                  ),
                ),
                ProfileListItem(
                  icon: Icons.save,
                  text: 'Saved',
                ),
                ProfileListItem(
                  icon: Icons.incomplete_circle,
                  text: 'In Progress',
                ),
                ProfileListItem(
                  icon: Icons.safety_check,
                  text: 'Completed',
                ),
                ProfileListItem(
                  icon: Icons.help,
                  text: 'Help',
                ),
                ProfileListItem(
                  icon: Icons.signpost_outlined,
                  text: 'About us',
                  //hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[

        ],
      ),
    );

  }
}


