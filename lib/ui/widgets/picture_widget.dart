import 'dart:io';

import 'package:flutter/material.dart';

import 'circular_cached_image.dart';

class PictureWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final double radius;
  final String errorPath;
  final bool isEditable;
  final Color borderColor;
  final BoxFit fit;

  const PictureWidget(
      {Key? key,
      required this.imageUrl,
      this.onTap,
      this.width = 50,
      this.height = 50,
      this.radius = 70,
      this.isEditable = false,
      this.borderColor = const Color(0xff5a46ff),
      required this.errorPath,
      this.fit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEditable ? onTap : null,
      child: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [

            imageUrl.contains('http')
                ? CircularCachedImage(
                    imageUrl: imageUrl,
                    width: width,
                    height: height,
                    borderRadius: radius,
                    errorPath: errorPath,
                  )
                : Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(color: borderColor),
                      image: DecorationImage(
                        fit: fit,
                        image: imageUrl.contains('assets/')
                            ? AssetImage(imageUrl) as ImageProvider
                            : FileImage(
                                File(imageUrl),
                              ),
                      ),
                    ),
                  ),
            Positioned(
              right: 3,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(40)),

                  padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.green, borderRadius: BorderRadius.circular(40)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
