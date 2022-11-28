import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nigdent/AppointmentWidget/Appointment.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/PlanWidget/DentalPlanWidget.dart';
import 'package:nigdent/ReportWidget/CollectionReport.dart';
import 'package:nigdent/ReportWidget/PatientRegisterReport.dart';
import 'package:nigdent/ReportWidget/PatientReportSummary.dart';
import 'package:nigdent/ReportWidget/PaymentReport.dart';
import 'package:nigdent/ReportWidget/PerformanceSummary.dart';
import 'package:nigdent/ReportWidget/PlanSummary.dart';
import 'package:nigdent/ReportWidget/RevenueReport.dart';
import 'package:nigdent/ReportWidget/TopTreatmentDiagnosis.dart';
import 'package:nigdent/ReportWidget/Treatmentplan.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
class DentMenuBar extends StatefulWidget {
  const DentMenuBar({Key? key}) : super(key: key);

  @override
  State<DentMenuBar> createState() => _DentMenuBarState();
}

class _DentMenuBarState extends State<DentMenuBar> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  var userResponse;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
  userResponse = storage.getItem('userResponse');
    return  Container(
              height: screenHeight,
              child: Column(
                children: [
                  Container(
                    height: screenHeight*0.25,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: CustomColors.app_color),
                      accountName: Text(
                          '${Helper().isvalidElement(userResponse) ? userResponse['clinic_profile']['name'] : ''}'),
                      accountEmail: Text(
                          '${Helper().isvalidElement(userResponse) ? userResponse['clinic_profile']['mobile_no'] : ''}'),
                      currentAccountPicture: CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage(
                          "${Helper().isvalidElement(userResponse) && Helper().isvalidElement(userResponse["clinic_logo"]) ? userResponse["clinic_logo"] : ''}",
                        ),
                        backgroundColor: Colors.white,
                      ),
                      otherAccountsPictures: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('${userResponse['clinic_profile']['name'][0]}'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // height: 1000,
                     height: screenHeight*0.62,
                    //  color: Colors.red,
                    child: SingleChildScrollView(
                       child: Column(
                children: [
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
                    title: Text('Reports'),
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
                    leading:
                        // Icon(FontAwesome5.teeth_open),
                        Image.asset(
                      'assets/images/teeth.png',
                      height: 28,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DentalPlan()),
                      );
                    },
                  ),
                ])
                    )
                  ),
                  SizedBox(
                     height: screenHeight*0.01,
                  ),
                  Container(
                  height: screenHeight*0.07,
                   width: MediaQuery.of(context).size.width,
                  // color: Colors.green,
                  child:     Image.asset(
                      'assets/images/nigsoft_logo.png',
                    //  height: 20,
                     fit: BoxFit.cover,
                    ),
                  ), SizedBox(
                     height: screenHeight*0.01,
                  ),
                 
                ],
              ),
            );
  }
}