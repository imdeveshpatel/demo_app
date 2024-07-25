// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

// import 'dart:convert';

// Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

// String employeeToJson(Employee data) => json.encode(data.toJson());

// class Employee {
//   String? docId;
//   String name;
//   String address;
//   int mobile;
//   int salary;
//   String remark;
//   String dob;
//   String doj;

//   Employee({
//     required this.name,
//     required this.address,
//     required this.mobile,
//     required this.salary,
//     required this.remark,
//     required this.dob,
//     required this.doj,
//     this.docId,
//   });

//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//         name: json["name"] as String,
//         address: json["address"] as String,
//         mobile: json["mobile"] as int,
//         salary: json["salary"] as int,
//         remark: json["remark"] as String,
//         dob: json["dob"] as String,
//         doj: json["doj"] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "address": address,
//         "mobile": mobile,
//         "salary": salary,
//         "remark": remark,
//         "dob": dob,
//         "doj": doj,
//       };
// }
import 'dart:convert';

// Function to convert a JSON string to an Employee object
Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

// Function to convert an Employee object to a JSON string
String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  String? docId;
  String name;
  String address;
  String mobile;
  String salary;
  String remark;
  String dob;
  String doj;
  String? code;

  Employee({
    required this.name,
    required this.address,
    required this.mobile,
    required this.salary,
    required this.remark,
    required this.dob,
    required this.doj,
    this.docId,
    this.code,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        name: json["name"] ?? '',
        address: json["address"] ?? '',
        mobile: json["mobile"] ?? '',
        salary: json["salary"] ?? '',
        remark: json["remark"] ?? '',
        dob: json["dob"] ?? '',
        doj: json["doj"] ?? '',
        code: json["code"] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "mobile": mobile,
      "salary": salary,
      "remark": remark,
      "dob": dob,
      "doj": doj,
    };
  }
}
