import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/PlanWidget/AdultsModal.dart';
import 'package:nigdent/PlanWidget/DiagnosisList.dart';
import 'package:nigdent/PlanWidget/EditDiagnosisList.dart';
import 'package:nigdent/PlanWidget/Methods/PlanMethodApi.dart';
import 'package:nigdent/PlanWidget/MixedModal.dart';
import 'package:nigdent/PlanWidget/PeadoModal.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/api/Apicall.dart';

class DentalPlan extends StatefulWidget {
  const DentalPlan({super.key});

  @override
  State<DentalPlan> createState() => _DentalPlanState();
}

class _DentalPlanState extends State<DentalPlan> {
  final LocalStorage storage = new LocalStorage('nigdent_store');

  String defaultDropdownValue = 'Adult';
  String planDropdownValue = '0';
  String planDropdown_id = '0';

  var dropdownValues = ['Adult', 'Peado', 'Mixed'];
  // var plandropdownValues = ['Without Plan', 'Plan1', 'Plan2'];

  var diag_treat_list = [];
  // var map = new Map();
  // var val = [];
  bool isSwitchOn = false;
  bool isLoading = false;
  var treatment_details = null;
  var diagnosis_details = null;
  var accessToken;
  int treatment_total = 0;
  var treatment_balance = 0;
  var treatment_discount = 0;
  var getPlanList;
  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];

    getTreatmentDetails();
    getDiagnosisDetails();
    method();
    super.initState();
  }

  method() async {
    var getPlanList_result =
        await PlanMethodApi().getPlanListApi(accessToken, context);

    this.setState(() {
      getPlanList = getPlanList_result;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (storage.getItem('selected_diagnosis_treatment') != null) {
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
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
              icon: Icon(Icons.arrow_back)),
        ),
      ),
      body: Container(
        // height: screenHeight,
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
                height: screenHeight * 0.6,
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
                // height: screenHeight * 0.78,
                // color: Colors.green,
                // child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isSwitchOn
                      ? renderPlanBasedWidget(screenHeight)
                      : renderTreatmentBasedWidget(
                          screenHeight * 0.8, screenWidth),
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

  renderTreatmentBasedWidget(screenHeight, screenWidth) {
    return Container(
      width: screenWidth,
      height: screenHeight,
      // color: Colors.red,
      child: Column(
        children: [
          // Container(
          //  height: screenHeight*0.08,
          //   color: Colors.black12,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment:MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('Total Fees: 500', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
          //        Text('Total Discount: 5000', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
          //         Text('Total Balance: 5000', style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
          //     ],
          // ),
          //   )),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          // Divider(color: Colors.white,),
          !isLoading
              ? Container(
                  height: screenHeight * 0.85,
                  // color: Colors.red,

                  child: Helper().isvalidElement(treatment_details) &&
                          treatment_details.length > 0
                      ? ListView.builder(
                          // padding: EdgeInsets.all(5.0),
                          itemCount: treatment_details.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = treatment_details[index];
                            return Container(
                                color: index % 2 == 0
                                    ? Color.fromARGB(255, 218, 235, 238)
                                    : Colors.white,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'S.No: ${index + 1}',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              Text(
                                                  'Teeth: ${data['teeth_no'] + '-' + data['teeth_postion']}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              // Text('Date: ${data['fees']}', style: TextStyle(fontSize: 12),),
                                              Text('Visit:  ${data['visit']}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                        //        Padding(
                                        //   padding: const EdgeInsets.all(2.0),
                                        //   child: Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text('Teeth: ${data['teeth_no'] + '-' + data['teeth_postion']}',style: TextStyle(fontSize: 12)),
                                        //       Text('Exam: ${index}',style: TextStyle(fontSize: 12)),
                                        //     ],
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Treatment: ${data['treatment']}',
                                                  style:
                                                      TextStyle(fontSize: 11)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Fees: ${data['fees'].toString()}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Text(
                                                  'Discount: ${data['discount'].toString()}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Text(
                                                  'Balance: ${data['balance'].toString()}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Text(
                                                  'Status: ${data['pay_status'].toString()}',
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                    // Text('Name: ${options.toList()[0][index]['p_name'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                    // Text('Phone: ${options.toList()[0][index]['p_phone'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                    // Text('Age: ${options.toList()[0][index]['p_age'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                    // Divider(thickness: 1,)
                                  ],
                                ));
                          },
                        )
                      : Image.asset(
                          'assets/images/no_data_found.png',
                          // height: screenheight * 0.3,
                          // color: Colors.blue.shade100,
                          // color: Colors.black12,
                        ))
              : Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/loading_image.png',
                    // height: screenheight * 0.3,
                    // color: Colors.blue.shade100,
                    // color: Colors.black12,
                  ),
                ),
        ],
      ),
    );
  }

  renderPlanBasedWidget(screenHeight) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            // width: screenWidth * 0.95,
            // height: screenHeight * 0.1,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Plan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )),
                Helper().isvalidElement(getPlanList) && getPlanList.length > 0
                    ? DropdownButtonFormField(
                        // Initial Value
                        // autovalidateMode: AutovalidateMode.always,
                        // validator: (value) {
                        //   if (value == null ||
                        //       value.isEmpty ||
                        //       value == 'Select title') {
                        //     return 'You must select title';
                        //   }
                        //   return null;
                        // },
                        // value: planDropdownValue,

                        // Down Arrow Icon
                        // icon: const Icon(Icons.keyboard_arrow_down),
                        // Array list of items
                        hint: Text("Without Plan"),

                        items:
                            getPlanList.map<DropdownMenuItem<String>>((item) {
                          return new DropdownMenuItem(
                              child: new Text(
                                item['plan_name'].toString(),
                                // style: TextStyle(fontSize: 12),
                              ),
                              value: item['plan_no'].toString() +
                                  "*&" +
                                  item['id'].toString());
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (String? newValue) {
                          var plan_drop = newValue.toString().split('*&');
                          setState(() {
                            planDropdownValue = plan_drop[0].toString();
                            planDropdown_id = plan_drop[1].toString();
                          });
                        },
                      )
                    : DropdownButtonFormField(
                        // validator: (value) => validateDrops(value),
                        // isExpanded: true,
                        // hint: Text('Select Treatment'),
                        // value:' _selectedState[i]',
                        onChanged: (selectedDoctor) {
                          setState(() {
                            planDropdownValue = "0";
                          });
                        },
                        items: [].map<DropdownMenuItem<String>>((item) {
                          return new DropdownMenuItem(
                            child: new Text('Without Plan'),
                            value: '0',
                          );
                        }).toList(),
                      )
              ],
            )),
        SizedBox(height: 10),
        Helper().isvalidElement(diagnosis_details) &&
                diagnosis_details.length > 0
            ? Column(
                children: [
                  Container(
                    // height: screenHeight * 0.8,
                    // color: Colors.red,
                    child: ListView.builder(
                        shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: diagnosis_details.length,
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          var data = diagnosis_details[index];
                          return diagnosis_details[index]['plan_id']
                                      .toString() ==
                                  this.planDropdownValue
                              ? Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                      // color: index % 2 == 0
                                      //     ? Color.fromARGB(255, 218, 235, 238)
                                      //     : Colors.white,
                                      decoration: BoxDecoration(
                                        // color: Colors.white,
                                        color: index % 2 == 0
                                            ? Color.fromARGB(255, 218, 235, 238)
                                            : Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          GestureDetector(
                                                            // onTap: () {message();},
                                                            child: ClipOval(
                                                              child: Container(
                                                                color: CustomColors
                                                                    .app_color,
                                                                height: 25.0,
                                                                width: 25.0,
                                                                child: Center(
                                                                    child: Text(
                                                                  '${index + 1}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 6.0),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/teeth1.png',
                                                                  height: 18,
                                                                ),
                                                                Text(
                                                                    '  Teeth: ${data['teeth_no'] + '-' + data['teeth_postion']}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)),
                                                              ],
                                                            ),
                                                          ),

                                                          // Text('Date: ${data['fees']}', style: TextStyle(fontSize: 12),),
                                                          // SizedBox(
                                                          //   height: screenHeight * 0.01,
                                                          //   // width: 18.0,
                                                          //   child: Row(
                                                          //     children: [
                                                          //       IconButton(
                                                          //           // padding:
                                                          //           //     new EdgeInsets.all(0.0),
                                                          //           // onPressed: () {},
                                                          //           onPressed: () {
                                                          //             storage.setItem(
                                                          //                 'diagnosis_item_list',
                                                          //                 data);
                                                          //             // storage.getItem('diagnosis_item_list');
                                                          //             //         final myMap = Map<String, dynamic>.from(data);
                                                          //             // return Prices.fromJson(myMap);
                                                          //             //         var a = jsonEncode(data);
                                                          //             Navigator.push(
                                                          //               context,
                                                          //               MaterialPageRoute(
                                                          //                 builder: (context) =>
                                                          //                     EditDiagnosisiList(),
                                                          //               ),
                                                          //             );
                                                          //           },

                                                          //           icon: Icon(Icons.edit,
                                                          //               size: 11.0)),
                                                          //               Text('data')
                                                          //     ],
                                                          //   ),
                                                          // )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                        child: Container(
                                                          child: TextButton(
                                                            onPressed: () {
                                                              storage.setItem(
                                                                  'diagnosis_item_list',
                                                                  data);
                                                              // storage.getItem('diagnosis_item_list');
                                                              //         final myMap = Map<String, dynamic>.from(data);
                                                              // return Prices.fromJson(myMap);
                                                              //         var a = jsonEncode(data);
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          EditDiagnosisiList(),
                                                                ),
                                                              );
                                                            },
                                                            style: TextButton
                                                                .styleFrom(
                                                              minimumSize: Size
                                                                  .zero, // Set this
                                                              padding: EdgeInsets
                                                                  .zero, // and this
                                                            ),
                                                            child: Text(
                                                              'Edit',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                //        Padding(
                                                //   padding: const EdgeInsets.all(2.0),
                                                //   child: Row(
                                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                //     children: [
                                                //       Text('Teeth: ${data['teeth_no'] + '-' + data['teeth_postion']}',style: TextStyle(fontSize: 12)),
                                                //       Text('Exam: ${index}',style: TextStyle(fontSize: 12)),
                                                //     ],
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/teeth.png',
                                                        height: 18,
                                                      ),
                                                      Text(
                                                          '  Diagnosis: ${data['diagnosis']}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                      // Text('Visit:  ${data['visit']}',
                                                      //     style: TextStyle(fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/treatment_icon.png',
                                                        height: 18,
                                                      ),
                                                      Text(
                                                          '  Treatment: ${data['diagnosis']}',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
                                                      // Text('Visit:  ${data['visit']}',
                                                      //     style: TextStyle(fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          'Fees: ${data['fees'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                      Text(
                                                          'Discount: ${data['discount'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          'Balance: ${data['balance'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                      Text(
                                                          'Status: ${data['status'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                            // Text('Name: ${options.toList()[0][index]['p_name'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                            // Text('Phone: ${options.toList()[0][index]['p_phone'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                            // Text('Age: ${options.toList()[0][index]['p_age'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                                            // Divider(thickness: 1,)
                                          ],
                                        ),
                                      )),
                                )
                              : Container(
                                  height: 0,
                                );
                        }),
                  ),
                  Container(
                    // alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // height: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                onPressed: () async {

                                  if (planDropdownValue == "0" || planDropdown_id == "0") {
                                    Fluttertoast.showToast(
                                        msg: 'Please Select Plan',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    var selectedPatient =
                                        storage.getItem('selectedPatient');
                                    var data = {
                                      "patient_id":
                                          selectedPatient['id'].toString(),
                                      "plan_no": planDropdownValue,
                                      "plan_id": planDropdown_id
                                    };
                                    print(data);

                                    var create_plan = await PlanMethodApi()
                                        .saveAndCreatePlan(
                                            accessToken, context, data);

                                    if (create_plan == "Update Added  Successfully") {
                                      Fluttertoast.showToast(
                                        msg: 'Update Added  Successfully',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Color.fromARGB(255, 15, 199, 64),
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                        
                                         method();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DentalPlan()),
                                    );
                                      this.setState(() {
                                        planDropdownValue = "0";
                                        planDropdown_id = "0";
                                      });
                                    }
                                  }
                                },
                                
                                child: Text('Save',
                                    style: TextStyle(fontSize: 12))),
                          ),
                        ),
                        SizedBox(
                          // height: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.app_color),
                                onPressed: () async {
                                  var selectedPatient =
                                      storage.getItem('selectedPatient');
                                  // var data = {
                                  //   "patient_id":
                                  //       selectedPatient['id'].toString(),
                                  //   "plan_no": planDropdownValue == "0" ? "" : planDropdownValue,
                                  //   "plan_id": planDropdown_id == "0" ? "" : planDropdown_id,
                                  // };
                                  var data = {
                                    "patient_id":
                                        selectedPatient['id'].toString(),
                                    "plan_no": "",
                                    "plan_id": "",
                                  };
                                  // print(data);
                                  var create_plan = await PlanMethodApi().saveAndCreatePlan(accessToken, context, data);

                                  if(create_plan == "Added  Successfully"){
                                    Fluttertoast.showToast(
                                        msg: 'Added  Successfully',
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromARGB(255, 15, 199, 64),
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    this.setState(() {
                                      planDropdownValue = "0";
                                      planDropdown_id = "0";
                                    });
                                    method();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DentalPlan()),
                                    );
                                  }

                                },
                                child: Text('New Plan',
                                    style: TextStyle(fontSize: 12))),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
            // disabled : true,
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
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(CustomColors.app_color),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: CustomColors.app_color)))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiagnosisList(
                              option: isSwitchOn ? 'diagnosis' : 'Treatment',
                            )),
                  );
                },
                child: Text(
                  isSwitchOn ? 'Add Diagnosis' : 'Add Treatment',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
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

  getTreatmentDetails() async {
    isLoading = true;
    var selectedPatient = storage.getItem('selectedPatient');
    var data = {
      'type': 'treatment',
      "patient_id": selectedPatient['id'].toString(),
    };
    treatment_details = await api().getTreatmentDetails(accessToken, data);
    if (Helper().isvalidElement(treatment_details) &&
        Helper().isvalidElement(treatment_details['status']) &&
        treatment_details['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      //  storage.setItem('diagnosisList', diagnosisList);
      isLoading = false;
      this.setState(() {
        treatment_details = treatment_details['treatment_list'];
      });
    }
  }

  getDiagnosisDetails() async {
    isLoading = true;
    var selectedPatient = storage.getItem('selectedPatient');
    var data = {
      'type': 'diagnosis',
      "patient_id": selectedPatient['id'].toString(),
    };
    diagnosis_details = await api().getTreatmentDetails(accessToken, data);
    if (Helper().isvalidElement(diagnosis_details) &&
        Helper().isvalidElement(diagnosis_details['status']) &&
        treatment_details['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      //  storage.setItem('diagnosisList', diagnosisList);
      isLoading = false;
      this.setState(() {
        diagnosis_details = diagnosis_details['diagnosis_list'];
      });
    }
  }
}
