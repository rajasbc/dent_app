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
                ListTile(
                  title: Text('Plan'),
                  leading: Icon(FontAwesome5.teeth_open),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DentalPlan()),
                    );
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
