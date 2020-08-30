import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

// Credits - https://github.com/rajayogan/flutter-googlemaps   (only to import google maps)
class ViewMap extends StatefulWidget {
  @override
  _ViewMapState createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  BitmapDescriptor pinLocationIcon;
  List<Marker> allMarkers = [];

  GoogleMapController _controller;
  
  void addHotSpot(double latt,double longi){
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(latt, longi)));
    
  }
  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("HELOOOOOO\n\n");
    print(position);
    print("HELOOOOOO");
  }



  @override
  void initState() {
    super.initState();

    // TODO: implement initState

    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(12.2958, 76.6394)));
  }
  

  @override
  Widget build(BuildContext context) {

    addHotSpot(12.3018, 76.693556);
    addHotSpot(12.2855, 76.617444);
    addHotSpot(76.6458, 76.645833);
    addHotSpot(12.3003, 76.649611);
    addHotSpot(12.3045, 76.645472);
    addHotSpot(12.3136, 76.655278);
    addHotSpot(12.322194, 76.658028);
    addHotSpot(12.3215, 76.666111);
    addHotSpot(12.324525, 76.669212);
    addHotSpot(12.299177, 76.613699);
    addHotSpot(12.304029, 76.607148);
    addHotSpot(12.328242, 76.673951);
    addHotSpot(12.330223, 76.671322);
    addHotSpot(12.332885, 76.666129);
    addHotSpot(12.333430, 76.659692);
    addHotSpot(12.321534, 76.666393);
    addHotSpot(12.309784, 76.662970);
    addHotSpot(12.297582, 76.647842);
    addHotSpot(12.295852, 76.640353);
    addHotSpot(12.293315, 76.641243);
    addHotSpot(12.294992, 76.635707);
    addHotSpot(12.292654, 76.636737);
    addHotSpot(12.289551, 76.635503);
    addHotSpot(12.286595, 76.638958);
    addHotSpot(12.287077, 76.632725);
    addHotSpot(12.285630, 76.627747);
    addHotSpot(12.283638, 76.624668);
    addHotSpot(12.282590, 76.621728);
    addHotSpot(12.281730, 76.614143);
    addHotSpot(12.280954, 76.611343);
    addHotSpot(12.350163, 76.622714);
    addHotSpot(12.351683, 76.615654);
    addHotSpot(12.337047, 76.628702);
    addHotSpot(12.346323, 76.636176);
    addHotSpot(12.351879, 76.622619);
    addHotSpot(12.346265, 76.623557);
    addHotSpot(12.345005, 76.637566);
    addHotSpot(12.347353, 76.633081);
    addHotSpot(12.342641, 76.622682);
    addHotSpot(12.321111, 76.632089);
    addHotSpot(12.322547, 76.627079);
    addHotSpot(12.322935, 76.623410);
    addHotSpot(12.341176, 76.612167);
    addHotSpot(12.342402, 76.607672);
    addHotSpot(12.340620, 76.602823);
    addHotSpot(12.351270, 76.604926);



    print('Hello ALl');
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(12.305647, 76.653497)));
    print(allMarkers);
    return Scaffold(

      appBar: AppBar(
        title: Text('COVID-19 MAP'),
      ),
      body: Stack(
          children: [Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition:
              CameraPosition(target: LatLng(12.2958, 76.6394), zoom: 15.0),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: movetoBoston,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.green
                  ),
                  child: Icon(Icons.forward, color: Colors.white),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: movetoNewYork,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.red
                  ),
                  child: Icon(Icons.backspace, color: Colors.white),
                ),
              ),
            )
          ]
      ),
    );
  }


  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoBoston() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(42.3601, -71.0589), zoom: 14.0, bearing: 45.0, tilt: 45.0),
    ));
  }

  movetoNewYork() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
    ));
  }
}
