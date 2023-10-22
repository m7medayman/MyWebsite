import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile/App/device_manager.dart';
import 'package:profile/presentation/home/desktop_view/desktop_view.dart';
import 'package:profile/presentation/home/mobile_view/mobile_view.dart';
import 'package:profile/presentation/resources/font_stayle_manager.dart';
import 'package:profile/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    Devices device =
        DeviceManager().getDevice(MediaQuery.of(context).size.width);
    FontStyleManager fontStyle = FontStyleManager(device);
    ThemeData myTheme = ThemeManager(fontStyle).getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: getHomePage(device),
    );
  }

  getHomePage(Devices device) {
    print(device.toString());
    if (device == Devices.mobile) {
      return MobilePageView();
    } else {
      return DesktopPageView();
    }
  }
}
