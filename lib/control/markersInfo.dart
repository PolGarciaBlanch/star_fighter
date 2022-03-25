/*
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:star_fighter/Pantallas/pantalla_principal.dart';
import 'dart:async';
import 'dart:math';

import '../models/markers.dart';

class MarkersInfo {
  List<MarkersMap> markers = [];
  List<String> markersNames = [];
  bool primerMarkador = true;
  double radMarker = 0.0005;
  bool visibleListView = false;

  void generateMarker(double latitude, double longitude, IconData icono,
      CustomController controller, String name) {
    MarkerIcon mrkIcon = newMarkerIcon(icono);

    GeoPoint point = GeoPoint(latitude: latitude, longitude: longitude);

    MarkersMap varMrk = MarkersMap(
        location: point, iconMarker: mrkIcon, icono: icono, name: name);
    markers.add(varMrk);
    controller.addMarker(point, markerIcon: mrkIcon, angle: 0);
  }

  MarkerIcon newMarkerIcon(IconData icono) {
    return MarkerIcon(
      icon: Icon(
        icono,
        color: Color.fromRGBO(255, 255, 255, 100),
        size: 100,
      ),
    );
  }

  Widget MarkersListView() {
    if (visibleListView) {
      return Container(
        margin: EdgeInsets.all(100),
        width: 300,
        height: 300,
        color: Color.fromRGBO(255, 255, 255, 95),
        child: ListView.builder(
          itemCount: markersNames.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(getIconoFromListMarkers(markersNames[index])),
                title: Text(markersNames[index]),
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }

  IconData getIconoFromListMarkers(String name) {
    IconData icono = Icons.add_box;
    for (MarkersMap mrk in markers) {
      if (mrk.name == name) {
        icono = mrk.icono;
      }
    }
    return icono;
  }

  void eliminarMarker(GeoPoint point, CustomController controller) {
    controller.removeMarker(point);

    for (MarkersMap map in markers) {
      if (map.location == point) {
        markers.remove(map);
      }
    }
  }

  bool estaEnMarkers(
      double latitude, double longitude, CustomController controller) {
    GeoPoint point = GeoPoint(latitude: latitude, longitude: longitude);
    bool esta = false;
    for (MarkersMap map in markers) {
      if (map.location == point) {
        esta = true;
      }
    }
    return esta;
  }
}
*/