import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String urlToImage;

  const ArticleImage({required this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlToImage,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, downloadProcess) => Center(
        child: CircularProgressIndicator(
          value: downloadProcess.progress,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        child: Icon(
          Icons.error,
        ),
      ),
    );
  }
}
