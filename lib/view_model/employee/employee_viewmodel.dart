import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/core/enums/view_state_enum.dart';
import 'package:demo_app/core/model/employee_model.dart';
import 'package:demo_app/core/utils/common_utils.dart';
import 'package:demo_app/view_model/base/base_view_model.dart';

class EmployeeViewModel extends BaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Employee> _employeeList = [];
  List<Employee> searchList = [];

  empCreate({required Employee employee}) async {
    try {
      String? empCode = await getEmpCode();
      if (empCode == null) {
        CommonUtils().showToastMessage(message: "Somthing Wet Wrong");
        return;
      }
      await _firestore.collection("employee").add({
        "name": employee.name,
        "code": empCode,
        "dob": employee.dob,
        "mobile": employee.mobile,
        "salary": employee.salary,
        "address": employee.address,
        "remark": employee.remark,
        "doj": employee.doj,
      });
      await _firestore
          .collection("config")
          .doc("totalEmployee")
          .update({"count": FieldValue.increment(1)});
      CommonUtils().showToastMessage(message: "Data added Sucessfully");
    } catch (e) {
      e.toString();
    }
  }

  Future<List<Employee>> fetchEmpList() async {
    try {
      state = ViewState.busy;

      QuerySnapshot<Map<String, dynamic>> empCollection =
          await _firestore.collection("employee").get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dataMap =
          empCollection.docs;
      for (var element in dataMap) {
        Employee details = Employee.fromJson(element.data());
        details.docId = element.id;
        _employeeList.add(details);
      }
      searchList = _employeeList;
      state = ViewState.idle;
      return _employeeList;
    } catch (e) {
      state = ViewState.idle;
      e.toString();

      return [];
    }
  }

  Future<bool> empUpdate({
    required Employee employee,
    required String empId,
  }) async {
    try {
      await _firestore.collection("employee").doc(empId).update(
            employee.toJson(),
          );
      CommonUtils().showToastMessage(message: "Data added Sucessfully");
      return true;
    } catch (e) {
      e.toString();
      CommonUtils().showToastMessage(message: "Something Went Wrong");
      return false;
    }
  }

  getSearchList(String searchCon) {
    if (searchCon.isEmpty) {
      searchList = _employeeList;
    } else {
      searchList = _employeeList
          .where((employee) => employee.name
              .toLowerCase()
              .contains(searchCon.trim().toLowerCase()))
          .toList();
    }
    updateUI();
  }

  Future empDelete({required String empId}) async {
    try {
      await _firestore.collection("employee").doc(empId).delete();
      CommonUtils().showToastMessage(message: "Employee Deleted Sucessfully");
    } catch (e) {
      e.toString();
    }
  }

  Future<String?> getEmpCode() async {
    try {
      DocumentSnapshot configDoc =
          await _firestore.collection("config").doc("totalEmployee").get();
      Map<String, dynamic> data = configDoc.data() as Map<String, dynamic>;
      int count = data["count"];
      String code = "EMP_${count + 1}";

      return code;
    } catch (e) {
      e.toString();
      return null;
    }
  }

  resetList() {
    _employeeList = [];
  }
}
