import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view/custom/custom_edit_text.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class EditEmployee extends StatefulWidget {
  const EditEmployee({super.key});

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  TextEditingController nameCon = TextEditingController();
  TextEditingController addCon = TextEditingController();
  TextEditingController mobCon = TextEditingController();
  TextEditingController dobCon = TextEditingController();
  TextEditingController dojCon = TextEditingController();
  TextEditingController salaryCon = TextEditingController();
  TextEditingController remarkCon = TextEditingController();
  TextEditingController empCodeCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<EmployeeViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar().getAppBar(
            title: "Edit Employee Master",
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
                      title: "Employee Code",
                    ),
                    CustomEditText(
                      controller: nameCon,
                      hint: "1",
                    ),
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
                      hint: "01/01/2000",
                    ),
                    const TitleText(
                      title: "Date Of Joining",
                    ),
                    CustomEditText(
                      controller: dojCon,
                      hint: "01/01/2000",
                    ),
                    const TitleText(
                      title: "Employee Salary",
                    ),
                    CustomEditText(
                      controller: salaryCon,
                      hint: "20000",
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
                      maxLines: 3,
                      controller: remarkCon,
                      hint: "Remark",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        title: "Save",
                        buttonColor: AppColors().darkBlue,
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        title: "Close",
                        buttonColor: AppColors().redBorder,
                        onPressed: () {},
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
