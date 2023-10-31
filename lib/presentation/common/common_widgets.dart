import 'package:flutter/material.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/image_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';
import 'package:profile/presentation/resources/string_manager.dart';

Container banner(BuildContext context, String s) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: ColorManager.grey,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        s,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  );
}

SizedBox myImage(
    double width, double height, double imageWidth, double imageHeight) {
  return SizedBox(
    height: height,
    width: width,
    child: AspectRatio(
      aspectRatio: 16 / 900,
      child: Image.asset(
        ImageManager.myImage,
        fit: BoxFit.contain,
        width: imageWidth,
        height: imageHeight,
      ),
    ),
  );
}

Column heroDetails(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "👋 Hi,I'm Mohamed ",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      Text(
        StringManager.hiBody1,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      ListTile(
        leading: const Icon(
          Icons.location_pin,
          color: ColorManager.textColor,
        ),
        title: Text(
          'Cairo,Egypt',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      const SizedBox(
        height: 70,
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.flutter_dash),
          Icon(Icons.engineering),
          Icon(Icons.leaderboard)
        ],
      )
    ],
  );
}
