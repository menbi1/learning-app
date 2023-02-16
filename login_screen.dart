
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player_app/screens/base_screen.dart';
import 'package:video_player_app/sign_up.dart';

import 'chatScreen.dart';
import 'forgot_screen.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
  bool isRemeeberMe = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget emailBuild(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueAccent,
                  blurRadius: 6,
                  offset: Offset(0,2)

              ),
            ],
          ),
          child: TextField(
            onChanged: (value){
              email=value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blueAccent,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget passwordBuild(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueAccent,
                  blurRadius: 6,
                  offset: Offset(0,2)

              ),
            ],
          ),
          child: TextField(
            onChanged: (value){
              password = value;
            },
            obscureText: true,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue[900],
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget buildForgotPass(){
    return Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>forgotScreen()));
          },
          //padding: EdgeInsets.only(right:0),
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),

        )

    );
  }
  Widget buildRemm(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blueAccent),
            child: Checkbox(
              value: isRemeeberMe,
              checkColor: Colors.green,
              activeColor: Colors.black12,
              onChanged: (value){
                setState(() {
                  isRemeeberMe=value!;
                });
              },

            ),
          ),
          Text(
            'Rememer me',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),

          )
        ],

      ),
    );
  }
  Widget buildLogin(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 50),
      height: 60,
      width: double.infinity,
      child: MaterialButton(
        elevation: 5,
        onPressed: ()async{
          final user =  await _auth.signInWithEmailAndPassword(email: email, password: password);
          try {
            if (User != null) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChatScreen()));

              // Navigator.pushNamed(context, ChatScreen.id);
            }
          }catch(e){
            print(e);
          }
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.blue[900],
        child: Text(
          'Log In',
          style: TextStyle(
          color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,

        )
        ),
      ),
    );

  }
  Widget buildsignUp(){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signUp()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )
            )
          ]
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 120,
          ),
          child: Column(
            children: <Widget>[
              Text("Sign in",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              emailBuild(),
              SizedBox(height: 20),
              passwordBuild(),
              SizedBox(height: 10),
              buildForgotPass(),
              SizedBox(height: 10),
              buildRemm(),
              SizedBox(height: 10),
              buildLogin(),
              SizedBox(height: 50),
              buildsignUp(),

            ],
          ),
        ),

      ),

    );
  }

}
