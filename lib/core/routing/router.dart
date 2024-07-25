import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/routing/routes.dart';
import 'package:demo_app/view/addEmployee/add_employee.dart';
import 'package:demo_app/view/allEmployee/all_employee.dart';
import 'package:demo_app/view/edit/edit_page.dart';
import 'package:demo_app/view/employeeDetails/employee_details.dart';
import 'package:demo_app/view/home/home_page.dart';
import 'package:demo_app/view/login/login_view.dart';
import 'package:demo_app/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppPageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreenRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());

      case Routes.homePageRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomePage());
      case Routes.loginPageRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case Routes.addEmployeePageRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddEmployeePage());
      case Routes.editEmployeePageRoute:
        Employee employee = settings.arguments as Employee;
        return MaterialPageRoute(
            builder: (BuildContext context) => EditEmployee(
                  employee: employee,
                ));
      case Routes.allEmployeePageRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AllEmployeePage());
      case Routes.employeeDetailsRoute:
        Employee employee = settings.arguments as Employee;
        return MaterialPageRoute(
            builder: (BuildContext context) => EmployeeDetails(
                  employee: employee,
                ));

      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }
}
