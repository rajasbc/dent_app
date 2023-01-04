import 'dart:async';
import 'package:flutter/material.dart';
import '../../Common/utils.dart';
import '../../api/Apicall.dart';

class MedicineMethodApi {
  getPrescriptionApi(accessToken, context) async {
     var selectedPatient = storage.getItem('selectedPatient');
    var data = {
      "patient_id": selectedPatient['id'].toString(),
    };
    var prescription_list = await api().getPrescriptionList(accessToken, data);
    if (Helper().isvalidElement(prescription_list) &&
        Helper().isvalidElement(prescription_list['status']) &&
        prescription_list['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      prescription_list = prescription_list['Prescription'];
    }

    return prescription_list;
  }
}