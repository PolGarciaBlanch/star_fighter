import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_fighter/control/image_api.dart';
import 'package:star_fighter/control/image_picker.dart';
import 'package:star_fighter/main.dart';
import 'package:star_fighter/widgets/generic_container.dart';

import '../obj/obj_user.dart';
import '../widgets/image_card.dart';

class PantallaPerfil extends StatefulWidget {
  PantallaPerfil({
    Key? key,
  }) : super(key: key);
  //default

  //moded

  @override
  _PantallaPerfilState createState() => _PantallaPerfilState();
}

class _PantallaPerfilState extends State<PantallaPerfil> {
  _PantallaPerfilState();
  ImageApi img = ImageApi();
  ImagePickerLib imgLib = ImagePickerLib();
  ImageFromUrl imUrl = ImageFromUrl();
  User_ user = loggedUser[0];
  String altPers =
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649235499/Images/noFile/nouser.jpg";
  Widget cont = ImageFromUrl.circleImage(
      200,
      200,
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649235499/Images/noFile/nouser.jpg",
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649235499/Images/noFile/nouser.jpg");
  @override
  void initState() {
    cont = LoadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Perfil'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.replay_rounded),
              onPressed: () async {
                await _ReloadImage();
                //ApiDataTrader.initialApiLoad();
                //DBProvider.db.getAllCharacters(characters);
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 300,
                      child: ImageFromUrl.circleImage(200, 200,
                          img.imgUrl + img.pUser + user.id + ".jpg", altPers)),
                  SizedBox(
                      width: 20,
                      child: Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.camera),
                              onPressed: () {
                                imgLib.AccCam(user.id, img.pUser);
                              }),
                          IconButton(
                              icon: Icon(Icons.filter),
                              onPressed: () {
                                imgLib.AccGalery(user.id, img.pUser);
                              }),
                        ],
                      ))
                ],
              ),
              GenericContainer(
                child: Text("Id: " + user.id),
              ),
              GenericContainer(
                  child: Row(
                children: [
                  SizedBox(width: 200, child: Text("Nom: " + user.name)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        icon: Icon(Icons.edit_note),
                        onPressed: () {
                          imgLib.AccGalery(user.id, img.pUser);
                        }),
                  )
                ],
              )),
              GenericContainer(
                child: Row(
                  children: [
                    SizedBox(width: 200, child: Text("Alias: " + user.name)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: Icon(Icons.edit_note),
                          onPressed: () {
                            imgLib.AccGalery(user.id, img.pUser);
                          }),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.red,
                width: 200,
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text("Desconecta sessió"),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          icon: Icon(Icons.exit_to_app),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'pantalla_login');
                          }),
                    )
                  ],
                ),
              ),
              /*TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, 'pantalla_developer');
                  },
                  child: Text("[Developer tests]")),*/
            ],
          ),
        ));
  }

  _ReloadImage() async {
    // wait for 2 seconds to simulate loading of data
    /*await Future.delayed(const Duration(seconds: 10));*/

    setState(() {
      cont = LoadImage();
    });
  }

  LoadImage() {
    return ImageFromUrl.circleImage(
        200, 200, img.imgUrl + img.pUser + user.id + ".jpg", altPers);
  }
}
