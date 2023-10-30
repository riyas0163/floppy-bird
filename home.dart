import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled5/barrier.dart';
import 'package:untitled5/bird.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

   static double birdY = 0;
   double height = 0;
   double initialheight = birdY;
   double time = 0;
   double gravlity = 2.8;
   double velocity = -4.9;
   int score = 0;
 static  double barrierone = 0;
 static  double barriertwo = barrierone + 1;

bool gamehasstarted = false;



  void startgame(){
    gamehasstarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.03;
      height = velocity * time * time + gravlity * time;
      setState(() {
        barrierone -= 0.05;
        barriertwo -= 0.05;

        birdY = initialheight -height;
      });
       if (birddead()){
         timer.cancel();
         birdY = initialheight -height;
         showdialog();
       }


      time +=0.01;
       setState(() {
         if (barrierone < -1.1){
           barrierone += 2.2;
         }else {
           barrierone -=0.05;
         }
       });
      setState(() {
        if (barriertwo < -1.1){
          barriertwo += 2.2;
        }else {
          barriertwo -=0.05;
        }
      });
      // setState(() {
      //   if (barrierthree < -1.1){
      //     barrierthree += 2.2;
      //   }else {
      //     barrierthree -=0.05;
      //   }
      // });
    });
  }


  void resetgame(){

    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gamehasstarted = false;
      time =0 ;
      initialheight = birdY;
      if (barrierone < -1.2){
        barrierone =1.0;
        score++;
      }
    });

  }
void jump(){
    setState(() {
      time = 0;
      initialheight = birdY;
    });
}
bool birddead(){
  if (birdY < -1 || birdY > 1){
    return true;
  }
  else if (birdY < barrierone || birdY > barriertwo){
    return true;
  }
  return false;

}


void showdialog(){
    showDialog(context: context, builder: (BuildContext  context){
      return AlertDialog(
        title: Center(
          child: Container(
            child: Text("GAME OVER"),
          ),
        ),
        actions: [
         GestureDetector(
           onTap: resetgame,
           child: ClipRect(
             child: Container(
               child: Text("PLAY AGAIN"),
             ),
           ),
         )
        ],
      );
    }
    );
}




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gamehasstarted ? jump : startgame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment(0,birdY),
                      child: mybird(),
                    ),
                    Container(alignment: Alignment(0,-0.3),
                      child: Text( gamehasstarted ?"": "TAP TO PLAY",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    AnimatedContainer(alignment: Alignment(barrierone, -1),
                      duration: Duration(milliseconds: 0),
                      child: barrier(
                        size: 150,),
                    ),
                    AnimatedContainer(alignment: Alignment(barrierone, 1),
                      duration: Duration(milliseconds: 0),
                      child: barrier(
                        size: 180,),
                    ),
                    AnimatedContainer(alignment: Alignment(barriertwo, -1),
                      duration: Duration(milliseconds: 0),
                      child: barrier(
                        size: 150,),
                    ),
                    AnimatedContainer(alignment: Alignment(barriertwo
                        , 1),
                      duration: Duration(milliseconds: 0),
                      child: barrier(
                        size: 200,),
                    ),
                    // AnimatedContainer(alignment: Alignment(barrierthree, -1),
                    //   duration: Duration(milliseconds: 0),
                    //   child: barrier(
                    //     size: 200,),
                    // ),
                    // AnimatedContainer(alignment: Alignment(barrierthree, 1),
                    //   duration: Duration(milliseconds: 0),
                    //   child: barrier(
                    //     size: 200,),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(mainAxisAlignment:MainAxisAlignment.center ,
                        children: [
                          Center(child: Text('Score: $score',style: TextStyle(fontSize: 20),)),
                         // Text("0",style: TextStyle(fontSize: 20),),
                        ],
                      ),

                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("BEST",style: TextStyle(fontSize: 20),)),
                          Text("10",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
