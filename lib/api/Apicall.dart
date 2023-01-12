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

  getPlanList(access_token, data) async {
    String get_plan_list_url =
        RequestPath.base_url + RequestPath.getPlanListEndpoint;
    var response = await http.post(Uri.parse(get_plan_list_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  saveAndCreatePlan(access_token,data) async {
    String save_create_plan_url =
        RequestPath.base_url + RequestPath.saveAndCreatePlanEndpoint;
    var response = await http.post(Uri.parse(save_create_plan_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
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
    String url = RequestPath.base_url + RequestPath.billingCollectionReportEndpoint;
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  add_patient_call(access_token,patient_details) async {
    String addpatienturl = RequestPath.base_url + RequestPath.addPatientEndpoint;
    var response = await http.post(Uri.parse(addpatienturl),
        body: jsonEncode(patient_details), headers: _setHeaders(access_token));
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
    String payment_list_url = RequestPath.base_url + RequestPath.paymentReportEndpoint;
    var response = await http.post(Uri.parse(payment_list_url),
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
    Treatmentplan(access_token, data) async {
    String treatment_plan_url = RequestPath.base_url + RequestPath.treatmentPlanEndpoint;
    var response = await http.post(Uri.parse(treatment_plan_url),
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

  getslottimeList(access_token, date) async {
    String slottime_url =
        RequestPath.base_url + RequestPath.getSlottimeListEndpoint;
    var response = await http.post(Uri.parse(slottime_url),
        body: jsonEncode("date: ${date.text}"), headers: _setHeaders(access_token));
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
  update_config_call(access_token,config_details) async {
    String updateconfigurl = RequestPath.base_url + RequestPath.confifgEndpoint;
    var response = await http.post(Uri.parse(updateconfigurl),
        body: jsonEncode(config_details), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  get_clinic_config(access_token) async {
    String get_config_url =
        RequestPath.base_url + RequestPath.getconfigEndpoint;
    var response = await http.get(Uri.parse(get_config_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  getBillingList(access_token, data) async {
    String billing_list_url =
        RequestPath.base_url + RequestPath.getBillingListEndpoint;
    var response = await http.post(Uri.parse(billing_list_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }

  getPrescriptionList(access_token, data) async {
    String prescription_list_url =
        RequestPath.base_url + RequestPath.getPrescriptionEndpoint;
    var response = await http.post(Uri.parse(prescription_list_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  BillingPayLog(access_token, data) async {
    String billing_pay_log_url =
        RequestPath.base_url + RequestPath.billingPayLogEndpoint;
    var response = await http.post(Uri.parse(billing_pay_log_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  BillingPay(access_token, data) async {
    String billing_pay_url =
        RequestPath.base_url + RequestPath.billingPayEndpoint;
    var response = await http.post(Uri.parse(billing_pay_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  BulkBillPay(access_token, data) async {
    String bulk_pay_url =
        RequestPath.base_url + RequestPath.bulkBillPayEndpoint;
    var response = await http.post(Uri.parse(bulk_pay_url),
        body: jsonEncode(data), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  profile_update(access_token,profile_details) async {
    String updateprofileurl = RequestPath.base_url + RequestPath.profileEndpoint;
    var response = await http.post(Uri.parse(updateprofileurl),
        body: jsonEncode(profile_details), headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
}
