import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

// TextWidget CLASS
class TextWidget extends StatelessWidget {
  final Color borderColors;
  final Color textColors;
  final String text;
  final double fontSize;
  final int lineSize;

  const TextWidget({
    Key key,
    this.borderColors,
    @required this.text,
    @required this.fontSize,
    @required this.lineSize,
    @required this.textColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColors), //add
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(
            text,
            maxLines: lineSize, //add
            minFontSize: 5.0,
            textAlign: TextAlign.center,
            //maxFontSize: 100,
            style: GoogleFonts.bigShouldersDisplay(
              textStyle: TextStyle(
                color: textColors,
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
              ),
            ), //add
            stepGranularity: 5.0,
            overflow: TextOverflow.fade,
          )),
    );
  }
}

//BackgroundVideo CLASS
class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/1st_background_video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    //_controller.setVolume(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Scaffold(
                backgroundColor: Color(0x191923).withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Countdown Clock Class
class CountdownClock extends StatefulWidget {
  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text('Countdown Clock'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Text('Clock 2',style: TextStyle(fontSize: 50),),
            SlideCountdownClock(duration: Duration(days: 60),

              shouldShowDays: true,
              slideDirection: SlideDirection.Down,


              separator: ':',textStyle: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.transparent,
                border: Border.all(color: Colors.white,width: 2.0),
              ),
              separatorTextStyle: TextStyle(
                fontSize: 40,
                color: Colors.white
              ),

              padding: EdgeInsets.all(8.0),
              onDone: (){
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('2Finshed'),),);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFitted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Row(children: [
          Container(
          height: 30,
          width: 50,
          child: Image.asset('icons/001-design-thinking.png')),
        Container(
            height: 30,
            width: 50,
            child: Image.asset('icons/002-healthy.png')),
        Container(
            height: 30,
            width: 50,
            child: Image.asset('icons/003-analytics.png')),
        Container(
            height: 30,
            width: 50,
            child: Image.asset('icons/004-user-experience.png')),
        Container(
            height: 30,
            width: 50,
            child: Image.asset('icons/005-career.png')),
      ],));


  }
}


