import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:star_fighter/Pantallas/pant_developer_test.dart';
import 'package:star_fighter/Pantallas/pantalla_carga.dart';
import 'package:star_fighter/Pantallas/pantalla_crear_usr.dart';
import 'package:star_fighter/Pantallas/pantalla_login.dart';
import 'Pantallas/pant_nav.dart';
import 'Pantallas/pantalla_perfil.dart';
import 'Pantallas/pantalla_principal.dart';
import 'Pantallas/pantalla_qr.dart';
import 'Pantallas/pantalla_scanqr.dart';
import 'Pantallas/pantalla_testeo.dart';
import 'control/firabase_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

//List<Object> parameters =[111123231323, ""]
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> msgCarga = [
      'Emp missiles disrupt electronic counter-measures but are vulnerable to flak!',
      'Meteorites and proyectiles ignore shields',
      'Shield tecnology protects from plasma'
    ];
    //CustomData FirebaseIOLib = CustomData(app: Firebase.app());

    AssetImage imgLogo = const AssetImage('assets/img/AppLogo.png');
    AssetImage imgBackground = const AssetImage('assets/img/backGround.jpg');
    AssetImage imgShip = const AssetImage('assets/img/xWing.png');
    return MaterialApp(
      title: 'Star Fighter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      initialRoute: 'pantalla_developer',

      //initialRoute: 'PantNav',

      debugShowCheckedModeBanner: false,
      routes: {
        'pantalla_developer': (BuildContext) => PantDev(),
        'confPerfil': (BuildContext) => PantallaPerfil(),
        'PantNav': (BuildContext) => PantNav(lista: "Ajustes"),
        'pantalla_login': (BuildContext context) => const Login(),
        'pantalla_crea_usr': (BuildContext context) => const Create(),

        //'pantalla_principal': (BuildContext context) => PantallaPrincipal(),

        'pantalla_testeo': (BuildContext context) => PantallaTesteo(),
        //'pantalla_qrView': (BuildContext context) => QRView(),
        //'pnatalla_qrShow': (BuildContext context) => QRShow(),

        'login_temp': (BuildContext context) => PantallaCarga(
            backGround: imgBackground,
            imgTop: imgLogo,
            imgMid: imgShip,
            appTip: msgCarga,
            path: 'pantalla_login'),
        'carga_test': (BuildContext context) => PantallaCarga(
            backGround: imgBackground,
            imgTop: imgLogo,
            imgMid: imgShip,
            appTip: msgCarga,
            path: 'pantalla_principal'),
      },
    );
  }
}
