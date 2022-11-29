// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:nigdent/AppointmentWidget/CreateAppointment.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:nigdent/DashboardWidget/DentMenuBar.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/PatientWidget/CreatePatient.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  // var userResponse;
          TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // userResponse = storage.getItem('userResponse');
double screenHeight = MediaQuery.of(context).size.height-50;
double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
        child: Container(
          width: screenwidth,
          height: screenHeight,
          child: Column(
            children: [
                 // Appointment
              Container(
                 height: screenHeight*0.35,
                   width: screenwidth,
                //  color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                    children: [
                         SizedBox(height: screenHeight*0.015,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add, color: CustomColors.app_color,size: 20,),
                                SizedBox(width: screenwidth*0.01,),
                              Text('Appointments', style: TextStyle(fontSize: 20, letterSpacing: 1.42, fontWeight: FontWeight.bold, color: CustomColors.app_color),),
                            ],
                          ),
                                                           Container( 
                            // color: Colors.yellow,
                            height: screenHeight*0.05,alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){
                                         Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAppointment()),
                      );
                            }, icon: Icon(Icons.add, color: CustomColors.app_color,size: 20,), ))
                          // Icon(Icons.add, color: CustomColors.app_color,size: 25,)
                        ],
                      ),
                      SizedBox(height: screenHeight*0.015,),
                      Container(
                        width: screenwidth*0.9,
                        height: screenHeight*0.22,
                        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('0',style: TextStyle(fontSize: 20)),
                                      SizedBox(width: screenwidth*0.02,),
                                       Text('Today', style: TextStyle(fontSize: 18, letterSpacing: 1)),
                                    ],
                                  ),
                                                                  Container( 
                            // color: Colors.yellow,
                            height: screenHeight*0.04,alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){}, icon: Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 15,), ))
                                  // Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 20,),
                                ],
                              ),
                            ),
                               Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('0',style: TextStyle(fontSize: 20)),
                                      SizedBox(width: screenwidth*0.02,),
                                       Text('Upcoming', style: TextStyle(fontSize: 18, letterSpacing: 1)),
                                    ],
                                  ),
                                                                  Container( 
                            // color: Colors.yellow,
                            height: screenHeight*0.04,alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){}, icon: Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 15,), ))
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

              // patient 
              Container(
                 height: screenHeight*0.25,
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
                              Icon(Icons.people, color: CustomColors.app_color,size: 20,),
                              SizedBox(width: screenwidth*0.01,),
                              Text('Patients', style: TextStyle(fontSize: 20, letterSpacing: 1.42, fontWeight: FontWeight.bold, color: CustomColors.app_color),),
                            ],
                          ),
                          Container( 
                            // color: Colors.yellow,
                            height: screenHeight*0.05,alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){
                                 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreatePatient()),
                      );
                            }, icon: Icon(Icons.add, color: CustomColors.app_color,size: 20,), ))
                          
                        ],
                      ),
                      SizedBox(height: screenHeight*0.015,),
                      Container(
                        width: screenwidth*0.9,
                        height: screenHeight*0.1,
                        decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('0',style: TextStyle(fontSize: 20)),
                                      SizedBox(width: screenwidth*0.02,),
                                       Text('Total Patients', style: TextStyle(fontSize: 18, letterSpacing: 1)),
                                    ],
                                  ),
                                 Container( 
                            // color: Colors.yellow,
                            height: screenHeight*0.04,alignment: Alignment.topRight,
                            child: IconButton(onPressed: (){
                              // print('total patients');
                            }, icon: Icon(FontAwesome5.eye, color: CustomColors.app_color,size: 15,), ))
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
       child: DentMenuBar(),
          ),
        // ),
      ),
    );
  }
}
