// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hive/hive.dart';
import 'package:nigdent/AppointmentWidget/CreateAppointment.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/storeBox.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:nigdent/DashboardWidget/DentMenuBar.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/PatientWidget/CreatePatient.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:nigdent/main.dart';
import 'dart:io' show Platform, exit;

import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  var userResponse = null;
  var patientList = null;
  var appointmentCount = null;
  var isPatientCountLoader = false;
  var isAppointCountLoader = false;
  late SharedPreferences pref;

  initPreferences() async{
    pref = await SharedPreferences.getInstance();

  }
  @override
  void initState() {
    initPreferences();
    this.setState(() {
         userResponse = storage.getItem('userResponse');
    });
    getPatientList();
    getAppointmentCount();
  }

  @override
  Widget build(BuildContext context) {
    // userResponse = storage.getItem('userResponse');
    double screenHeight = MediaQuery.of(context).size.height - 50;
    double screenwidth = MediaQuery.of(context).size.width;
    return new WillPopScope(
        onWillPop: () async {
          // Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                       builder: (context) => Wrapper()),
          //                 );
          // if (Platform.isAndroid) {
          //   exit(0);
          // } else if (Platform.isIOS) {
          //   exit(0);
          // }
          exit(0);
          // return true;
        },
        child: Scaffold(
          // return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              backgroundColor: CustomColors.app_color,
              title: const Text('Dashboard'),
              actions: [
                IconButton(
                    onPressed: () {
                      Helper().appLogoutCall(context, 'logout');
                    },
                    icon: Icon(WebSymbols.logout)),
                // IconButton(onPressed: getAllCustomers, icon: Icon(Icons.category))
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: new Container(
              width: screenwidth,
              height: screenHeight,
              child: Column(
                children: [
                  // Appointment
                  Container(
                    height: screenHeight * 0.25,
                    width: screenwidth,
                    //  color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: CustomColors.app_color,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: screenwidth * 0.01,
                                  ),
                                  Text(
                                    'Appointments',
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1.42,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.app_color),
                                  ),
                                ],
                              ),
                              Container(
                                  // color: Colors.yellow,
                                  height: screenHeight * 0.05,
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreateAppointment()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: CustomColors.app_color,
                                      size: 20,
                                    ),
                                  ))
                              // Icon(Icons.add, color: CustomColors.app_color,size: 25,)
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          Container(
                            width: screenwidth * 0.9,
                            // height: screenHeight*0.22,
                            height: screenHeight * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          isAppointCountLoader
                                              ? SpinKitDualRing(
                                                  size: 20,
                                                  color: CustomColors.app_color,
                                                )
                                              : Text(
                                                  Helper().isvalidElement(
                                                          appointmentCount)
                                                      ? appointmentCount[
                                                              'appoin_list']
                                                          .toString()
                                                      : '0',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black26)),
                                          SizedBox(
                                            width: screenwidth * 0.02,
                                          ),
                                          Text('Today',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 1,
                                                  color: Colors.black26)),
                                        ],
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ),

                  // patient
                  Container(
                    height: screenHeight * 0.35,
                    width: screenwidth,
                    //  color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          child: Column(
                        children: [
                          //  SizedBox(height: screenHeight*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: CustomColors.app_color,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: screenwidth * 0.01,
                                  ),
                                  Text(
                                    'Patients',
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1.42,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.app_color),
                                  ),
                                ],
                              ),
                              Container(
                                  // color: Colors.yellow,
                                  height: screenHeight * 0.05,
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreatePatient()),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: CustomColors.app_color,
                                      size: 20,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          Container(
                            width: screenwidth * 0.9,
                            height: screenHeight * 0.22,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          isPatientCountLoader &&
                                                  patientList == null
                                              ? SpinKitDualRing(
                                                  size: 20,
                                                  color: CustomColors.app_color,
                                                )
                                              : Text(
                                                  "${Helper().isvalidElement(patientList) ? patientList.length.toString() : '0'}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black26)),
                                          SizedBox(
                                            width: screenwidth * 0.02,
                                          ),
                                          Text('Total Patients',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 1,
                                                  color: Colors.black26)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          isAppointCountLoader &&
                                                  patientList == null
                                              ? SpinKitDualRing(
                                                  size: 20,
                                                  color: CustomColors.app_color,
                                                )
                                              : Text(
                                                  "${Helper().isvalidElement(appointmentCount) ? appointmentCount['count_list'].toString() : '0'}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black26)),
                                          SizedBox(
                                            width: screenwidth * 0.02,
                                          ),
                                          Text('Today Patients',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  letterSpacing: 1,
                                                  color: Colors.black26)),
                                        ],
                                      ),
                                      //      Container(
                                      // // color: Colors.yellow,
                                      // height: screenHeight*0.04,alignment: Alignment.topRight,
                                      // child: IconButton(onPressed: (){
                                      //   // print('total patients');
                                      // }, icon: Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 15,), ))
                                      // Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 20,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          drawer: SafeArea(
            child: Drawer(
              elevation: 50,
              child: const DentMenuBar(),
            ),
            // ),
          ),
        )
        );
  }

  getPatientList() async {
    this.setState(() {
      isPatientCountLoader = true;
    });
    // userResponse = storage.getItem('userResponse');
    patientList = await api().getPatientList(userResponse['access_token']);
    if (Helper().isvalidElement(patientList) &&
        Helper().isvalidElement(patientList['status']) &&
        patientList['status'] == 'Token is Invalid') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      //  storage.setItem('diagnosisList', diagnosisList);
      // isLoading = false;
      this.setState(() {
        patientList = patientList["patient_list"];
        isPatientCountLoader = false;
      });
    }
  }

  getAppointmentCount() async {
    this.setState(() {
      isAppointCountLoader = true;
    });
    // userResponse = storage.getItem('userResponse');
    print(userResponse['access_token']);
    appointmentCount =
        await api().getAppointmentCount(userResponse['access_token']);
    if (Helper().isvalidElement(appointmentCount) &&
        Helper().isvalidElement(appointmentCount['status']) &&
        appointmentCount['status'] == 'Token is Invalid') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      //  storage.setItem('diagnosisList', diagnosisList);
      // isLoading = false;
      this.setState(() {
        appointmentCount = appointmentCount;
        isAppointCountLoader = false;
      });
    }
  }
}
