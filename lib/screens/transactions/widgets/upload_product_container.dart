import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:pos_model/screens/login/services/firebase_services.dart';

import '../utils/const.dart';

class UploadProductContainer extends StatefulWidget {
  @override
  State<UploadProductContainer> createState() => _UploadProductContainerState();
}

class _UploadProductContainerState extends State<UploadProductContainer> {
  Uint8List? images;
  Uint8List? webImage;


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final webImages = await getWebFile(webImage!);
          setState(() {
            webImage = webImages;
          });
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
