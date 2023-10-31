import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile/presentation/home/desktop_view/about_me_section.dart';
import 'package:profile/presentation/home/desktop_view/contact_me_section.dart';
import 'package:profile/presentation/home/desktop_view/gallery_section.dart';
import 'package:profile/presentation/home/desktop_view/hero_section.dart';
import 'package:profile/presentation/home/desktop_view/skill_section.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/image_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';
import 'package:profile/presentation/resources/string_manager.dart';

class DesktopPageView extends StatefulWidget {
  const DesktopPageView({super.key});

  @override
  State<DesktopPageView> createState() => _DesktopPageViewState();
}

class _DesktopPageViewState extends State<DesktopPageView> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactMeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: Text(
          '<Flutter/>',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leadingWidth: 200,
        actions: [
          appBarWidget("Hero", _heroKey),
          _divider(),
          appBarWidget("About me", _aboutMeKey),
          _divider(),
          appBarWidget("Skills", _skillsKey),
          _divider(),
          appBarWidget("Gallery", _galleryKey),
          _divider(),
          appBarWidget("Contact me", _contactMeKey),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            getHero(context, _heroKey),
            const SizedBox(
              height: 150,
            ),
            getAboutMe(context, _aboutMeKey),
            const SizedBox(
              height: 100,
            ),
            getSkills(context, _skillsKey),
            getGallery(context, _galleryKey),
            const SizedBox(
              height: 50,
            ),
            getContactMe(context, _contactMeKey)
          ],
        ),
      ),
    );
  }

  Padding _divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: VerticalDivider(
        color: ColorManager.textColor,
      ),
    );
  }

  appBarWidget(String t, GlobalKey key) {
    Color textColor = ColorManager.textColor;
    return InkWell(
      onTap: () {
        setState(() {
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
    );
  }
}
