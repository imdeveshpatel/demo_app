import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/utils/common_utils.dart';
import 'package:demo_app/view_model/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class EmployeeViewModel extends BaseViewModel {
  TextEditingController nameCon = TextEditingController();
  TextEditingController addCon = TextEditingController();
  TextEditingController mobCon = TextEditingController();
  TextEditingController dobCon = TextEditingController();
  TextEditingController dojCon = TextEditingController();
  TextEditingController salaryCon = TextEditingController();
  TextEditingController remarkCon = TextEditingController();
  TextEditingController empCodeCon = TextEditingController();

  final FirebaseFirestore _fire = FirebaseFirestore.instance;

  final List<Employee> _allEmployee = [];
  List<Employee> get employee => _allEmployee;

  empCreate() {
    try {
      _fire.collection("employee").add({
        "name": nameCon.text,
        "code": randomNumeric(10),
        "dob": dobCon.text,
        "mobile": mobCon.text,
        "salary": salaryCon.text,
        "address": addCon.text,
        "remark": remarkCon.text
      }).whenComplete(() =>
          CommonUtils().showToastMessage(message: "Data save sucessfully"));
    } catch (e) {
      e.toString();
    }
  }

  fetchEmpList() {
    try {
      var allEmpList = _fire.collection("employee").get();
      print(allEmpList);
    } catch (e) {
      e.toString();
    }
  }

  empUpdate() {
    try {} catch (e) {
      e.toString();
    }
  }

  empDelete() {
    try {} catch (e) {
      e.toString();
    }
  }
}
