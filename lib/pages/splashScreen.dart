import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/constants/color/colors.dart';
import 'package:wallpaper_app/pages/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    if (kDebugMode) {
      print('Navigating to next screen');
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: Get.height * 0.4,
                // color: Colors.amber,

                child: Image.asset(
                  'assets/Icons/snapWalls_logo.png',
                  fit: BoxFit.cover,
                  // scale: 2,

                  // width: Get.width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
