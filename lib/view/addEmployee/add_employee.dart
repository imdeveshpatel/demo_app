import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view/custom/custom_edit_text.dart';

import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController addCon = TextEditingController();
  TextEditingController mobCon = TextEditingController();
  TextEditingController dobCon = TextEditingController();
  TextEditingController dojCon = TextEditingController();
  TextEditingController salaryCon = TextEditingController();
  TextEditingController remarkCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<EmployeeViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar().getAppBar(
            title: "Employee Master",
            hasBackPress: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleText(
                      title: "Employee Name",
                    ),
                    CustomEditText(
                      controller: nameCon,
                      hint: "Employee Name",
                    ),
                    const TitleText(
                      title: "Mobile Number",
                    ),
                    CustomEditText(
                      controller: mobCon,
                      hint: "Mobile Number",
                    ),
                    const TitleText(
                      title: "Date Of Birth",
                    ),
                    CustomEditText(
                      controller: dobCon,
                      hint: "Date Of Birth",
                    ),
                    const TitleText(
                      title: "Date Of Joining",
                    ),
                    CustomEditText(
                      controller: dojCon,
                      hint: "Date of joining",
                    ),
                    const TitleText(
                      title: "Employee Salary",
                    ),
                    CustomEditText(
                      controller: salaryCon,
                      hint: "Salary",
                    ),
                    const TitleText(
                      title: "Employee Address",
                    ),
                    CustomEditText(
                      controller: addCon,
                      hint: "Address",
                    ),
                    const TitleText(
                      title: "Remark",
                    ),
                    CustomEditText(
                      // isMandatory: false,
                      maxLines: 3,
                      controller: remarkCon,
                      hint: "Remark",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        title: "Save",
                        buttonColor: AppColors().darkBlue,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            model.empCreate(
                              employee: Employee(
                                address: addCon.text,
                                name: nameCon.text,
                                dob: dobCon.text,
                                doj: dojCon.text,
                                mobile: mobCon.text,
                                remark: remarkCon.text,
                                salary: salaryCon.text,
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.homePageRoute);
                            });
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        title: "Close",
                        buttonColor: AppColors().redBorder,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            color: AppColors().black,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
