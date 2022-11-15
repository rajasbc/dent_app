import 'package:flutter/material.dart';

class DentalPlan extends StatefulWidget {
  const DentalPlan({super.key});

  @override
  State<DentalPlan> createState() => _DentalPlanState();
}

class _DentalPlanState extends State<DentalPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dental Plan'),),
      body: Container(
        child: Text('Plan'),
      ),
    );
  }
}