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

  void generateMarker(double latitude, double longitude, String iconName,
      String color, double sizeIcon, CustomController controller, String name) {
    MarkerIcon mrkIcon = newMarkerIcon(iconName, color, sizeIcon);


    GeoPoint point = GeoPoint(latitude: latitude, longitude: longitude);

    MarkersMap varMrk = MarkersMap(location: point, iconMarker: mrkIcon, icono: mrkIcon.icon, text: name);

    markers.add(varMrk);

    controller.addMarker(point, markerIcon: mrkIcon, angle: 0);
  }

  MarkerIcon newMarkerIcon(String iconName, String color, double sizeIcon) {
    return MarkerIcon(icon: GetIconFromString(iconName, color, sizeIcon));
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
                leading: getIconoFromListMarkers(markersNames[index]),
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

  Icon? getIconoFromListMarkers(String name) {
    Icon? icono;
    for (MarkersMap mrk in markers) {
      if (mrk.text == name) {
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

  Color GetColorFromString(String color) {
    switch (color) {
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      case "black":
        return Colors.black;
      case "purple":
        return Colors.purple;
      case "green":
        return Colors.green;
      case "grey":
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  Icon GetIconFromString(String nombreIcono, String color, double sizeIcon) {
    Icon icono;
    switch (nombreIcono.toLowerCase()) {
      case "player":
        icono = Icon(
          Icons.flight,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;
      case "game1":
        icono = Icon(
          Icons.videogame_asset_rounded,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;
      case "station":
        icono = Icon(
          Icons.warehouse,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;
      case "lootbox":
        icono = Icon(
          Icons.view_in_ar,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;

      case "combat":
        icono = Icon(
          Icons.warning_amber_rounded,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;

      default:
        icono = Icon(
          Icons.flight,
          color: GetColorFromString(color),
          size: sizeIcon,
        );
        break;
    }
    return icono;
  }
}
*/