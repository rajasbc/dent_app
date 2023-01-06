import 'dart:async';
import 'package:flutter/material.dart';
import '../../Common/utils.dart';
import '../../api/Apicall.dart';

class BillingMethodApi {
  getTreatmentListApi(accessToken, context) async {
    var treatmentList = await api().getTreatmentList(accessToken);
    if (Helper().isvalidElement(treatmentList) &&
        Helper().isvalidElement(treatmentList['status']) &&
        treatmentList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      treatmentList = treatmentList['reports'];
    }

    return treatmentList;
  }

  getBillingListApi(accessToken, context) async {
    var selectedPatient = storage.getItem('selectedPatient');
    var data = {
      "patient_id": selectedPatient['id'].toString(),
    };
    var BillingList = await api().getBillingList(accessToken, data);
    if (Helper().isvalidElement(BillingList) &&
        Helper().isvalidElement(BillingList['status']) &&
        BillingList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      BillingList = BillingList['billing_list'];
    }
    return BillingList;
  }

  getPayBillingLog(accessToken, context, data) async {
    var billingPayLog = await api().BillingPayLog(accessToken, data);
    if (Helper().isvalidElement(billingPayLog) &&
        Helper().isvalidElement(billingPayLog['status']) &&
        billingPayLog['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      billingPayLog = billingPayLog;
    }
    return billingPayLog;
  }

  billingPayApi(accessToken, context, data) async {
    var billingPay = await api().BillingPay(accessToken, data);
    if (Helper().isvalidElement(billingPay) &&
        Helper().isvalidElement(billingPay['status']) &&
        billingPay['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      billingPay = billingPay;
    }
    return billingPay['status'];
  }

  bulkBillPay(accessToken, context, data) async {
    var bulkBillPay = await api().BulkBillPay(accessToken, data);
    if (Helper().isvalidElement(bulkBillPay) &&
        Helper().isvalidElement(bulkBillPay['status']) &&
        bulkBillPay['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      bulkBillPay = bulkBillPay;
    }
    return bulkBillPay['status'];
  }
}
