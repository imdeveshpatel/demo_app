import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/constants/image_constant.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar().getAppBar(title: "Home", hasBackPress: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImage.welcomePng,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.addEmployeePageRoute),
                  child: customContainer(
                    height: 100,
                    width: 400,
                    title: "Add new employee",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.allEmployeePageRoute),
                  child: customContainer(
                    height: 100,
                    width: 400,
                    title: "Employee list",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customContainer({
    required double height,
    required double width,
    required String title,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors().black.withOpacity(.2),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              color: AppColors().black,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
