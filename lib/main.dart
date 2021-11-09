///
/// [Author] Alex (https://github.com/Alex525)
/// [Date] 2020/5/30 15:39
///
import 'package:animatedtransition/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color themeColor = Color(0xff00bc56);


void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeChat Asset Picker Demo',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: themeColor,
        ),
      ),
      home: const SplashPage(),
      builder: (BuildContext c, Widget? w) {
        return ScrollConfiguration(
          behavior: const NoGlowScrollBehavior(),
          child: w!,
        );
      },
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  const NoGlowScrollBehavior();

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
