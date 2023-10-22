import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        leading: Text(
          '<Flutter>',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leadingWidth: 200,
        actions: [
          appBarWidget("About me"),
          _divider(),
          appBarWidget("Skills"),
          _divider(),
          appBarWidget("Gallery"),
          _divider(),
          appBarWidget("Contact me"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            getHero(context),
            const SizedBox(
              height: 150,
            ),
            Container(
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
                    child: Column(
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
                    ),
                  )
                ],
              ),
            )
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

  Padding appBarWidget(String t) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text(t)),
    );
  }

  getHero(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Column(
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
            ),
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
}
