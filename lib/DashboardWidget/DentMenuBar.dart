import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nigdent/AppointmentWidget/Appointment.dart';
import 'package:nigdent/BillingWidget/BillingList.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/PlanWidget/DentalPlanWidget.dart';
import 'package:nigdent/ReportWidget/BillingCollectionReport.dart';
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
import 'package:nigdent/api/Apicall.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../CofigWidget/ClinicConfig.dart';
import '../DoctorWidget/DoctorsList.dart';
import '../MedicineWidget/MedicineList.dart';
import '../StaffWidget/StaffList.dart';
import '../Medical_allergyWidget/MedicalAllergy.dart';
class DentMenuBar extends StatefulWidget {
  const DentMenuBar({Key? key}) : super(key: key);

  @override
  State<DentMenuBar> createState() => _DentMenuBarState();
}

class _DentMenuBarState extends State<DentMenuBar> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  TextEditingController searchText = TextEditingController();
  List<String> suggestions = [
    "USA",
    "UK",
    "Uganda",
    "Uruguay",
    "United Arab Emirates",
    "USA",
    "United Arab Emirate",
    "United Arab Emiraes",
    "United Arab mirates",
    "United Arb Emirates",
    "Unted Arab Emirates",
    "Unied Arab Emirates",
    "United Arab Emiraes",
    "Uited Arab Emirates",
    "Urugua",
    "Urugay",
    "Urguay"
  ];
  var selectedPatient = null;
  var userResponse = null;
  var patientList = null;
  var autoCompleteLoader = false;
  var planLoader = false;
  var searchList;
  var showAutoComplete = true;
  @override
  void initState() {
    this.setState(() {
      userResponse = storage.getItem('userResponse');
    });

    getPatientList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (storage.getItem('selectedPatient') != null) {
      selectedPatient = storage.getItem('selectedPatient');
    }
    // userResponse = storage.getItem('userResponse');
    return Container(
      height: screenHeight,
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.25,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: CustomColors.app_color),
              accountName: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${Helper().isvalidElement(userResponse) ? userResponse['clinic_profile']['name'].toString().toUpperCase() : ''}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Clinic ID: ${Helper().isvalidElement(userResponse) ? userResponse['clinic_profile']['id'].toString().toUpperCase() : ''}'),
                  ],
                ),
              ),
              accountEmail: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${Helper().isvalidElement(userResponse) && Helper().isvalidElement(userResponse['clinic_profile']) && Helper().isvalidElement(userResponse['clinic_profile']['email']) ? userResponse['clinic_profile']['email'] : ''}'),
                  Text(
                      '${Helper().isvalidElement(userResponse) && Helper().isvalidElement(userResponse['clinic_profile']) && Helper().isvalidElement(userResponse['clinic_profile']['mobile_no']) ? userResponse['clinic_profile']['mobile_no'] : ''}'),
                  Text(
                      '${Helper().isvalidElement(userResponse) && Helper().isvalidElement(userResponse['clinic_profile']) && Helper().isvalidElement(userResponse['clinic_profile']['city']) ? userResponse['clinic_profile']['city'] : ''}'),
                ],
              ),
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
                  child: Text(
                      '${userResponse['clinic_profile']['name'][0].toString().toUpperCase()}'),
                )
              ],
            ),
          ),
          Container(
              // height: 1000,
              height: screenHeight * 0.7,
              //  color: Colors.red,
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.08,
                    // width: screenWidth,
                    //  color: Colors.red,
                    //                 child:
                    //                  Padding(
                    // padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth * 0.8,
                      // color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: selectedPatient != null
                            ? renderSelectedPatientWidget(
                                screenWidth, screenHeight)
                            : autoCompleteLoader
                                ? SizedBox(
                                    child: SpinKitWave(
                                      color: CustomColors.app_color,
                                      size: 20.0,
                                      itemCount: 6,
                                    ),
                                  )
                                : showAutoComplete
                                    ? renderSearchBar(screenWidth, screenHeight)
                                    : renderSelectedPatientWidget(
                                        screenWidth, screenHeight),
                      ),
                    ),
                    // ),
                  ),
                  Container(
                    //  color: Colors.green,
                    height: screenHeight * 0.62,
                    child: SingleChildScrollView(
                        child: Column(children: [
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PatientRegisterReport()),
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
                                    builder: (context) =>
                                        PatientReportSummary()),
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
                            title: Text('Billing Collection Report'),
                            leading: Icon(Icons.collections),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CollectionReport()));
                            },
                          ),

                          // ListTile(
                          //   title: Text('Performance Summary'),
                          //   leading: Icon(Icons.summarize_sharp),
                          //   onTap: () {
                          //      Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => PerformanceSummary())
                          //       );
                          //   },
                          // ),

                          // ListTile(
                          //   title: Text('Plan Summary'),
                          //   leading: Icon(Icons.summarize_outlined),
                          //   onTap: () {
                          //      Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => PlanSummary())
                          //       );
                          //   },
                          // ),

                          ListTile(
                            title: Text('Top Treatment & Diagnosis'),
                            leading: Icon(Icons.add_to_photos),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TopTreatmentDiagnosis()));
                            },
                          ),

                          ListTile(
                            title: Text('Revenue Report'),
                            leading: Icon(Icons.reviews_rounded),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RevenueReport()));
                            },
                          ),

                          // ListTile(
                          //   title: Text('Payment Report'),
                          //   leading: Icon(Icons.payment),
                          //   onTap: () {
                          //      Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => PaymentReport())
                          //       );
                          //   },
                          // ),

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
                        // selectedTileColor: CustomColors.app_color,
                        // selectedColor: CustomColors.app_color,
                        title: Text('Plan'),
                        // trailing: !planLoader? SpinKitWave(
                        //   itemCount: 5,
                        //   size: 20,
                        // ): Text(''),
                        // trailing: SpinKitWave(
                        //   itemCount: 5,
                        //   size: 15,
                        //   color: Colors.blue,
                        // ),
                        leading:
                            // Icon(FontAwesome5.teeth_open),
                            Image.asset(
                          'assets/images/teeth.png',
                          height: 28,
                        ),
                        onTap: () {
                          // this.setState(() {
                          //   planLoader = true;
                          // });
                          //     planLoader = true;
                          //   Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const DentalPlan()),
                          // );
                          // planLoader = true;
                          //  this.setState(() {
                          //     planLoader = false;
                          //   });
                          if (selectedPatient != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DentalPlan()),
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Patient Not Selected',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: CustomColors.error_color,
                                textColor: Colors.white,
                                fontSize: 15.0);
                          }
                        },
                      ),
                      //  ListTile(
                      //   title: Text('Medical Allergy'),
                      //   leading: Icon(Icons.medication_liquid_outlined),
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const MedicalAllergy()),
                      //     );
                      //   },
                      // ),
                      ListTile(
                        title: Text('Medicine'),
                        leading: Icon(Icons.medical_services_rounded),
                        onTap: () {
                          if (selectedPatient != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Medicine()),
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Patient Not Selected',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: CustomColors.error_color,
                                textColor: Colors.white,
                                fontSize: 15.0);
                          }
                        },
                      ),
                      ListTile(
                        // selectedTileColor: CustomColors.app_color,
                        // selectedColor: CustomColors.app_color,
                        title: Text('Billing'),
                        // trailing: !planLoader? SpinKitWave(
                        //   itemCount: 5,
                        //   size: 20,
                        // ): Text(''),
                        // trailing: SpinKitWave(
                        //   itemCount: 5,
                        //   size: 15,
                        //   color: Colors.blue,
                        // ),
                        // leading:
                        leading: Icon(Icons.blinds_closed),

                        // Icon(FontAwesome5.teeth_open),
                        //     Image.asset(
                        //   'assets/images/teeth.png',
                        //   height: 28,
                        // ),
                        onTap: () {
                          // this.setState(() {
                          //   planLoader = true;
                          // });
                          //     planLoader = true;
                          //   Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const DentalPlan()),
                          // );
                          // planLoader = true;
                          //  this.setState(() {
                          //     planLoader = false;
                          //   });
                          if (selectedPatient != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BillingList()),
                            );
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Patient Not Selected',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: CustomColors.error_color,
                                textColor: Colors.white,
                                fontSize: 15.0);
                          }
                        },
                      ),
                      //  ListTile(
                      //         title: Text('Doctors'),
                      //         leading: Icon(Icons.local_hospital_outlined),
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const DoctorsList()),
                      //           );
                      //         },
                      // ),
                      //  ListTile(
                      //         title: Text('Staffs'),
                      //         leading: Icon(Icons.groups_rounded),
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const StaffList()),
                      //           );
                      //         },
                      // ),
                      //  ListTile(
                      //         title: Text('Config'),
                      //         leading: Icon(Icons.content_copy_rounded),
                      //         onTap: () {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => const ClinicConfig()),
                      //           );
                      //         },
                      // ),
                    ])),
                  ),
                ],
              )),
          SizedBox(
            height: screenHeight * 0.008,
          ),
          // Container(
          // height: screenHeight*0.07,
          //  width: MediaQuery.of(context).size.width,
          // // color: Colors.yellow,
          // child:     Image.asset(
          //     'assets/images/nigsoft_logo.png',
          //   //  height: 20,
          //    fit: BoxFit.cover,
          //   ),
          // ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
        ],
      ),
    );
  }
//   renderSearchBar(screenWidth, screenHeight) {
//     return Container(
//       // width: screenWidth,height: screenHeight,
//       // height: MediaQuery.of(context).size.height *0.08,
//       // color: Colors.white,
//       // alignment: Alignment.center,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.blueAccent),
//           borderRadius: BorderRadius.all(Radius.circular(20))),
//       child: ListTile(
//         // style: ite,
//         leading: Container(
//           width: screenWidth*0.08,
//           color: Colors.green, child: Icon(Icons.search)),
//         trailing: Container(
//             width: screenWidth*0.1,
//             height: screenHeight *0.05,
//             alignment: Alignment.center,
//             color: Colors.orange,
//           child: IconButton(
//               onPressed: () {
//                 searchText.text = '';
//                 // searchList = null;
//                 this.setState(() {});
//               },
//               icon: Icon(Icons.close)),
//         ),
//         title: Container(
//           // height: screenHeight*0.1,
//           color: Colors.yellow,

//            width: screenWidth*0.8,
//           child: TextField(

//             controller: searchText,
//             onChanged: (text) {
//               print(text);
//               // this.setState(() {});
//               // var list = diagnosisList['DiagnosisList'];

// // function filter(_items) {
// //     return _items.map((day, items) {
// //         return new MapEntry(day, items.where((i) {
// //           return i.stringProperty.contains(widget.filter) ? true : false;
// //         }).toList());
// //     });
// // }

// // list.map((day, items) {
// //         return new MapEntry(day, items.where((i) {
// //           return i.diagnosis_name.toString().contains(text) ? true : false;
// //         }).toList());
// //     });

//               // searchList = list.where((element) {
//               //   // element = isSwitchOn == true
//               //   //     ? new PatientListModal.fromMap(element)
//               //   //     : element;
//               //   final diagnosisName = element?.diagnosis_name.toLowerCase();
//               //   // final number = element?.mobile_no;
//               //   return diagnosisName.contains(text.toLowerCase());
//               // }).toList();
//               this.setState(() {});
//             },
//             decoration: new InputDecoration(
//               filled: true,
//               border: InputBorder.none,
//               fillColor: Colors.blue,
//               hintText: 'Search Patient Name',

//             ),
//           ),
//         ),
//       ),
//     );
//   }

  getPatientList() async {
    this.setState(() {
      autoCompleteLoader = true;
    }); // userResponse = storage.getItem('userResponse');
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
        autoCompleteLoader = false;
      });
    }
  }

  renderSelectedPatientWidget(screenWidth, screenHeight) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.app_color),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // color: Colors.black38,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.6,

              // color: Colors.yellow,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Helper().isvalidElement(selectedPatient)
                            ? "${selectedPatient['title'].toString() + ". " + selectedPatient['p_name'].toString().toUpperCase()}"
                            : '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(Helper().isvalidElement(selectedPatient)
                          ? "Reg.No ${selectedPatient['patient_id'].toString()}"
                          : ''),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                // height: screenHeight,
                width: screenWidth * 0.1,
                // color: Colors.green,
// width: screenWidth*0.2,
                child: IconButton(
                  onPressed: () {
                    storage.setItem('selectedPatient', null);
                    this.setState(() {
                      selectedPatient = null;
                      showAutoComplete = true;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                  color: CustomColors.error_color,
                ))
          ],
        ),
      ),
    );
  }

  renderSearchBar(screenWidth, screenHeight) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: CustomColors.app_color),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Container(
              width: screenWidth * 0.1,
              height: screenHeight,
              child: Icon(Icons.search)),
          Container(
              width: screenWidth * 0.6,
              height: screenHeight,
              child: renderAutoComplete(screenWidth, screenHeight)),
        ],
      ),
    );
  }

  renderAutoComplete(screenWidth, screenHeight) {
    return Autocomplete<List>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<List>.empty();
        } else {
          var matches = [];
          matches.addAll(patientList);
          matches.retainWhere((s) {
            return s['p_name']
                .toString()
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
          this.setState(() {
            showAutoComplete = true;
          });
          return [matches];
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          decoration: InputDecoration(
              //  border: OutlineInputBorder(),
              hintText: 'Search Patient Name'),
          controller: textEditingController,
          focusNode: focusNode,
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<List> onSelected, Iterable<List> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: screenWidth * 0.7,
              height: screenHeight * 0.4,
              color: CustomColors.app_color,
              child: ListView.builder(
                padding: EdgeInsets.all(5.0),
                itemCount: options.toList()[0].length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.toList()[0].elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      storage.setItem(
                          'selectedPatient', options.toList()[0][index]);
                      this.setState(() {
                        selectedPatient = options.toList()[0][index];
                        showAutoComplete = false;
                      });
                    },
                    child: Container(
                      color: CustomColors.app_color,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Name: ${options.toList()[0][index]['p_name'].toString().toUpperCase()}',
                              style: const TextStyle(color: Colors.white)),
                          Text(
                              'Phone: ${options.toList()[0][index]['p_phone'].toString().toUpperCase()}',
                              style: const TextStyle(color: Colors.white)),
                          Text(
                              'Age: ${options.toList()[0][index]['p_age'].toString().toUpperCase()}',
                              style: const TextStyle(color: Colors.white)),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
