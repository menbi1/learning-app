import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import "colors.dart" as color;
class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo=[];
  bool _playArea=false;
  bool _isPlaying=false;
  bool _disposed = false;
  int _isPlayingIndex=-1;
  VideoPlayerController? _controller;
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo= json.decode(value);
      });
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
    //_onTapVideo(-1);
  }
  @override
  void dispose(){
    _disposed=true;
    _controller?.pause();
    _controller=null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: _playArea==false?BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            )
          ):BoxDecoration(
            color: color.AppColor.gradientSecond,
          ),
      child: Column(
        children: [
          _playArea==false?Container(
            padding: const EdgeInsets.only(top:70, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 300,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios, size: 20,
                      color:color.AppColor.secondPageIconColor),
                    ),
                    Expanded(child: Container()),

                  ],
                ),
                SizedBox(height: 30,),
                Text(
                  "Learning Biology",
                  style: TextStyle(
                      fontSize: 25,
                      color:color.AppColor.secondPageTitleColor
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "For grade 5",
                  style: TextStyle(
                      fontSize: 25,
                      color:color.AppColor.secondPageTitleColor
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            color.AppColor.secondPageContainerGradient1stColor,
                            color.AppColor.secondPageContainerGradient2ndColor
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer,
                          size: 20,
                              color:color.AppColor.secondPageIconColor,),
                          SizedBox(width: 5,),
                          Text(
                            "68 min",
                            style: TextStyle(
                              fontSize: 16,
                              color:color.AppColor.secondPageIconColor
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),

                  ],
                ),

              ],
            )
          ):Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 50, left: 30),

                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          debugPrint("tapped");

                        },
                        child: Icon(Icons.arrow_back_ios,
                        size: 20,
                          color: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ),
                _playView(context),
                _controlView(context),

              ],
            ),
          ),

          Expanded(child: Container(
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70)
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),

                SizedBox(height: 20,),

                Row(
                  children: [
                    SizedBox(width: 30,),
                    Text(
                      "Chapter 1: Human1 Biology",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:color.AppColor.circuitsColor
                      ),
                    ),
                    Expanded(child: Container()),

                  ],
                ),
                SizedBox(height: 15,),
                Expanded(
                    child: _listView())
              ],
            ),
          ),),
        ],
      ),
    ));
  }
  Widget _controlView(BuildContext context){
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8 ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [

                  ]
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: ()async{
                final index = _isPlayingIndex-1;
                if(index>=0&&videoInfo.length>=0){
                  _initializeVideo(index);
                }else{
                  Get.snackbar('Video', "",
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blue[900],
                      messageText: Text(
                        "No more video is in the list!",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )
                  );
                }

              },
              child: Icon(Icons.fast_rewind,
                size: 36,
                color: Colors.white,
              ),
          ),
          TextButton(
            onPressed: ()async{
              if(_isPlaying){
                setState(() {
                  _isPlaying=false;
                });
                _controller?.pause();

              }else{
                setState(() {
                  _isPlaying=true;
                });
                _controller?.play();
              }
            },
            child: Icon(_isPlaying? Icons.pause:Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: ()async{
              final index = _isPlayingIndex+1;
              if(index<=videoInfo.length-1){
                _initializeVideo(index);
              }else{
                Get.snackbar("Video List", "",
                colorText: Colors.white,
               // snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.blue[900],
                  messageText: Text(
                    "No more video is in the list!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )
                );
              }
            },
            child: Icon(Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
  Widget _playView(BuildContext context){
    final controller= _controller;
    if(controller!=null&&controller.value.isInitialized){
    return AspectRatio(
      aspectRatio: 16/9,
      child: VideoPlayer(controller),
    );
    }
    else{
      return AspectRatio(
          aspectRatio: 16/9,
          child: Center(
            child: Text('Loading...',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),

            ),
          ));

    }

  }
  var _onUpdateControllerTime;
  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if  (_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now+500;
    final controller= _controller;
    if(controller==null){
      debugPrint("controller is null");
      return ;
    }
    if(!controller.value.isInitialized){
      debugPrint('controller is not');
      return ;
    }
    final playing = controller.value.isPlaying;
    _isPlaying=playing;
  }
  _initializeVideo(int index)async{
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller= controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {

    });
    controller
      ..initialize().then((_){
        old?.dispose();
        _isPlayingIndex=index;
        controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {

      });
    });
  }
  _onTapVideo(int index){
    _initializeVideo(index);
  }
  _listView(){
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
        itemCount: videoInfo.length,
        itemBuilder: (_,int index){
          return GestureDetector(
            onTap: (){
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if(_playArea==false){
                  _playArea=true;
                }

              });
            },
            child: _buildCard(index),
          );

        });
  }
  _buildTitle(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {  },
          child: Container(
            height: 50,
            width: 150,
            color: Colors.red,
            child: Center(child: Text("me")),
          ),
        ),
        MaterialButton(
          onPressed: (){},
          child: Container(
            height: 50,
            width: 150,
            color: Colors.blue,
            child: Center(child: Text("he")),
          ),
        )
      ],
    );
  }
  _buildCard(int index){
    return Container(
      height: 100,
      width: 200,
      //color: Colors.red,
      child: Column(
        children: [

          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit:BoxFit.cover,

                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    padding: EdgeInsets.only(top:3),),
                ],
              )
            ],
          ),
          SizedBox(height: 5,),
          Divider(height: 3,),


        ],
      ),
    );
  }

}



