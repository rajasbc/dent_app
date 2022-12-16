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
}
