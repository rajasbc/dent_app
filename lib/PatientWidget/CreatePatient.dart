import 'package:flutter/material.dart';

class CreatePatient extends StatefulWidget {
  const CreatePatient({super.key});

  @override
  State<CreatePatient> createState() => _CreatePatientState();
}

class _CreatePatientState extends State<CreatePatient> {
  var show_information;
  void initState() {
    show_information = 'Basic Information';
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text('Add Patient'),
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.003),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.33,
                      child: ElevatedButton(
                        onPressed: () {
                          this.setState(() {
                            show_information = 'Basic Information';
                          });
                        },
                        child: Align(
                            alignment: Alignment.center, child: Text('Basic')),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.33,
                      child: ElevatedButton(
                        onPressed: () {
                          this.setState(() {
                            show_information = 'Personal Information';
                          });
                        },
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Personal')),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.33,
                      child: ElevatedButton(
                        onPressed: () {
                          this.setState(() {
                            show_information = 'Other Information';
                          });
                        },
                        child: Align(
                            alignment: Alignment.center, child: Text('Other')),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Container(
                height: screenHeight * 0.93,
                width: screenWidth,
                // decoration: BoxDecoration(color: Colors.yellow),
                child: SingleChildScrollView(
                    child: show_information == 'Basic Information'
                        ? renderBasicInformationWidget()
                        : show_information == 'Personal Information'
                            ? renderPersonalInformationWidget()
                            : renderOtherInformationWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderBasicInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text('Basic Information'),
      ),
    );
  }

  renderPersonalInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text('Personal Information'),
      ),
    );
  }

  renderOtherInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text('Other Information'),
      ),
    );
  }
}
