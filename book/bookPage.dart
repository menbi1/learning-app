import 'package:flutter/material.dart';
import 'bookData.dart';
import 'bookLIst.dart';


class bookPage extends StatefulWidget {

  const bookPage({Key? key}) : super(key: key);

  @override
  State<bookPage> createState() => _bookPageState();

}
class _bookPageState extends State<bookPage> {
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
          // IconButto//     onPressed: (){},
          //   icon: Icon(Icons.search),
        ],
      ),
      body: getBody(),

    );
  }
  Widget getBody(){
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Colors.white,
          title: Text('Books',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
        ),

        body:  ListView.builder(

            itemCount: bookList.length,
            itemBuilder: (context, index) {
              Books movie = bookList[index];
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(movie.title),

                  leading: Image.asset(movie.picture),
                  trailing: Icon(
                    Icons.download_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(movie)));
                  },
                ),
              );
            })
    );
  }

}
