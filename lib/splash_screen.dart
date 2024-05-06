import 'package:flutter/material.dart';
import 'package:racemate/constants/images.dart';
import 'package:racemate/routing/app_routes.dart';
import 'package:racemate/utilities/extensions/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), (){
        Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen.name, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#1C325F'.color,
      body: Center(
        child: Image.asset(Images.squareLogo, width: MediaQuery.of(context).size.width * 0.5,),
      ),
    );
  }
}
