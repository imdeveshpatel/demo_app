// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String name;
  String address;
  int mobile;
  int salary;
  String remark;
  String dob;
  String doj;

  Employee({
    required this.name,
    required this.address,
    required this.mobile,
    required this.salary,
    required this.remark,
    required this.dob,
    required this.doj,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"],
        address: json["address"],
        mobile: json["mobile"],
        salary: json["salary"],
        remark: json["remark"],
        dob: json["dob"],
        doj: json["doj"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "mobile": mobile,
        "salary": salary,
        "remark": remark,
        "dob": dob,
        "doj": doj,
      };
}
