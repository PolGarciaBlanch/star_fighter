// ignore: unused_import
// ignore_for_file: prefer_const_constructors, unnecessary_new

// ignore: unused_import

/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Future<GeolocationStatus> geolocationStatus = Geolocator().checkGeolocationPermissionStatus();

  late final MapController _mapController;

  bool _liveUpdate = false;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    initLocationService();
  }

  void initLocationService() async {
    //LocationPermission permission = await Geolocator.requestPermission();
    _mapController.onReady;
    _mapController.move(LatLng(0, 0), 0);
  }
  /*
    await _locationService.changeSettings(
      interval: 1000,
    );
*/
/*
    LocationData locationActual;
    bool serviceEnabled;
    bool serviceRequestResult;

    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.always) {
        locationActual = await _locationService.getLocation();
        _locationService.onLocationChanged.listen((LocationData result) async {
          if (mounted) {
            setState(() {
              // If Live Update is enabled, move map center
              if (_liveUpdate) {
                double Lat = result.latitude ?? 0;
                double Lon = result.longitude ?? 0;

                _mapController.move(LatLng(Lat, Lon), _mapController.zoom);
              }
            });
          }
        });
      }
    }
  }*/
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  /*
    try {
      serviceRequestResult = await _locationService.requestService();
    } on Exception catch (e) {
      print(e);
    }
    try {
      serviceEnabled = await _locationService.serviceEnabled();

      if (serviceEnabled) {
        var permission = await _locationService.requestPermission();
        _permission = permission == PermissionStatus.granted;

        if (_permission) {
          locationActual = await _locationService.getLocation();
          _locationService.onLocationChanged
              .listen((LocationData result) async {
            if (mounted) {
              setState(() {
                // If Live Update is enabled, move map center
                if (_liveUpdate) {
                  double Lat = result.latitude ?? 0;
                  double Lon = result.longitude ?? 0;

                  _mapController.move(LatLng(Lat, Lon), _mapController.zoom);
                }
              });
            }
          });
        }
      } else {
        serviceRequestResult = await _locationService.requestService();
        if (serviceRequestResult) {
          initLocationService();
          return;
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        _serviceError = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        _serviceError = e.message;
      }
    } on Exception catch (e) {
      print(e);
      
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    //initState();
    /*
      var markers = <Marker>[
        Marker(
          width: 80.0,
          height: 80.0,
          point: currentLatLng,
          builder: (ctx) => Container(
            child: FlutterLogo(
              textColor: Colors.blue,
              key: ObjectKey(Colors.blue),
            ),
          ),
        ),
      ];
    */
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      //drawer: buildDrawer(context, LiveLocationPage.route),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center: LatLng(_mapController.center.latitude,
                      _mapController.center.longitude),
                  zoom: 5.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    // For example purposes. It is recommended to use
                    // TileProvider with a caching and retry strategy, like
                    // NetworkTileProvider or CachedNetworkTileProvider
                    tileProvider: NonCachingNetworkTileProvider(),
                  ),
                  //MarkerLayerOptions(markers: markers)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              _liveUpdate = !_liveUpdate;

              if (_liveUpdate) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'In live update mode only zoom and rotation are enable'),
                ));
              } else {}
            });
          },
          child:
              _liveUpdate ? Icon(Icons.location_on) : Icon(Icons.location_off),
        );
      }),
    );
  }

/*
  getUserLocation() async {
    _currentPosition = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
*/
/*
  _getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
  }
  */

  /*

  Future<GeolocationStatus> geolocationStatus =
      Geolocator().checkGeolocationPermissionStatus();

  Position position =
      Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // ignore: unused_local_variable

  Future<void> _incrementCounter() async {}

  @override
  Widget build(BuildContext context) {
    double latitude = 0;
    double longitude = 0;

    StreamSubscription<Position> positionStream = Geolocator()
        .getPositionStream()
        .listen((Position pos) =>
            {position = pos});

    positionStream.asFuture(position);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              latitude.toString() + " - " + longitude.toString(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
    */
}
*/