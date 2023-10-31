import 'package:flutter/material.dart';
import 'package:profile/presentation/common/common_widgets.dart';
import 'package:profile/presentation/home/desktop_view/about_me_section.dart';
import 'package:profile/presentation/home/desktop_view/contact_me_section.dart';
import 'package:profile/presentation/home/desktop_view/skill_section.dart';
import 'package:profile/presentation/home/mobile_view/gallerySection.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';

class MobilePageView extends StatefulWidget {
  const MobilePageView({super.key});

  @override
  State<MobilePageView> createState() => _MobilePageViewState();
}

class _MobilePageViewState extends State<MobilePageView> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey _heroKey = GlobalKey();
    final GlobalKey _aboutMeKey = GlobalKey();
    final GlobalKey _galleryKey = GlobalKey();
    final GlobalKey _skillsKey = GlobalKey();
    final GlobalKey _contactMeKey = GlobalKey();
    return Scaffold(
      endDrawer: Drawer(
        child: Container(
          color: ColorManager.secondary,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                drawerWidget('Hero', _heroKey),
                drawerWidget('About Me', _aboutMeKey),
                drawerWidget('Skills', _skillsKey),
                drawerWidget('My works', _galleryKey),
                drawerWidget('Contact me', _contactMeKey),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          backgroundColor: ColorManager.primary,
          leadingWidth: 100,
          leading: Text(
            '<Flutter/>',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                key: _heroKey,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: myImage(double.maxFinite, 400, 100, 100)),
            heroDetails(context),
            Container(
                key: _aboutMeKey,
                color: ColorManager.secondary,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: moreAboutMeDetails(context),
                )),
            Padding(
              key: _skillsKey,
              padding: const EdgeInsets.all(10.0),
              child: mySkillsDetails(context),
            ),
            Container(
              key: _galleryKey,
              child: getGalleryMobile(context),
            ),
            const SizedBox(
              height: 50,
            ),
            getContactMe(context, _contactMeKey)
          ],
        ),
      ),
    );
  }

  drawerWidget(String t, GlobalKey key) {
    Color textColor = ColorManager.textColor;
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              Navigator.pop(context);
              Scrollable.ensureVisible(key.currentContext!,
                  duration: const Duration(
                      milliseconds:
                          500), // specify the duration for the animation
                  curve: Curves.easeInOut);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(t)),
          ),
        ),
        Divider(
          color: ColorManager.textColor,
        ),
      ],
    );
  }
}
