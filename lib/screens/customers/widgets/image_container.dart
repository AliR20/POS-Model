import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key, required this.height, required this.width}) : super(key: key);
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: EdgeInsets.all(8.0),
              height: height,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/200/300',
                    ),
                    fit: BoxFit.cover,
                  )),
            );
  }
}