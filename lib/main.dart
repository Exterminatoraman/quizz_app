import 'dart:ffi';
import 'ques.dart';
import 'package:flutter/material.dart';
import 'ques_brain.dart';
Quiz_brain qbrain=Quiz_brain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scoreKeeper=[
  ];
 // List<String> ques=['You can lead a cow down stairs but not up stairs.','Approximately one quarter of human bones are in the feet.','A slug\'s blood is green.'];
  // List<bool> ans=[false,true,true];
  //int b=qbrain.num();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qbrain.getques(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.green,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState((){
                  bool correct=qbrain.getans();
                  if (correct==true){

                    scoreKeeper.add(
                      Icon(Icons.check,
                        color: Colors.green,),);
                    qbrain.nextques();
                    //The user picked true.
                  }
                  else {
                    scoreKeeper.add(
                      Icon(Icons.close,
                        color: Colors.red,),);
                    qbrain.nextques();
                  }
                },);},
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState((){
                bool correct=qbrain.getans();
                if (correct==false){
                    scoreKeeper.add(
                      Icon(Icons.check,
                        color: Colors.green,),);
                    qbrain.nextques();
                    //The user picked true.
                  }
                else {
                  scoreKeeper.add(
                    Icon(Icons.close,
                      color: Colors.red,),);
                 qbrain.nextques();

                };
                },);},
                //The user picked false.

            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
