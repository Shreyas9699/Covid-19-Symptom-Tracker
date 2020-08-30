
import 'package:flutter/material.dart';
class CovidCentres extends StatefulWidget {
  @override
  _CovidCentresState createState() => _CovidCentresState();
}

class _CovidCentresState extends State<CovidCentres> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid-19 health centres'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Laboratory Services APOLLO BGS Hospitals',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Adichunchanagiri Road, Kuvempu Nagara, Mysuru, Karnataka 570023 Ph: 0821 - 2568888",
                        style: TextStyle( fontSize: 12,color: Colors.white),textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,


              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Mysore Medical College And Research Institute',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Irwin Road, next to Railway Station, Mysuru, Karnataka 570001 \nPh: 0821 252 0512",
                        style: TextStyle( fontSize: 12,color: Colors.white),textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,


              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Color(0xFF002865)),
                height: 100,
                width: 150,
                child: Center(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'JSS Medical College',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bangalore - Mysore Rd, opposite J.S.S.Pharmacy College, Bannimantap A Layout, Bannimantap, Mysuru, Karnataka 570015 \nPh: 0821 254 8416",
                        style: TextStyle( fontSize: 12,color: Colors.white),textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,


              ),

            ],
          ),
        ),
      ),
    );

  }

}
