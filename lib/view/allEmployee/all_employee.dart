import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
import 'package:demo_app/view/custom/custom_button.dart';
import 'package:demo_app/view/custom/custom_edit_text.dart';
import 'package:demo_app/view_model/employee/employee_viewmodel.dart';
import 'package:flutter/material.dart';

class AllEmployeePage extends StatefulWidget {
  const AllEmployeePage({super.key});

  @override
  State<AllEmployeePage> createState() => _AllEmployeePageState();
}

class _AllEmployeePageState extends State<AllEmployeePage> {
  bool searchTap = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchCon = TextEditingController();
    return BaseView<EmployeeViewModel>(onModelReady: (model) {
      Future.delayed(Duration.zero, () async {});
    }, builder: (context, model, child) {
      return SafeArea(
          child: Scaffold(
        appBar: CustomAppBar().getAppBar(
          title: "All Employees",
          hasBackPress: true,
          hasSearchPress: true,
          onSearchPressed: () {
            setState(() {
              searchTap = true;
            });
          },
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Visibility(
                visible: searchTap,
                child: Column(
                  children: [
                    CustomEditText(
                      controller: searchCon,
                      hint: " Name",
                      showLabel: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                        bottom: 8,
                      ),
                      child: CustomButton(
                        title: "Search",
                        buttonColor: AppColors().darkBlue,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.fetchEmpList();
                  Navigator.pushNamed(context, Routes.employeeDetailsRoute);
                },
                child: const Card(
                  child: ListTile(
                    // leading: FlutterLogo(size: 72.0),
                    title: Text('01'),
                    subtitle: Text('Devesh Patel'),
                    // trailing: Icon(Icons.more_vert),
                    // isThreeLine: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}
