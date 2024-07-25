import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/constants/image_constant.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view/custom/custom_edit_text.dart';
import 'package:demo_app/view_model/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BaseView<AuthViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: model.formKey,
            child: Column(
              children: [
                Container(
                  height: height * .45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImage.loginPng,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 140, right: 20),
                  child: CustomEditText(
                    controller: model.emailCon,
                    showLabel: false,
                    isEmail: true,
                    isMandatory: true,
                    hint: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: CustomEditText(
                    controller: model.passCon,
                    showLabel: false,
                    isEmail: false,
                    isPasswordField: true,
                    isMandatory: true,
                    hint: "Password",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 24, right: 24, bottom: 50),
                  child: CustomButton(
                    title: "Login",
                    buttonColor: AppColors().redBorder,
                    onPressed: () async {
                      if (model.formKey.currentState!.validate()) {
                        bool result = await model.signin(context: context);
                        if (result) {
                          Navigator.pushReplacementNamed(
                              context, Routes.homePageRoute);
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}
