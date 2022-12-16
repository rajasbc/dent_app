import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nigdent/ReportWidget/PatientRegisterReport.dart';
import 'UrlPath.dart' as RequestPath;
import 'package:fluttertoast/fluttertoast.dart';

_setHeaders(access_token) => {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $access_token'
    };
_setHeadersWithOutToken() => {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };

class api {
  userLoginResponse(data) async {
    String loginUrl = RequestPath.base_url + RequestPath.userLogin;
    var response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(data), headers: _setHeadersWithOutToken());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
    getDiagnosisList(access_token) async {
    String diagnosis_url = RequestPath.base_url + RequestPath.diagnosisEndpoint;
    var response = await http.get(Uri.parse(diagnosis_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  editDiagnosisList(access_token, data) async {
    String diagnosis_url =
        RequestPath.base_url + RequestPath.editdiagnosisBasedEndpoint;
    var response = await http.post(Uri.parse(diagnosis_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
     getTreatmentList(access_token) async {
    String treatment_url = RequestPath.base_url + RequestPath.treatmentEndpoint;
    var response = await http.get(Uri.parse(treatment_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
       getPatientList(access_token) async {
    String patient_list_url = RequestPath.base_url + RequestPath.patientListEndpoint;
    var response = await http.get(Uri.parse(patient_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
    patientRegisterReport(access_token,data) async {
    String url = RequestPath.base_url + RequestPath.patientRegReportEndpoint;
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  billingCollectionReport(access_token,data) async {
    String url = RequestPath.base_url + RequestPath.patientRegReportEndpoint;
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
   getpatientSummaryReport(access_token) async {
    String patient_list_url = RequestPath.base_url + RequestPath.patientSummaryReportEndpoint;
    var response = await http.get(Uri.parse(patient_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

   treatmentDiagnosisplan(access_token, data) async {
    String patient_list_url = RequestPath.base_url + RequestPath.topTreatmentDiagnosisEndpoint;
    var response = await http.post(Uri.parse(patient_list_url),
          body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  diagnosisplan(access_token) async {
    String patient_list_url = RequestPath.base_url + RequestPath.diagnosisplanEndpoint;
    var response = await http.get(Uri.parse(patient_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  revenueReport(access_token, data) async {
    String patient_list_url = RequestPath.base_url + RequestPath.revenueEndpoint;
    var response = await http.post(Uri.parse(patient_list_url),
              body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
   paymentReport(access_token, data) async {
    String patient_list_url = RequestPath.base_url + RequestPath.paymentReportEndpoint;
    var response = await http.post(Uri.parse(patient_list_url),
     body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  getTreatmentDetails(access_token, data) async {
    String treatment_details_url = RequestPath.base_url + RequestPath.treatmentDetailsEndpoint;
    var response = await http.post(Uri.parse(treatment_details_url),
      body: jsonEncode(data),  headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
    getAppointmentCount(access_token) async {
    String appointment_count_url = RequestPath.base_url + RequestPath.appointmentCountEndpoint;
    var response = await http.get(Uri.parse(appointment_count_url),
  headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
    addDentPlan(access_token, data) async {
    String add_dent_plan_url = RequestPath.base_url + RequestPath.addDentPlanEndpoint;
    var response = await http.post(Uri.parse(add_dent_plan_url),
      body: jsonEncode(data),  headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  
  getAppointmentList(access_token, data) async {

    String appointment_list_url = RequestPath.base_url + RequestPath.appointmentList;
    var response = await http.post(Uri.parse(appointment_list_url),
      body: jsonEncode(data), headers: _setHeaders(access_token));

      if(response.statusCode == 200) {
        return json.decode(response.body);
      }else {
        return json.decode(response.body);
      }

  }
      addNewAppointment(access_token, data) async {

    String add_appointment_url = RequestPath.base_url + RequestPath.addAppointmentEndpoint;
    var response = await http.post(Uri.parse(add_appointment_url),
      body: jsonEncode(data), headers: _setHeaders(access_token));

      if(response.statusCode == 200) {
        return json.decode(response.body);
      }else {
        return json.decode(response.body);
      }

  }
  addDoctor(access_token, doctor_details) async {
    String addDoctor_url = RequestPath.base_url + RequestPath.addDoctorEndpoint;
    var response = await http.post(Uri.parse(addDoctor_url),
        body: jsonEncode(doctor_details), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  getdoctorlist(access_token) async {
    String doctor_list_url = RequestPath.base_url + RequestPath.doctorListEndpoint;
    var response = await http.get(Uri.parse(doctor_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
   addStaff(access_token, staff_details) async {
    String addStaff_url = RequestPath.base_url + RequestPath.addStaffEndpoint;
    var response = await http.post(Uri.parse(addStaff_url),
        body: jsonEncode(staff_details), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

   getstafflist(access_token) async {
    String staff_list_url = RequestPath.base_url + RequestPath.staffListEndpoint;
    var response = await http.get(Uri.parse(staff_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  
}
