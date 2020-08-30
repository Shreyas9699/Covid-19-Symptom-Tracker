import 'package:flutter/material.dart';
import 'package:google_maps/fact_check.dart';
import 'package:flutter/cupertino.dart';
import 'asker.dart';
import 'map.dart';
import 'covid_centres.dart';
import 'prevention.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF002865),//green scheme //Color(0xFF002865),blue scheme
        scaffoldBackgroundColor: Color(0xFF50C878)//green scheme//Color(0xFF96D6F7),blue scheme
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Covid-19 Symptoms Tracker',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        body:WelcomePage(),
      ),
    );
  }
}
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => QuizPage()));
                print('TakeTest');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Take Test',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(image: AssetImage('images/testicon.png',),color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,


            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => ViewMap()));
                print('ViewwMap');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'View Risk Map',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(image: AssetImage('images/mapicon.png',),color: Colors.white,)

                    ],
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 15,


            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => FactPage()));
                print('Get your Facts Right');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Fact Check',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(image: AssetImage('images/facticon.png',),color: Colors.white,)

                    ],
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 15,


            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => CovidCentres()));
                print('Covid Centres');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Covid Centres',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(image: AssetImage('images/coronaicon.png',),color: Colors.white,)

                    ],
                  ),
                ),

              ),
            ),
               SizedBox(
              height: 15,


            ),
          GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => CovidPrevention()));
                print('How to avoid getting COVID-19 or spreading it?');
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Covid-19 Prevention',textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25,color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage('images/maskicon.png',),)

                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}


