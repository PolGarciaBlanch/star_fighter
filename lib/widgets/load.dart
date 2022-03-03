import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Load extends StatefulWidget {
  final String nextPage;
  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final String appTip;
  const Load({Key? key, 
      required this.nextPage,
      required this.backGround,
      required this.imgTop,
      required this.imgMid,
      required this.appTip}) : super(key: key);

  @override
 LoadState createState() => LoadState(nextPage, backGround, imgTop, imgMid, appTip);
}

class LoadState extends State Load> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}