import 'package:flutter/material.dart';




class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.cResult, this.inference,this.colours});
  final double cResult;
  final String inference;
  final Color colours;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(title: Text('Covid Calculator'),
        ),
        body:
        ColoredBox(
          color: colours,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$cResult %",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("$inference",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              ),

            ],
          ),
        ),);
  }
}
