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

   treatmentplan(access_token, data) async {
    String patient_list_url = RequestPath.base_url + RequestPath.treatmentplanEndpoint;
    var response = await http.post(Uri.parse(patient_list_url),
        headers: _setHeaders(access_token));
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
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
   paymentReport(access_token, data) async {
    String patient_list_url = RequestPath.base_url + RequestPath.paymentReportEndpoint;
    var response = await http.post(Uri.parse(patient_list_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
  getTreatmentDetails(access_token, data) async {
    String treatment_details_url = RequestPath.base_url + RequestPath.treatmentDetailsEndpoint;
    var response = await http.get(Uri.parse(treatment_details_url),
        headers: _setHeaders(access_token));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  }
}
