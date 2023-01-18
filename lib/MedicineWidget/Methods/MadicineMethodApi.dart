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

  getMadicinePayLogApi(accessToken, context, data) async {
    var MedicinePaylog_list = await api().getMedicinePayLog(accessToken, data);
    if (Helper().isvalidElement(MedicinePaylog_list) &&
        Helper().isvalidElement(MedicinePaylog_list['status']) &&
        MedicinePaylog_list['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      MedicinePaylog_list = MedicinePaylog_list;
    }

    return MedicinePaylog_list;
  }

  medicinePayApi(accessToken, context, data) async {
    var MedicinePay = await api().medicinePay(accessToken, data);
    if (Helper().isvalidElement(MedicinePay) &&
        Helper().isvalidElement(MedicinePay['status']) &&
        MedicinePay['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      MedicinePay = MedicinePay['status'];
    }

    return MedicinePay;
  }

  medicineBulkPaymentApi(accessToken, context, data) async {
    
    var MedicineBulkPay = await api().medicineBulkPayment(accessToken, data);
    if (Helper().isvalidElement(MedicineBulkPay) &&
        Helper().isvalidElement(MedicineBulkPay['status']) &&
        MedicineBulkPay['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      MedicineBulkPay = MedicineBulkPay['status'];
    }

    return MedicineBulkPay;
  }
}
