import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:star_fighter/models/markers.dart';
import 'dart:async';

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
  List<MarkersMap> markers = [];
  bool primerMarkador = true;
  List<ElevatedButton> resultButton = [];
  late Timer timerCentrar;

  void generateMarker(double latitude, double longitude, IconData icono) {
    MarkerIcon mrkIcon = MarkerIcon(
      icon: Icon(
        icono,
        color: Color.fromRGBO(255, 255, 255, 100),
        size: 100,
      ),
    );

    GeoPoint point = GeoPoint(latitude: latitude, longitude: longitude);

    UniqueKey key = UniqueKey();
    MarkersMap varMrk =
        MarkersMap(location: point, iconMarker: mrkIcon, key: key);
    markers.add(varMrk);
    controller.addMarker(point, markerIcon: mrkIcon, angle: 0);
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.red,
    primary: Colors.red,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  void generarBoton(Key keyButton, int posX, int posY) {
    ElevatedButton button = ElevatedButton(
      child: Text(""),
      onPressed: null,
      key: keyButton,
      style: raisedButtonStyle,
    );

    resultButton.add(button);
  }

  bool estaEnMarkers(double latitude, double longitude) {
    GeoPoint point = GeoPoint(latitude: latitude, longitude: longitude);
    bool esta = false;
    for (MarkersMap map in markers) {
      if (map.location == point) {
        esta = true;
      }
    }
    return esta;
  }

  void eliminarMarker(GeoPoint point) {
    controller.removeMarker(point);

    for (MarkersMap map in markers) {
      if (map.location == point) {
        markers.remove(map);
      }
    }
  }

  void showMarkersInArea() {}

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
                timerCentrar =
                    Timer.periodic(Duration(microseconds: 100), (timer) {
                  controller.centerMap;
                });
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
            showContributorBadgeForOSM: true,
            //trackMyPosition: trackingNotifier.value,
            showDefaultInfoWindow: false,
            onLocationChanged: (myLocation) {
              controller.centerMap;
              controller.rotateMapCamera(0);
              actualPoint = myLocation;
              if (primerMarkador) {
                primerMarkador = false;
                if (!estaEnMarkers(myLocation.latitude + 0.0007,
                    myLocation.longitude + 0.0007)) {
                  generateMarker(myLocation.latitude + 0.0007,
                      myLocation.longitude + 0.0007, Icons.all_out_rounded);
                }
              }
            },
          ),
          Container(
            width: 800,
            height: 800,
            color: Color.fromRGBO(20, 20, 20, 0),
          ),
          Positioned(
              top: 30,
              left: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                ),
                child: Icon(Icons.person_add),
                onPressed: () => {},
              )),

              Positioned(
              top: 80,
              left: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder()
                ),
                child: Icon(Icons.shopping_cart),
                onPressed: () => {},
              )),
          /*
          ElevatedButton(onPressed: CenterMap, child: null),
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          )
*/
          /*
          StatefulBuilder(builder: (_context, _setState) {
            Stack stk = Stack();            
            
            Timer t1 = Timer(Duration(microseconds: 100), () {
              _setState(() {
                for (MarkersMap mrk in markers) {
                  UniqueKey key = mrk.key;
                  if (mrk.activeMarker && mrk.inMap) {
                    generarBoton(key, 0, 0);
                  }
                  else if (!mrk.activeMarker && !mrk.inMap) {
                    for (ElevatedButton btn in resultButton) {
                      if (btn.key == key) {
                        stk.children.remove(btn);
                      }
                    }
                  }
                  else {
                    
                  }

                  for (ElevatedButton btn in resultButton) {
                    stk.children.add(btn);
                  }

                }
              });
            });

            return stk;
          })
          */
        ]),
      ),
    );
  }
}
