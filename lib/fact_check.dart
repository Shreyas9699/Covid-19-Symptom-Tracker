import 'package:flutter/material.dart';
import 'package:google_maps/main.dart';

class Question {
  String questionText;
  bool questionAnswer;

  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}
FactBrain quizBrain = FactBrain();

class FactPage extends StatefulWidget {
  @override
  _FactPageState createState() => _FactPageState();
}

class _FactPageState extends State<FactPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {

      if (quizBrain.isFinished() == true) {

        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        //Put something here

        quizBrain.reset();


        scoreKeeper = [];
      }

      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Color(0xFF158D3A),
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fact Check'),),
      body:Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Color(0xFF158D3A),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    ),
    );
  }
}
class FactBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Can antibiotics prevent/treat COVID-19?', false),
    Question('Only people above the age of 30 get infected by COVID-19', false),
    Question('Eating garlic and onion prevents COVID-19', false),
    Question('Rinsing your nose with saline prevents COVID-19', false),
    Question('Ultraviolet lamps kill Corona Virus', false),
    Question('Corona Virus cannot spread through mosquitoes', true),
    Question(
        'Cold weather and snow can kill corona virus',
        false),
    Question(
        'The COVID-19 virus can spread in hot and humid climates',
        true),
    Question(
        'Catching COVID-19 DOES NOT mean you will have it for life',
        true),
    Question(
        'Drinking methanol, ethanol or bleach cures COVID-19',
        false),
    Question('COVID-19 is transmitted through houseflies', false),
    Question(
        'Adding pepper to your soup or other meals prevents or cures COVID-19',
        false),
    Question(
        'There are currently no drugs licensed for the treatment or prevention of COVID-19',
        true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}