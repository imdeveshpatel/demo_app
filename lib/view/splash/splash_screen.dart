import 'package:demo_app/core/constants/image_constant.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser?.uid == null) {
        Navigator.pushReplacementNamed(context, Routes.loginPageRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.homePageRoute);
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AppImage.homeScreenPng,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
