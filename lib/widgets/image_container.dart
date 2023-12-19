import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const ImageContainer({
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const Icon(
        Icons.error,
      ),
      // child: CachedNetworkImage(
      //   imageUrl: imageUrl,
      //   fit: BoxFit.cover,
      //   errorWidget: (context, url, error) => const Icon(
      //     Icons.error,
      //   ),
      // ),
    );
  }
}
