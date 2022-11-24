import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:nigdent/PlanWidget/AdultsModal.dart';
import 'package:nigdent/PlanWidget/MixedModal.dart';
import 'package:nigdent/PlanWidget/PeadoModal.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DentalPlan extends StatefulWidget {
  const DentalPlan({super.key});

  @override
  State<DentalPlan> createState() => _DentalPlanState();
}

class _DentalPlanState extends State<DentalPlan> {
  String defaultDropdownValue = 'Adult';
  var dropdownValues = ['Adult', 'Peado', 'Mixed'];
  // var map = new Map();
  // var val = [];
  bool isSwitchOn = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text('Dent Plan'),
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // width: screenWidth,
                height: screenHeight * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // alignment: Alignment.center,
                        width: screenWidth * 0.95,
                        // height: screenHeight* 0.5,
                        child: DropdownButtonFormField(
                          // Initial Value
                          autovalidateMode: AutovalidateMode.always,
                          // validator: (value) {
                          //   if (value == null ||
                          //       value.isEmpty ||
                          //       value == 'Select title') {
                          //     return 'You must select title';
                          //   }
                          //   return null;
                          // },
                          value: defaultDropdownValue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          items: dropdownValues.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultDropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                      // Container(
                      //     width: screenWidth * 0.2,
                      //     child: ElevatedButton(
                      //         onPressed: () {}, child: Text('Clear')))
                    ],
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.5,
                // color: Colors.blue,
                child: defaultDropdownValue == 'Adult'
                    ? AdultsModalWidget()
                    : defaultDropdownValue == 'Peado'
                        ? PeadoModalWidget()
                        : MixedModalWidget(),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Container(
                // width: screenWidth *0.5,
                child: renderSwitchComponent(),
              ),

              Container(
                height: screenHeight * 0.5,
                // color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('sds'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('nmnnmnnmn'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              // Text('data')
            ],
          ),
        ),
      ),
    );
  }

  renderSwitchComponent() {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Row(
        children: [
          FlutterSwitch(
            width: MediaQuery.of(context).size.width * 0.45,
            showOnOff: true,
            activeText: "Plan Based",
            activeTextFontWeight: FontWeight.normal,
            inactiveText: "Treatment Based",
            inactiveTextFontWeight: FontWeight.normal,
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,

            // activeIcon: networkConnection == 'none'
            //     ? Icon(
            //         Icons.cloud_off,
            //         size: 20,
            //         color: Colors.blueAccent,
            //       )
            //     : Icon(
            //         Icons.cloud_done,
            //         size: 20,
            //         color: Colors.blueAccent,
            //       ),
            // inactiveIcon: networkConnection == 'none'
            //     ? Icon(
            //         Icons.cloud_off,
            //         size: 20,
            //         color: Colors.blueAccent,
            //       )
            //     : Icon(
            //         Icons.cloud_done,
            //         size: 20,
            //         color: Colors.blueAccent,
            //       ),
            activeTextColor: Colors.white,
            inactiveTextColor: Colors.white,
            value: isSwitchOn,
            onToggle: (value) async {
              setState(() {
                isSwitchOn = value;
              });
              // if (value == true &&
              //     livePatientList['status'] == 'Token is Expired') {
              //   Helper().appLogoutCall(context, livePatientList['status']);
              // }

              // initState();
              // if(value == true){
              //       // getLivePatientList();
              //       // this.setState(() {

              //       // });
              // }
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.48,
            height: MediaQuery.of(context).size.width * 0.085,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              // controller: _email,
              
              decoration: InputDecoration(
                filled: true, //<-- SEE HERE
                fillColor: Colors.blueAccent,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 3, color: Colors.blueAccent),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                      width: 3, color: Colors.blueAccent), //<-- SEE HERE
                ),
                labelText: isSwitchOn ? 'Diagnosis': 'Treatment',
                labelStyle: TextStyle(color: Colors.white,  fontSize: 20),
                hintText: isSwitchOn ? 'Search Diagnosis':'Search Treatment',
                 hintStyle:
                    TextStyle(color: Colors.white, fontSize: 13),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              ),
            ),
          ),
          //  Container(
          //   // height: MediaQuery.of(context).size.height * 0.05,
          //   width:MediaQuery.of(context).size.width*0.45,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       border: Border.all(color: Colors.blueAccent),
          //       borderRadius: BorderRadius.all(Radius.circular(8))),
          //   padding: const EdgeInsets.all(10),
          //   child: TextField(

          //   style: TextStyle(backgroundColor: Colors.blueAccent,),
          //     // controller: _email,
          //     decoration: InputDecoration(

          //       contentPadding:
          //           const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          //       border: InputBorder.none,
          //           labelText: 'Enter Name',
          //         // hintText: 'Enter Your Name'
          //     ),
          //   ),
          // ),
          // isSwitchOn == false && localPatientList.length > 0
          //     ? IconButton(
          //         onPressed: () {
          //           print(livePatientList);
          //         },
          //         icon: Icon(Icons.sync))
          //     : Container()
        ],
      ),
    );
  }
}
