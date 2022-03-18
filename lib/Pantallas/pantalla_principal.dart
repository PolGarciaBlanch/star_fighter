import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:star_fighter/models/markers.dart';
import 'dart:math';

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

  Future<void> showMarkersInArea() async {
    markersInfo.markersNames.clear();
    GeoPoint controllerPos = await controller.centerMap;
    for (MarkersMap marker in markersInfo.markers) {
      GeoPoint mrkPos = marker.location;

      double latDistance = controllerPos.latitude - mrkPos.latitude;
      double lonDistance = controllerPos.longitude - mrkPos.longitude;

      double Distance = sqrt(pow(latDistance, 2) + pow(lonDistance, 2));

      if (markersInfo.radMarker >= Distance) {
        markersInfo.markersNames.add(marker.name);
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
        latitude: 47.4358055,
        longitude: 8.4737324,
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
      appBar: AppBar(title: Text('Home')),
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
                icon: Icon(
                  Icons.person,
                  size: 48,
                ),
              ),
              directionArrowMarker: MarkerIcon(
                icon: Icon(
                  Icons.double_arrow,
                  size: 48,
                ),
              ),
            ),
            showContributorBadgeForOSM: false,
            showDefaultInfoWindow: false,
            onLocationChanged: (myLocation) {
              controller.centerMap;
              controller.rotateMapCamera(0);
              actualPoint = myLocation;
              if (markersInfo.primerMarkador) {
                markersInfo.primerMarkador = false;
                if (!markersInfo.estaEnMarkers(myLocation.latitude + 0.0007,
                    myLocation.longitude + 0.0007, controller)) {
                  markersInfo.generateMarker(
                      myLocation.latitude + 0.0002,
                      myLocation.longitude + 0.0002,
                      Icons.all_out_rounded,
                      controller);
                }
              }
            },
          ),
          Container(
            width: 800,
            height: 800,
            color: Color.fromRGBO(20, 20, 20, 0),
          ),
          //getSizedmMarkersBox(),
          markersInfo.MarkersListView(),
          ElevatedButton(onPressed: showMarkersInArea, child: null),
        ]),
      ),
    );
  }
}
