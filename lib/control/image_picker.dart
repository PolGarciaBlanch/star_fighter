import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:star_fighter/control/image_api.dart';

class ImagePickerLib {
  ImageApi imApi = new ImageApi();
  ImagePicker iPk = new ImagePicker();
  AccCam() async {
    XFile? image = await iPk.pickImage(source: ImageSource.camera);
    if (image != null) {
      imApi.UploadImage(image.path, image.path);
    }
  }

  AccGalery() async {
    XFile? image = await iPk.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imApi.UploadImage(image.path, image.path);
    }
  }
}
