import 'package:flutter/cupertino.dart';

class ImageFromUrl {
  static Widget circleImage(
      double height, double width, String Url, String Alt) {
    bool uri = false;
    uri = Uri.tryParse(Url)?.hasAbsolutePath ?? false;
    if (uri = false) {
      Url = Alt;
    }

    print(Url);
    return Container(
      child: Container(
        height: height,
        width: width,
        constraints: BoxConstraints(),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: Color(0x33000000)),
              BoxShadow(
                  offset: Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: Color(0x24000000)),
              BoxShadow(
                  offset: Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: Color(0x1f000000))
            ],
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(Url))),
      ),
    );
  }
  /*
   isValidLink(Uri url)  {

    bool test=false;
    var client = http.Client();
    http.Response _response =  client.head(url);
    if (_response.statusCode == 404) {
      print('Bad - ${article.downloadUrl}');
    } else {
      print('Good - ${article.downloadUrl}');
    }

    return test;
*/
}
