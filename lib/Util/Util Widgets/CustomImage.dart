import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String src;
  final BoxFit fit;
  final Color? color;
  final bool assetImage;
  final bool forProfile;
  final bool isAdminRequired;
  final double radius;
  final bool avatar;

  CustomImage(this.src,
      {this.height,
      this.width,
      this.fit = BoxFit.fill,
      this.color,
      this.forProfile = false,
      this.isAdminRequired = true,
      this.assetImage = true,
      this.radius = 0,
      this.avatar = false});

  @override
  Widget build(BuildContext context) {
    String imgUrl = "";
    // String imgUrl = IMAGE_API_URL;
    // print('000000000000.... ${imgUrl}/${src}');
    double _height = height ?? 101;
    return src.contains('.svg') && assetImage
        ? SvgPicture.asset(
            src,
            height: height,
            width: width,
            fit: fit,
            color: color,
          )
        : assetImage
            ? Image.asset(
                src,
                height: height,
                width: width,
                fit: fit,
                color: color,
              )
            :
            src.contains('.svg') && !assetImage
                ? SvgPicture.network(
                    '$imgUrl/$src',
                    height: height,
                    width: width,
                    fit: fit,
                  )
                : Image.network(
                    '$imgUrl/$src',
                    height: height,
                    width: width,
                    fit: fit,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Image.asset(
                        'assets/images/loading_placeholder.gif',
                        height: height,
                        width: width,
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return avatar
                              ? Image.asset(
                                  'assets/images/human.png',
                                  height: _height > 100 ? 100 : height,
                                  width: width,
                                )
                              : Image.asset(
                                  'assets/images/no_image_placeholder.jpg',
                                  height: _height > 100 ? 100 : height,
                                  width: width,
                                );
                    },
                  );
  }
}
