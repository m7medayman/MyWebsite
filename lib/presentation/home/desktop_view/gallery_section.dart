import 'package:flutter/material.dart';
import 'package:profile/presentation/common/common_widgets.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:profile/presentation/resources/image_manager.dart';
import 'package:profile/presentation/resources/size_manager.dart';
import 'package:profile/presentation/resources/string_manager.dart';
import 'package:url_launcher/url_launcher.dart';

getGallery(BuildContext context, GlobalKey key) {
  return Container(
    key: key,
    width: double.maxFinite,
    color: ColorManager.secondary,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          banner(context, "My Works"),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeManager.p30 + 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0),
              child: showApp(
                  context,
                  'Clean Architecture shop App',
                  'I build this app to apply the clean architecture pattern on it . Features include:',
                  featuresApp1,
                  ImageManager.shopProjectPhoto,
                  url:
                      'https://github.com/m7medayman/cleanArchitectureShopApp'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizeManager.p30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 0),
              child: showApp(
                  context,
                  'My Website',
                  "After countless hours of coding and design, I'm thrilled to unveil my personal website, crafted meticulously using the Flutter framework. . Features include:",
                  featuresApp2,
                  ImageManager.profileProject),
            ),
          ),
        ],
      ),
    ),
  );
}

InkWell showApp(BuildContext context, String appNAme, String appDetails,
    List appFeatures, String photoPath,
    {String? url}) {
  return InkWell(
    onTap: () {
      if (url == null) return;
      _launchUrl(url);
    },
    child: IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child:
                  getProjectDetails(context, appNAme, appDetails, appFeatures)),
          Expanded(flex: 1, child: getProjectImage(photoPath))
        ],
      ),
    ),
  );
}

Container getProjectDetails(BuildContext context, String projectName,
    String projectDescription, List features) {
  return Container(
    decoration: const BoxDecoration(
        color: ColorManager.darkGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            projectName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 15),
          Text(
            projectDescription,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          ..._featureList(context, features),
        ],
      ),
    ),
  );
}

Container getProjectImage(String photo) {
  return Container(
    decoration: const BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500),
              child: Image.asset(
                photo,
              ),
            )),
      ),
    ),
  );
}

var featuresApp1 = [
  '🏗️ Clean Architecture: Built for maintainability and scalability.',
  '☁️ Firebase Backend: Leveraging the power of Firebase for seamless backend integration.',
  '🔃 Bloc State Management: Efficient and organized data flow.',
  '🛂 User Authentication: Robust signup and signin modules.',
  '🌍 Localization: Multilingual support via easy_localization.',
  '📡 Request/Response Handling: Integrated with Dio, JSON Serializable, and Retrofit for seamless API interactions.',
  '🚫 Error Management: Graceful error handling for a better user experience.',
  '🔄 Page State Management: Context-aware UI updates (like loading indicators during fetch operations).'
];
var featuresApp2 = [
  '🏗️ Clean Architecture: Built for maintainability and scalability.',
  '🖥️ Responsive Design: Optimal viewing on all devices, from desktops to phones.',
  '🌙 Dynamic Theme Management',
  '🎭 Interactive Animations: Smooth transitions and motions enhancing user interactivity.',
];

List<Widget> _featureList(BuildContext context, List featureList) {
  return featureList.map((feature) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          '• ' + feature,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }).toList();
}

Container workPanner(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: ColorManager.grey,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        "My Works",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ),
  );
}

Future<void> _launchUrl(String _url) async {
  if (!await launchUrl(Uri.parse(_url))) {
    throw Exception('Could not launch $_url');
  }
}
