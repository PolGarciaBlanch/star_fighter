import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MarkersMap {
  GeoPoint location;
  UniqueKey key;
  MarkerIcon iconMarker;
  int X_Location = 0;
  int Y_Location = 0;

  MarkersMap(
      {required this.location, required this.iconMarker, required this.key});
}
