import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MarkersMap {
  String text;
  Icon? icono;
  GeoPoint location;
  MarkerIcon iconMarker;
  String text;

  MarkersMap(
      {required this.location, required this.iconMarker, required this.icono, required this.text});

}
