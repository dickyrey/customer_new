import 'package:flutter/material.dart';
import 'package:shared_common/constants/image_constants.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 800) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFBE9),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage('assets/images/splash_phone.png'),
          // ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          AssetImages.logo,
          width: 20,
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFBE9),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: AssetImage('assets/images/splash_tablet.png'),
          // ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          AssetImages.logo,
          width: 20,
        ),
      );
    }
  }
}
