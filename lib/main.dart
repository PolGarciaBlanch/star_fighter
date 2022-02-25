// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pantalla_carga.dart';
import 'package:star_fighter/widgets/option_display.dart';

import 'Pantallas/pantalla_menu.dart';
import 'Pantallas/pantalla_principal.dart';
import 'Pantallas/pantalla_testeo.dart';
import 'firebase_config.dart';
import 'tabs_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);
  runApp(const MyApp());
}

AssetImage imgLogo = const AssetImage('assets/img/AppLogo.png');
AssetImage imgBackground = const AssetImage('assets/img/backGround.jpg');
AssetImage imgShip = const AssetImage('assets/img/xWing.png');

List<String> menuText = ["Perfil"];
List<String> menuNavigator = ["pantalla_perfil"];

//List<Object> parameters =[111123231323, ""]
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Analytics Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: 'pantalla_testeo',
      routes: {
        /*'pantalla_menu': (BuildContext context) => PantallaMenu(
              text: menuText,
              navigator: menuNavigator,
            ),*/
        'pantalla_principal': (BuildContext context) => PantallaPrincipal(),
        'pantalla_testeo': (BuildContext context) => PantallaTesteo(),
        'pantalla_carga': (BuildContext context) => PantallaCarga(
            backGround: imgBackground,
            imgTop: imgLogo,
            imgMid: imgShip,
            appTip:
                'Emp missiles disrupt electronic counter-measures but are vulnerable to flak!'),
      },
    );
  }
}
