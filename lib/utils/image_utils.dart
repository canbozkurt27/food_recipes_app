import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class ImageUtil {
  static Image assetImageUtil({required String imageName, double? height, double? width}) {
    return Image.asset(
      "assets/images/$imageName",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }

    static Image assetImageUtilv2({required String imageName, double? height, double? width}) {
    return Image.asset(
      "$imageName",
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }


  static SvgPicture assetSvgPictureUtil({required String svgName, double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      "assets/svg/$svgName.svg",
      height: height,
      width: width,
      // ignore: deprecated_member_use
      color: color,
      fit: BoxFit.contain,
    );
  }

  static LottieBuilder assetLottieUtil({required String lottieName, double? height, double? width, Animation<double>? controller, Color? color, BoxFit? boxFit, FrameRate? frameRate, bool? animate}) {
    return Lottie.asset(
      filterQuality: FilterQuality.low,
      "assets/json/$lottieName.json",
      height: height,
      animate: animate ?? true,
      width: width,
      controller: controller,
      fit: boxFit,
      frameRate: frameRate ?? const FrameRate(60),
    );
  }

  static Image assetGifUtil({required String imageName, required double height}) {
    return Image.asset(
      "assets/gif/$imageName.gif",
      fit: BoxFit.cover,
      height: height,
    );
  }
}
