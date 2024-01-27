
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = true]) async {
  FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);

  if (file != null) {
    return File(file.files.single.path!);
  } else {
    return null;
  }
}

showBottomMenu(Function() imageUploadCamera, Function() fileUploadGallery) {
  Get.bottomSheet(Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: const Text(
                "Choose Image From Gallery",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              leading: const Icon(
                Icons.camera,
                size: 40,
              ),
              title: const Text(
                "Choose Image From Camera",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: const Icon(
                Icons.image,
                size: 40,
              ),
              title: const Text(
                "Image from gallery",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      )
    ),
    backgroundColor: Colors.white
  );   
}
