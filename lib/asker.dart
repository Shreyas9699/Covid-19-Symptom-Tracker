import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps/covid_result.dart';

QuizBrain quizBrain = QuizBrain();
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String resultText ='RESULTS';
  String inferenceText;
  Color kalar;
  Color colours;
  String calc(a){
    if(a>=40 && a<80){
      setState(() {
        colours=Colors.orange;
      });

      return 'You might want to consult a doctor,\njust in case.' ;
    }
    else if(a<40){
      setState(() {
        colours=Colors.green;
      });

      return 'You are just fine, take a chill pill and relax!\nStay home, stay safe !';
    }
    else if(a>80){
      setState(() {
        colours=Colors.red;
      });

      return 'You might want to get yourself tested.Keep calm. Here , call this number : 1075';
    }
  }


  void checkAnswer() {

    setState(() {
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        double a=quizBrain._score*2.5;
        inferenceText=calc(a);
        setState(() {
         kalar=colours;
        });

        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ResultsPage(cResult: a,inference: inferenceText.toUpperCase(),colours: kalar,)));
        quizBrain.reset();

      }
      else
      {quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid Symptom Test'),backgroundColor: Color(0xFF002865),),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                   // Icon(FontAwesomeIcons.thermometerFull,size: 50,),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.black,
                color: Color(0xFF158D3A),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer();
                  quizBrain.scoreAdd();
                  //The user picked true.
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
                  'No',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer();
                  //The user picked false.
                },
              ),
            ),
          ),
        ],
      ),);
  }
}
class QuizBrain {
  int _questionNumber = 0;
  int _score=0;

  List<Question> _questionBank = [
  Question('Are you having fever?',3),
  Question('Do you have dry cough?',3),
  Question('Do you have a soar throat?',3),
  Question('Do you have immediate loss of taste?',3),
  Question('Do you have immediate loss of smell?',3),
  Question('Do you have difficulty in breathing?',3),
  Question('Do you have any chest pain/ pain like feeling?',3),
  Question('Have you been in a surgery recently?',2),
  Question('Do you undergo dialysis periodically?',2),
  Question('Do you have any body aches?',1),
  Question('Do you have any diarrhoea kind of symptoms?',1),
  Question('Do you have high blood pressure?',1),
  Question('Do you have any body rashes?',1),
  Question('Brain and nervous system conditions',1),
  Question('Are you an asthma patient?',1),
  Question('Do you go out very frequently?',0),
  Question('Are you able to get a proper sleep?',0),
  Question('Are you able to follow proper diet?',0),
  Question('Do you notice any irregular weight loss?',1),
  Question('Do you go out everyday?',1),
  Question('Have you happened to have travelled anywhere out of your city?',2),
  Question('Are you a patient with heart disease?',2),
  Question('Do you have hypertension?',1),
  Question('Are you a healthcare worker?',2),
    Question('Do you live in a containment area?',0),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }



  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {


      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }
  void scoreAdd()
  {
    _score=_score+_questionBank[_questionNumber].severity;
    print(_score);
  }


  void reset() {
    _questionNumber = 0;
    _score=0;
  }
}
class Question {
  String questionText;
  int severity;

  Question(String q,int s) {
    questionText = q;
    severity =s;
  }
}
