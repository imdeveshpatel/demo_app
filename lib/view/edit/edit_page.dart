import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view/custom/custom_edit_text.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class EditEmployee extends StatefulWidget {
  final Employee employee;
  const EditEmployee({super.key, required this.employee});

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<EmployeeViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      nameCon.text = widget.employee.name;
      addCon.text = widget.employee.address;
      mobCon.text = widget.employee.mobile;
      dobCon.text = widget.employee.dob;
      dojCon.text = widget.employee.doj;
      salaryCon.text = widget.employee.salary;
      remarkCon.text = widget.employee.remark;

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.employee.code!,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColors().black.withOpacity(.5),
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    const TitleText(
                      title: "Employee Name",
                    ),
                    CustomEditText(
                      controller: nameCon,
                      hint: widget.employee.name,
                    ),
                    const TitleText(
                      title: "Mobile Number",
                    ),
                    CustomEditText(
                      controller: mobCon,
                      hint: widget.employee.mobile,
                    ),
                    const TitleText(
                      title: "Date Of Birth",
                    ),
                    CustomEditText(
                      controller: dobCon,
                      hint: widget.employee.dob,
                    ),
                    const TitleText(
                      title: "Date Of Joining",
                    ),
                    CustomEditText(
                      controller: dojCon,
                      hint: widget.employee.doj,
                    ),
                    const TitleText(
                      title: "Employee Salary",
                    ),
                    CustomEditText(
                      controller: salaryCon,
                      hint: widget.employee.salary,
                    ),
                    const TitleText(
                      title: "Employee Address",
                    ),
                    CustomEditText(
                      controller: addCon,
                      hint: widget.employee.address,
                    ),
                    const TitleText(
                      title: "Remark",
                    ),
                    CustomEditText(
                      maxLines: 3,
                      controller: remarkCon,
                      hint: widget.employee.remark,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                          title: "Save",
                          buttonColor: AppColors().darkBlue,
                          onPressed: () {
                            model.empUpdate(
                              employee: Employee(
                                name: nameCon.text,
                                address: addCon.text,
                                mobile: mobCon.text,
                                salary: salaryCon.text,
                                remark: remarkCon.text,
                                dob: dobCon.text,
                                doj: dojCon.text,
                              ),
                              empId: widget.employee.docId!,
                            );

                            Future.delayed(
                              const Duration(seconds: 1),
                              () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.allEmployeePageRoute);
                              },
                            );
                          }),
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
