import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class forgotScreen extends StatefulWidget {
  const forgotScreen({Key? key}) : super(key: key);

  @override
  State<forgotScreen> createState() => _forgotScreenState();
}


class _forgotScreenState extends State<forgotScreen> {
  bool isRemeeberMe = false;
  Widget buildText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Enter your email address to receive a link to reset your password.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

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
            color: Colors.black54,
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


  Widget buildLogin(){
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 50),
      height: 60,
      width: double.infinity,
      child: MaterialButton(
        elevation: 5,
        onPressed:() => ('Submit pressed'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.blue[900],
        child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,

            )
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
              Text("Forgot Password",
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              buildText(),
              SizedBox(height: 50),
              buildEmail(),


              SizedBox(height: 50),
              buildLogin(),



            ],
          ),
        ),

      ),

    );
  }
}
