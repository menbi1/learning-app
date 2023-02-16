import 'package:flutter/material.dart';

import 'bookData.dart';


class MovieDetailsScreen extends StatelessWidget {
  final Books topic;

  MovieDetailsScreen(this.topic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(topic.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                topic.picture,
                height: 800,
              ),
            ],
          ),
        ),
      ),
    );
  }
}