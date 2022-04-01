import 'dart:collection';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';

String cloudinaryCustomFolder = "test/myfolder";
String cloudinaryApiKey = "912599646435741";
String cloudinaryApiSecret = "TwS9X9Qi-OQTmli4uhCQlB-VIFA";
String cloudinaryCloudName = "didy88ckl";

class ImageApi {
  final Cloudinary cloudinary =
      Cloudinary(cloudinaryApiKey, cloudinaryApiSecret, cloudinaryCloudName);
  final String initUrl = "";

  //GETIMAGE

  ///MANAGE IMAGES
  UploadImage(String filePath, String fileName) {
    cloudinary.uploadFile(
        filePath: filePath,
        fileName: "img2",
        folder: cloudinaryCustomFolder,
        resourceType: CloudinaryResourceType.image);
  }

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

  //deltete image
  ReplaceImage(String url, String filePath) {
    DleleteImage(url);
    UploadImage(filePath, GetNamefromUrl(url));
  }

  //IMAGE FROM PHONE

  //IMAGE FROM PICTURE

}
