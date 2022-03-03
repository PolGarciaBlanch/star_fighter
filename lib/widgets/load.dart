import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Load extends StatefulWidget {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final String appTip;
  const Load({Key? key, 

      required this.backGround,
      required this.imgTop,
      required this.imgMid,
      required this.appTip}) : super(key: key);

  @override
  _LoadState createState() => _LoadState(backGround, imgTop, imgMid, appTip);
}

class _LoadState extends State<Load>
    with TickerProviderStateMixin {

  final AssetImage backGround;
  final AssetImage imgTop;
  final AssetImage imgMid;
  final String appTip;
  _LoadState( this.backGround, this.imgTop, this.imgMid, this.appTip);
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 600,
            height: 800,
            color: Colors.black,
            child: (Stack(
              children: [
                Image(image: backGround, width: 500, height: 1000),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, top: 50, right: 20, bottom: 20),
                  width: 800,
                  height: 800,
                  color: Colors.red.withOpacity(0.02),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(image: imgTop),
                      Container(
                        width: 300,
                        height: 300,
                        child: Image(image: imgMid),
                      ),
                      LinearProgressIndicator(
                        value: controller.value,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                      Container(
                        width: 500,
                        height: 100,
                        padding: const EdgeInsets.only(
                            left: 20, top: 5, right: 20, bottom: 5),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              appTip,
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow),
                            )),
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            border: Border.all(color: Colors.yellow),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(2.0, 2.0),
                              )
                            ]),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

}