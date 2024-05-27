import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:uuid/uuid.dart';

class ImageUploader extends ChangeNotifier {
  var uid = Uuid();
  final ImagePicker _picker = ImagePicker();

  List<String> imageFile = [];
  String? imageUrl;
  String? imagePath;
  void pickImage() async {
    // ignore: no_leading_underscores_for_local_identifiers

    XFile? _imageFile = await _picker.pickImage(source: ImageSource.gallery);

    if (_imageFile != null) {
      // Crop the image

      _imageFile = await cropImage(_imageFile);
      if (_imageFile != null) {
        imageFile.add(_imageFile.path);
          uploadImage(_imageFile);
        imagePath = _imageFile.path;
      } else {
        return;
      }
    }
  }

  Future<XFile?> cropImage(XFile imageFile) async {
    // Crop the image using image_cropper package
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1920,
      compressQuality: 80,
      cropStyle: CropStyle.rectangle,
      aspectRatioPresets: [CropAspectRatioPreset.ratio4x3],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'JobSathi Cropper',
            toolbarColor: Color(kLightBlue.value),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.ratio4x3,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) {
      notifyListeners();
      return XFile(croppedFile.path);
    } else {
      return null;
    }
  }

  Future<String?> uploadImage(XFile upload) async {
    //Upload the image to Firebase Storage
    File image = File(upload.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('jobsathi')
        .child("${uid.v1()}.jpg");
    await ref.putFile(image);
    imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
  //  imageUpload() async {
  //   final ref =
  //       FirebaseStorage.instance.ref().child('jobhub').child('${uid}jpg');
  //   await ref.putFile(imageUrl[0]);
  //   imageUrl = await ref.getDownloadURL();
  // }
}
