import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_model/screens/login/services/firebase_services.dart';
import 'package:pos_model/screens/transactions/utils/const.dart';

import '../../../utils/responsive.dart';

class UploadProductContainer extends StatefulWidget {
  @override
  State<UploadProductContainer> createState() => _UploadProductContainerState();
}

class _UploadProductContainerState extends State<UploadProductContainer> {
  Uint8List? images;
  Uint8List? webImage;

  Future<Uint8List> getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final imagePicked =
        await imagePicker.pickImage(source: ImageSource.gallery);
    final imageFile = await imagePicked!.readAsBytes();
    setState(() {
      images = imageFile;
    });
    return images!;
  }

  Future getWebFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List file = result.files.single.bytes!;
      setState(() {
        webImage = file;
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await getWebFile();
          if (webImage != null) {
            await FirebaseMethods.storeWebImage(webImage!, 'Products');
          } else if (images != null) {
            await FirebaseMethods.storeMobileImage(
              images!,
              'Products',
            );
          }
        },
        child: Container(
            height: 170,
            width: 635,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
                border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary, width: 1)),
            child: webImage == null
                ? Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Stack(
                        children: [
                          Icon(
                            Icons.folder,
                            size: 80.0,
                            color: Colors.yellow.shade600,
                          ),
                          Positioned(
                            right: -0.3,
                            bottom: -0.3,
                            child: Icon(
                              Icons.add_circle_sharp,
                              size: 50.0,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Upload Product Image',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  )
                : Image.memory(webImage!)));
  }
}
