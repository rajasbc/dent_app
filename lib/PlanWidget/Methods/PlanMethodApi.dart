import 'dart:async';
import 'package:flutter/material.dart';
import '../../Common/utils.dart';
import '../../api/Apicall.dart';

class PlanMethodApi {
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

  getDiagnosisListApi(accessToken, context) async {
    var diagnosisList = await api().getDiagnosisList(accessToken);
    if (Helper().isvalidElement(diagnosisList) &&
        Helper().isvalidElement(diagnosisList['status']) &&
        diagnosisList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {}
    return diagnosisList['DiagnosisList'];
  }

  editDiagnosisListApi(accessToken, context, data) async {
    var datas = data;
    var edidiagnosisList = await api().editDiagnosisList(accessToken, datas);
    if (Helper().isvalidElement(edidiagnosisList) &&
        Helper().isvalidElement(edidiagnosisList['status']) &&
        edidiagnosisList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {}
    return edidiagnosisList['status'];
  }

  getPlanListApi(accessToken, context) async {
    var selectedPatient = storage.getItem('selectedPatient');
    var data = {
      "patient_id": selectedPatient['id'].toString(),
    };
    var getPlanList = await api().getPlanList(accessToken, data);

    if (Helper().isvalidElement(getPlanList) &&
        Helper().isvalidElement(getPlanList['status']) &&
        getPlanList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {}

    return getPlanList['list'];
  }

  saveAndCreatePlan(accessToken,context, data) async {
   
    var save_and_create_plan = await api().saveAndCreatePlan(accessToken, data);

    if (Helper().isvalidElement(save_and_create_plan) &&
        Helper().isvalidElement(save_and_create_plan['status']) &&
        save_and_create_plan['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {}

    return save_and_create_plan['status'];
  }
}
