import 'package:flutter/material.dart';
import 'package:profile/presentation/common/common_widgets.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/image_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';
import 'package:profile/presentation/resources/string_manager.dart';

getHero(BuildContext context, GlobalKey key) {
  return Padding(
    key: key,
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: heroDetails(context),
        ),
        Expanded(
            flex: 3,
            child: FractionallySizedBox(
                widthFactor: 0.5, // Takes 50% of parent's width
                child: _myImage())),
      ],
    ),
  );
}

SizedBox _myImage() {
  return SizedBox(
    height: 400,
    child: AspectRatio(
      aspectRatio: 16 / 900,
      child: Image.asset(
        ImageManager.myImage,
        fit: BoxFit.contain,
        width: SizeManager.s200,
        height: SizeManager.s200,
      ),
    ),
  );
}
