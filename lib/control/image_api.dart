import 'dart:convert';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/cupertino.dart';

String cloudinaryCustomFolder = "test/myfolder";
String cloudinaryApiKey = "912599646435741";
String cloudinaryApiSecret = "TwS9X9Qi-OQTmli4uhCQlB-VIFA";
String cloudinaryCloudName = "didy88ckl";

class ImageApi {
  final Cloudinary cloudinary =
      Cloudinary(cloudinaryApiKey, cloudinaryApiSecret, cloudinaryCloudName);
  final String initUrl = "";
  String imgUrl =
      "https://res.cloudinary.com/didy88ckl/image/upload/v1649347233/";
  String URL =
      "https://res.cloudinary.com/didy88ckl/image/upload/v1648893757/Images/Clan/key.jpg";

  //RUTAS
  String pUser = "Images/Profile/";
  String pClan = "Images/Clan/";
  String pShip = "Images/Ship/";
  String pMod = "Images/Mod/";

  ///MANAGE IMAGES
  UploadImage(String filePath, String apiFolder, String fileName) {
    cloudinary.uploadFile(
        filePath: filePath,
        fileName: fileName,
        folder: apiFolder,
        resourceType: CloudinaryResourceType.image);
  }

  /*UploadPlaceholder(String urlPlacehldr, String apiFolder, String fileName) {
    Image ac = Image(image: NetworkImage(urlPlacehldr));

    List<int> bytes = utf8.encode(ac.toString());

    cloudinary.uploadFile(
        fileBytes: bytes,
        fileName: fileName,
        folder: apiFolder,
        resourceType: CloudinaryResourceType.image);
  }*/

/*
  String UploadImages() {
    String requestId = MediaManager.get()
        .upload("dog.mp4")
        .unsigned("preset1")
        .option("resource_type", "video")
        .option("folder", "myfolder/mysubfolder/")
        .option("public_id", "my_dog")
        .option(
            "notification_url", "https://mysite.example.com/notify_endpoint")
        .dispatch();

    return requestId;
  }
*/
  DleleteImage(String url) {
    cloudinary.deleteFile(
      url: url,
      resourceType: CloudinaryResourceType.image,
      invalidate: false,
    );
  }

  String GetNamefromUrl(String url) {
    return url.substring(initUrl.length, url.length - initUrl.length);
  }
/*
  //deltete image
  ReplaceImage(String url, String filePath) {
    DleleteImage(url);
    UploadImage(filePath, GetNamefromUrl(url));
  }*/

  //IMAGE FROM PHONE

  //IMAGE FROM PICTURE

}
