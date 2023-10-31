import 'package:flutter/material.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';

getSkills(BuildContext context, GlobalKey key) {
  return Container(
    key: key,
    width: double.maxFinite,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.p30),
      child: mySkillsDetails(context),
    ),
  );
}

Column mySkillsDetails(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "My Skills",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      const SizedBox(
        height: 70,
      ),
      myTitle(context, "Programming Language :"),
      myLinearIndicator(context, "Dart", 0.7),
      myLinearIndicator(context, "python", 0.5),
      myLinearIndicator(context, "C++", 0.4),
      myLinearIndicator(context, "Gd Script", 0.4),
      myLinearIndicator(context, "Arduino", 0.4),
      const SizedBox(
        height: 20,
      ),
      myTitle(context, " FrameWorks:"),
      myLinearIndicator(context, "Flutter", 0.7),
      myLinearIndicator(context, "godot", 0.3),
      const SizedBox(
        height: 20,
      ),
      myTitle(context, "Languages:"),
      myLinearIndicator(context, "Arabic(native)", 0.95),
      myLinearIndicator(context, "English", 0.6),
    ],
  );
}

Padding myLinearIndicator(BuildContext context, String s, double x) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: SizeManager.p30 * 2),
    child: FractionallySizedBox(
      widthFactor: 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          LinearProgressIndicator(
            backgroundColor: ColorManager.grey,
            minHeight: 10,
            value: x,
            borderRadius: BorderRadius.circular(15),
            color: ColorManager.textColor,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  );
}

Padding myTitle(BuildContext context, String s) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: SizeManager.p30),
    child: Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.donut_large,
            color: ColorManager.emeraid,
          ),
          title: Text(
            s,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}
