// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/AppointmentWidget/Appointment.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:nigdent/PatientWidget/AddPatientWidget.dart';
import 'package:nigdent/PatientWidget/CreatePatient.dart';
import 'package:nigdent/PlanWidget/DentalPlanWidget.dart';

import '../ReportWidget/CollectionReport.dart';
import '../ReportWidget/PatientRegisterReport.dart';
import '../ReportWidget/PatientReportSummary.dart';
import '../ReportWidget/PaymentReport.dart';
import '../ReportWidget/PerformanceSummary.dart';
import '../ReportWidget/PlanSummary.dart';
import '../ReportWidget/RevenueReport.dart';
import '../ReportWidget/TopTreatmentDiagnosis.dart';
import '../ReportWidget/Treatmentplan.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  var userResponse;
  final List<String> images = [
    'assets/images/add_customer.png',
    'assets/images/add_test.png',
    'assets/images/sync_data.png',
  ];
  @override
  Widget build(BuildContext context) {
    userResponse = storage.getItem('userResponse');

    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const AddPatientWidget()),
                // );
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreatePatient()),
                );
              },
              child: Text('+ Add Patient'),
            ),
            //  ElevatedButton(
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //       builder: (context) => const AddPatientWidget()),
            //     // );
            //         Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const PatientRegisterReport()),
            //     );
            //   },
            //   child: Text('+ patient register report'),
            // ),
          ],
        ),
      ),
      //  body: Container(
      // width: MediaQuery.of(context).size.width,
      // child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Container(
      //         height: 200,
      //         width: MediaQuery.of(context).size.width,
      //         child: CarouselSlider.builder(
      //           itemCount: images.length,
      //           options: CarouselOptions(
      //             autoPlay: true,
      //             // aspectRatio: 2.0,
      //             enlargeCenterPage: true,
      //           ),
      //           itemBuilder: (context, index, realIdx) {
      //             return GestureDetector(
      //               child: Center(
      //                 child: Image(
      //                   image: AssetImage(images[index]),
      //                   fit: BoxFit.contain,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   ),
      // )),
      drawer: SafeArea(
        child: Drawer(
          elevation: 50,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                      '${Helper().isvalidElement(userResponse) ? userResponse['lab_profile']['name'] : ''}'),
                  accountEmail: Text(
                      '${Helper().isvalidElement(userResponse) ? userResponse['lab_profile']['mobile_no'] : ''}'),
                  currentAccountPicture: CircleAvatar(
                    radius: 56,
                    backgroundImage: NetworkImage(
                      "${Helper().isvalidElement(userResponse) ? userResponse["lab_logo"] : ''}",
                    ),
                    backgroundColor: Colors.white,
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text('${userResponse['lab_profile']['name'][0]}'),
                    )
                  ],
                ),
                ListTile(
                  title: Text('Dashboard'),
                  leading: Icon(Icons.menu),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Appointment'),
                  leading: Icon(Icons.note_add),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppointmentPage()),
                    );
                  },
                ),
                  ExpansionTile(
                  title: Text('REPORTS',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                           leading: Icon(
                  Icons.report_gmailerrorred,
                  // color: Colors.green,
                ),
                  children: [
                    ListTile(
                      title: Text('Patient Register Report'),
                      leading: Icon(Icons.report),
                      onTap: (){
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PatientRegisterReport()),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Patient Summary Report'),
                      leading: Icon(Icons.summarize),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientReportSummary()),
                        );
                      },
                    ),
                    ListTile(
                        title: Text('Treatment Plan / History'),
                        leading: Icon(Icons.history),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Treatmentplan()),
                          );
                        },
                        ),
                        
                    ListTile(
                      title: Text('Collection Report'),
                      leading: Icon(Icons.collections),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CollectionReport())
                          );
                      },
                    ),

                    ListTile(
                      title: Text('Performance Summary'),
                      leading: Icon(Icons.summarize_sharp),
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerformanceSummary())
                          );
                      },
                    ),

                    ListTile(
                      title: Text('Plan Summary'),
                      leading: Icon(Icons.summarize_outlined),
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanSummary())
                          );
                      },
                    ),

                    ListTile(
                      title: Text('Top Treatment & Diagnosis'),
                      leading: Icon(Icons.add_to_photos),
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopTreatmentDiagnosis())
                          );
                      },
                    ),

                    ListTile(
                      title: Text('Revenue Report'),
                      leading: Icon(Icons.reviews_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RevenueReport())
                          );
                      },
                    ),

                    ListTile(
                      title: Text('Payment Report'),
                      leading: Icon(Icons.payment),
                      onTap: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentReport())
                          );
                      },
                    ),

                    // ListTile(
                    //   title: Text('Collection Report'),
                    //   leading: Icon(Icons.collections),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => PaymentReport())
                    //       );
                    //   },
                    // ),

                  ],
                ),
                ListTile(
                  title: Text('Plan'),
                  leading: Icon(FontAwesome5.teeth_open),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const DentalPlan()),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
