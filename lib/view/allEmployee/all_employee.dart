import 'package:demo_app/core/enums/view_state_enum.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/base/base_view.dart';
import 'package:demo_app/view/custom/custom_app_bar.dart';
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
    return BaseView<EmployeeViewModel>(
      onModelReady: (model) {
        Future.delayed(Duration.zero, () {
          model.resetList();
          model.fetchEmpList();
        });
      },
      builder: (context, model, child) {
        if (model.state == ViewState.busy) {
          return const Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Scaffold(
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Visibility(
                  visible: searchTap,
                  child: Column(
                    children: [
                      TextField(
                        controller: searchCon,
                        onChanged: (value) {
                          model.getSearchList(searchCon.text);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.searchList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Text(model.searchList[index].name),
                          subtitle: Text(model.searchList[index].address),
                          trailing:
                              const Icon(Icons.arrow_forward_ios_outlined),
                          onTap: () {
                            Navigator.pushNamed(
                                context, Routes.employeeDetailsRoute,
                                arguments: model.searchList[index]);
                          });
                    },
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
