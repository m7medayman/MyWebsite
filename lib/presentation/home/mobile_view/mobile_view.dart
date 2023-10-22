import 'package:flutter/material.dart';
import 'package:profile/presentation/resources/color_manager.dart';

class MobilePageView extends StatefulWidget {
  const MobilePageView({super.key});

  @override
  State<MobilePageView> createState() => _MobilePageViewState();
}

class _MobilePageViewState extends State<MobilePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.secondary,
    );
  }
}
