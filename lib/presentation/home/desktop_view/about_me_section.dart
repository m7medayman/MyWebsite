import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/image_manager.dart';
import 'package:profile/presentation/resources/string_manager.dart';

Container getAboutMe(BuildContext context, GlobalKey key) {
  return Container(
    key: key,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    width: double.maxFinite,
    color: ColorManager.secondary,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 1, child: Lottie.asset(ImageManager.myLotti)),
        Expanded(
          flex: 1,
          child: moreAboutMeDetails(context),
        )
      ],
    ),
  );
}

Column moreAboutMeDetails(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Center(
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.grey,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "More about me",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        StringManager.aboutMe1,
        style: Theme.of(context).textTheme.bodyLarge,
        strutStyle: StrutStyle(height: 2),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        StringManager.aboutMe3,
        style: Theme.of(context).textTheme.bodyLarge,
        strutStyle: StrutStyle(height: 2),
      )
    ],
  );
}
