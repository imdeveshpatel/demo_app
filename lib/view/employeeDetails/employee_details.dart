import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  final Employee employee;
  const EmployeeDetails({super.key, required this.employee});

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
                  subTitle(widget.employee.code!),
                  title("Employee Name"),
                  subTitle(widget.employee.name),
                  title("Employee Address"),
                  subTitle(widget.employee.address),
                  title("Date of birth"),
                  subTitle(widget.employee.dob),
                  title("Employee Salary"),
                  subTitle(widget.employee.salary),
                  title("Date of joining"),
                  subTitle(widget.employee.doj),
                  title("Remark"),
                  subTitle(widget.employee.remark),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 30, right: 30, bottom: 30),
                    child: CustomButton(
                      title: "Edit",
                      buttonColor: AppColors().darkBlue,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.editEmployeePageRoute,
                            arguments: widget.employee);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CustomButton(
                      title: "Delete",
                      buttonColor: AppColors().redBorder,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Delete',
                              ),
                              content: const Text(
                                  'you want to delete this employee ?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: AppColors().errorColor),
                                  ),
                                  onPressed: () {
                                    model.empDelete(
                                        empId: widget.employee.docId!);
                                    Future.delayed(
                                      const Duration(seconds: 1),
                                      () {
                                        Navigator.pushReplacementNamed(context,
                                            Routes.allEmployeePageRoute);
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  )
                  //  Padding(
                  //   padding: const EdgeInsets.all(30.0),
                  //   child: CustomButton(
                  //     title: "Delete",
                  //     buttonColor: AppColors().redBorder,
                  //     onPressed: () {
                  //       model.empDelete(empId: widget.employee.docId!);
                  //     },
                  //   ),
                  // )
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
