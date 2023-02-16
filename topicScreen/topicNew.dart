import 'package:flutter/material.dart';
import 'package:video_player_app/video_info.dart';



class topicB extends StatefulWidget {

  const topicB({Key? key}) : super(key: key);

  @override
  State<topicB> createState() => _topicBState();

}
class _topicBState extends State<topicB> {
  @override
  int pageIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage('assets/icons/logo.jpg'),
          height: 3,
          width: 3,
        ),
        titleSpacing: 10.0,
        title: Text(
          'Ghioon',
          style: TextStyle(
            color: Colors.blue,
          ),
          //color: Colors.blue,
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 100.0,
              child: Icon(
                Icons.search,
                color: Colors.blue,

              ),
            ),
          ),
          // IconButton(
          //     onPressed: (){},
          //   icon: Icon(Icons.search),
        ],
      ),
      body: getBody(),


    );
  }
  Widget getBody(){
    return Scaffold(

        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Container(
            child: Column(
              children: [
                SizedBox(height: 25,),
                Text('My Class',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                SizedBox(height: 20,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 5 courses'),

                    leading: Image.asset('assets/icons/design.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 6 courses'),

                    leading: Image.asset('assets/icons/laptop.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VideoInfo()));

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 7 courses'),

                    leading: Image.asset('assets/icons/accounting.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 8 courses'),

                    leading: Image.asset('assets/icons/laptop.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 9 courses'),

                    leading: Image.asset('assets/icons/design.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 10 courses'),

                    leading: Image.asset('assets/icons/accounting.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 11 courses'),

                    leading: Image.asset('assets/icons/laptop.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
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
                  child: ListTile(
                    title: Text('Grade 12 courses'),

                    leading: Image.asset('assets/icons/design.jpg'),
                    trailing: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                    ),
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

}
