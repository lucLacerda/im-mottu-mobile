import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:im_mottu_mobile/src/app/modules/home/page/home_page.dart';
import 'package:im_mottu_mobile/src/core/im_mottu_colors.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/';

  const SplashPage({
    super.key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
      Modular.to.navigate(HomePage.route);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ImMottuColors.redColor, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/marvel_logo.png',
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
