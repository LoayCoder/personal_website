import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/home/widgets_home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundVideo(),
          CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: TextWidget(
                  fontSize: 150.0,
                  lineSize: 1,
                  text: 'Under Construction',
                  borderColors: Colors.transparent,
                  textColors: Colors.white,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(30),

              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  child: CountdownClock(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(50),

              ),
              SliverToBoxAdapter(
                child: TextWidget(
                  fontSize: 100.0,
                  lineSize: 2,
                  textColors: Colors.amber,
                  text: 'Soon My "Professionality" Will Be Published',
                  borderColors: Colors.transparent,

                ),
              ),


              SliverPadding(
                padding: const EdgeInsets.all(50),

              ),
                // SliverGrid.count(
                //   crossAxisSpacing: 20,
                //   mainAxisSpacing: 20,
                //   crossAxisCount: 1,
                //   children: <Widget>[
                //
                //
                //   ],
                // ),


              SliverToBoxAdapter(
                child: ImageFitted(),
              ),


            ],
          ),

        ],
      ),
    );
  }
}
