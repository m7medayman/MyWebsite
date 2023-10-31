import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:profile/presentation/common/common_widgets.dart';
import 'package:profile/presentation/resources/color_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'desktop_view.dart';

getContactMe(BuildContext context, GlobalKey key) {
  return Container(
    key: key,
    width: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        banner(context, "get in touch"),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Phone:+201090849580",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HoverignIcon(
              getIcon: LineIcon.github,
              url: "https://github.com/m7medayman",
            ),
            HoverignIcon(
              getIcon: LineIcon.linkedin,
              url:
                  "https://www.linkedin.com/in/mohamed-ayman-mahgoub-46043a1bb/",
            ),
            HoverignIcon(
              getIcon: LineIcon.facebook,
              url: "https://www.facebook.com/profile.php?id=100013249487960",
            ),
            HoverignIcon(
              getIcon: LineIcon.whatSApp,
              url: 'https://wa.me/+201090849580',
            )
          ],
        ),
        const SizedBox(
          height: 150,
        ),
      ],
    ),
  );
}

class HoverignIcon extends StatefulWidget {
  const HoverignIcon({super.key, required this.getIcon, required this.url});
  final LineIcon Function({Color color, double size}) getIcon;
  final String url;

  @override
  State<HoverignIcon> createState() => _HoverignIconState();
}

class _HoverignIconState extends State<HoverignIcon> {
  @override
  bool _isHovering = false;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl(widget.url);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovering = false;
          });
        },
        child: widget.getIcon(
            color: _isHovering ? ColorManager.emeraid : ColorManager.textColor,
            size: _isHovering ? 90 : 60),
      ),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
