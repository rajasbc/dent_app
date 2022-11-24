import 'package:flutter/material.dart';

class DiagnosisList extends StatefulWidget {
  const DiagnosisList({Key? key}) : super(key: key);

  @override
  State<DiagnosisList> createState() => _DiagnosisListState();
}

class _DiagnosisListState extends State<DiagnosisList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diagnosis List'),
        ),
        body: Container(
          child: Text(''),
        ),
      ),
    );
  }
}
