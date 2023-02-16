
import 'package:flutter/material.dart';
import 'category.dart';
import 'package:video_player_app/book/bookPage.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);
  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  var pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(
          image: AssetImage('assets/icons/logo.jpg'),
        ),
        titleSpacing: 0.0,
        title: Text(

          'Ghioon',
          style: TextStyle(
            color: Colors.blue,
          ),
          //color: Colors.blue[900],
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: 100.0,
              child: Icon(
                Icons.search,
                color: Colors.blue[900],

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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Categories",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.blue[900]),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 20,
                mainAxisSpacing: 24,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: categoryList[index],
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const bookPage(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ), //BoxShadow
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                  category.thumbnail,
                  height:120 //kCategoryCardImageSize,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(category.name),
            Text(
              "${category.noOfCourses.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
