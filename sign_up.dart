
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatScreen.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}


class _signUpState extends State<signUp> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String userName;

  Widget buildUser(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User Name',
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
            ],          ),
          child: TextField(
            onChanged: (value){
              userName = value;
            },
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.supervised_user_circle,
                color: Colors.blueAccent,
              ),
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
        )
      ],
    );
  }
  Widget buildEmail(){
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
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.supervised_user_circle,
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
  Widget buildPassword(){
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
              hintText: 'password',
              hintStyle: TextStyle(
                color: Colors.black38,
              ),

            ),
          ),
        )
      ],
    );
  }


  Widget buildSignUp(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 50),
      height: 60,
      width: double.infinity,
      child: MaterialButton(
        elevation: 5,
        onPressed:() async {
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email,
                password: password);
            if(newUser!=null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginScreen()));

             // Navigator.pushNamed(context, ChatScreen.id);
            }
            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginScreen()));
          }
          catch (e){
            print(e);
          }
        },
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.blue[900],
        child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,

            )
        ),
      ),
    );

  }
  Widget buildSignIn(){
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loginScreen()));
      },
      child: RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'Do you have an Account? ',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )
              ),
              TextSpan(
                  text: 'Sign in',
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
              Text("Sign Up",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              buildUser(),
              SizedBox(height: 20),
              buildEmail(),
              SizedBox(height: 20),
              buildPassword(),
              SizedBox(height: 40),
              buildSignUp(),
              SizedBox(height: 50),
              buildSignIn(),

            ],
          ),
        ),

      ),

    );
  }
}
