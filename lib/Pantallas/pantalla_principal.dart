import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:star_fighter/models/markers.dart';
import 'dart:math';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:star_fighter/Pantallas/pantalla_testeo.dart';
import '../control/markersInfo.dart';

class PantallaPrincipal extends StatefulWidget {
  PantallaPrincipal({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class CustomController extends MapController {
  CustomController({
    bool initMapWithUserPosition = true,
    GeoPoint? initPosition,
    BoundingBox? areaLimit = const BoundingBox.world(),
  })  : assert(
          initMapWithUserPosition || initPosition != null,
        ),
        super(
          initMapWithUserPosition: initMapWithUserPosition,
          initPosition: initPosition,
          areaLimit: areaLimit,
        );

  @override
  void init() {
    super.init();
  }
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  late CustomController controller;
  late GeoPoint actualPoint;
  MarkersInfo markersInfo = MarkersInfo();
  double anguloCompas = 0;

  Future<void> showMarkersInArea() async {
    markersInfo.markersNames.clear();
    GeoPoint controllerPos = await controller.centerMap;
    for (MarkersMap marker in markersInfo.markers) {
      GeoPoint mrkPos = marker.location;

      double latDistance = controllerPos.latitude - mrkPos.latitude;
      double lonDistance = controllerPos.longitude - mrkPos.longitude;

      double Distance = sqrt(pow(latDistance, 2) + pow(lonDistance, 2));

      if (markersInfo.radMarker >= Distance) {
        markersInfo.markersNames.add(marker.text);
      }
    }
    markersInfo.visibleListView = !markersInfo.visibleListView;
    setState(() {});
  }

  _PantallaPrincipalState();

  @override
  void initState() {
    super.initState();
    controller = CustomController(
      initMapWithUserPosition: false,
      initPosition: GeoPoint(
        latitude: 41.39475816395134,
        longitude: 2.1275533363223076,
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    await controller.currentLocation();
    await controller.enableTracking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      //drawer: buildDrawer(context, LiveLocationPage.route),
      body: Container(
        child: Stack(children: [
          OSMFlutter(
            controller: controller,
            trackMyPosition: false,
            mapIsLoading: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text("Map is Loading.."),
                ],
              ),
            ),
            onMapIsReady: (isReady) {
              if (isReady) {
                getCurrentLocation();
              }
            },
            initZoom: 18,
            minZoomLevel: 3,
            maxZoomLevel: 18,
            stepZoom: 1.0,
            userLocationMarker: UserLocationMaker(
              personMarker: MarkerIcon(
                  icon: markersInfo.GetIconFromString("player", "black", 70)),
              directionArrowMarker: MarkerIcon(
                  icon: markersInfo.GetIconFromString("player", "black", 70)),
            ),
            showContributorBadgeForOSM: false,
            showDefaultInfoWindow: false,
            onLocationChanged: (myLocation) {
              FlutterCompass.events?.listen((angle) {
                double result = angle.heading!;
                if (result != null) {
                  if (result < 0) {
                    result = 360 + result;
                  }
                  controller.rotateMapCamera(-result);
                }
              });
              controller.centerMap;
              actualPoint = myLocation;
              if (markersInfo.primerMarkador) {
                markersInfo.primerMarkador = false;
                /*
                if (!markersInfo.estaEnMarkers(myLocation.latitude + 0.0007,
                    myLocation.longitude + 0.0007, controller)) {
                */

                markersInfo.generateMarker(
                    myLocation.latitude + 0.0005,
                    myLocation.longitude + 0.0002,
                    "lootbox",
                    "green",
                    60,
                    controller,
                    "LootBox");

                markersInfo.generateMarker(
                    myLocation.latitude + 0.0002,
                    myLocation.longitude + 0.0002,
                    "station",
                    "blue",
                    60,
                    controller,
                    "Station");

                
                controller.setMarkerIcon(markersInfo.markers[0].location, markersInfo.markers[0].iconMarker);
                controller.setMarkerIcon(markersInfo.markers[1].location, markersInfo.markers[1].iconMarker);
                
                /*
                  markersInfo.generateMarker(
                      myLocation.latitude + 0.0007,
                      myLocation.longitude + 0.001,
                      "combat", "red", 60,
                      controller, "Combat");
                  */
                //}
              }
            },
          ),
          Container(
            width: 800,
            height: 800,
            color: const Color.fromRGBO(20, 20, 20, 0),
          ),
          markersInfo.MarkersListView(),
          Positioned(
              top: 30,
              left: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                child: const Icon(Icons.person_add),
                onPressed: () => {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaTesteo()),
                  )
                },
              )),

          Positioned(
              top: 80,
              left: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: CircleBorder()),
                child: Icon(Icons.shopping_cart),
                onPressed: () => {},
              )),
          Positioned(
              top: 130,
              left: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: CircleBorder()),
                child: Icon(Icons.add_location_rounded),
                onPressed: showMarkersInArea,
              )),

          //ElevatedButton(onPressed: showMarkersInArea, child: null),
        ]),
      ),
    );
  }
}
