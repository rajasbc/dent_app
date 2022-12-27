
import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

class BillingList extends StatefulWidget {
  const BillingList({Key? key}) : super(key: key);

  @override
  State<BillingList> createState() => _BillingListState();
}

class _BillingListState extends State<BillingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Billing"),
        backgroundColor: CustomColors.app_color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}