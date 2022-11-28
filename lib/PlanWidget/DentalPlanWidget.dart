import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/PlanWidget/AdultsModal.dart';
import 'package:nigdent/PlanWidget/DiagnosisList.dart';
import 'package:nigdent/PlanWidget/MixedModal.dart';
import 'package:nigdent/PlanWidget/PeadoModal.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
class DentalPlan extends StatefulWidget {
  const DentalPlan({super.key});

  @override
  State<DentalPlan> createState() => _DentalPlanState();
}

class _DentalPlanState extends State<DentalPlan> {
      final LocalStorage storage = new LocalStorage('nigdent_store');

  String defaultDropdownValue = 'Adult';
    String planDropdownValue = 'Without Plan';

  var dropdownValues = ['Adult', 'Peado', 'Mixed'];
    var plandropdownValues = ['Without Plan', 'Plan1', 'Plan2'];

  var diag_treat_list=  [];
  // var map = new Map();
  // var val = [];
  bool isSwitchOn = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(storage.getItem('selected_diagnosis_treatment') !=null){
 diag_treat_list = storage.getItem('selected_diagnosis_treatment');
    }
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: CustomColors.app_color,
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
                height: screenHeight * 0.58,
                // color: Colors.blue,
                child: defaultDropdownValue == 'Adult'
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AdultsModalWidget(),
                    )
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
                height: screenHeight * 0.8,
                // color: Colors.green,
                // child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: renderPlanBasedWidget(screenHeight),
                    // child: Column(
                    //   children: [
                    //   Helper().isvalidElement(diag_treat_list) && diag_treat_list.length > 0 ?  
                    //   Container(
                    //       height: screenHeight * 0.5,
                    //       color: Colors.red,
                    //     child: ListView.builder(
                    //               itemCount: diag_treat_list.length,
                    //               itemBuilder: (context, index) {

                    //                 return Padding(
                    //                   padding: const EdgeInsets.all(20.0),
                    //                   child: Text('${diag_treat_list[index]['diagnosis_name']}'),
                    //                 );
                    //               }),
                    //   )
                    //             : Text('No data')
                    //   ],
                    // ),
                  ),
                // ),
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
  renderPlanBasedWidget(screenHeight){
    return Column(
                      children: [
                        Container(
                        // alignment: Alignment.center,
                        // width: screenWidth * 0.95,
                        height: screenHeight* 0.1,
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
                          value: planDropdownValue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          items: plandropdownValues.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              planDropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                      Helper().isvalidElement(diag_treat_list) && diag_treat_list.length > 0 ?  
                      Container(
                          height: screenHeight * 0.6,
                          color: Colors.red,
                        child: ListView.builder(
                                  itemCount: diag_treat_list.length,
                                  // scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {

                                    return Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Text('${diag_treat_list[index]['diagnosis_name']}'),
                                    );
                                  }),
                      )
                      //  Text('******* data *********')
                                : Text('No data')
                      ],
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
            activeColor: CustomColors.app_color,
            inactiveColor: CustomColors.app_color,

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
            child: 
            TextButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(CustomColors.app_color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.blueAccent)
    )
  )
            ),
            
              onPressed: (){
               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiagnosisList(option: isSwitchOn ?'Diagnosis':'Treatment',)),
                              );
            }, child: Text(isSwitchOn ? 'Add Diagnosis': 'Add Treatment', style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),)
            // TextField(
            //   style: TextStyle(
            //     color: Colors.white,
            //   ),
            //   // controller: _email,
            //   onTap: (){
            //       Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (context) => DiagnosisList(option: isSwitchOn ?'Diagnosis':'Treatment',)),
            //                   );
            //   },
            //   decoration: InputDecoration(
            //     filled: true, //<-- SEE HERE
            //     fillColor: Colors.blueAccent,
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(15)),
            //       borderSide: BorderSide(width: 3, color: Colors.blueAccent),
            //     ),

            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(15)),
            //       borderSide: BorderSide(
            //           width: 3, color: Colors.blueAccent), //<-- SEE HERE
            //     ),
            //     labelText: isSwitchOn ? 'Add Diagnosis': 'Add Treatment',
            //     labelStyle: TextStyle(color: Colors.white,  fontSize: 13,),
            //      hintStyle:
            //         TextStyle(color: Colors.white, fontSize: 13),
            //     contentPadding:
            //         const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            //   ),
            // ),
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
