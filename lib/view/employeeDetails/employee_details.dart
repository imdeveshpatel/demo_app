import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  const EmployeeDetails({super.key});

  @override
  State<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EmployeeViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar().getAppBar(
            title: "Employee Details",
            hasBackPress: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title("Employee Code"),
                  subTitle("Devesh "),
                  title("Employee Name"),
                  subTitle("Devesh "),
                  title("Employee Address"),
                  subTitle("Devesh "),
                  title("Employee DOB"),
                  subTitle("Devesh "),
                  title("Employee Salary"),
                  subTitle("Devesh "),
                  title("Remark"),
                  subTitle("Devesh "),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 30, right: 30, bottom: 30),
                    child: CustomButton(
                      title: "Edit",
                      buttonColor: AppColors().darkBlue,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.editEmployeePageRoute);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                      title: "Delete",
                      buttonColor: AppColors().redBorder,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget title(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: AppColors().black,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget subTitle(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: AppColors().black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
