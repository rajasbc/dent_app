import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/MedicineWidget/Methods/MadicineMethodApi.dart';
import 'package:nigdent/api/Apicall.dart';

import '../Common/utils.dart';
import 'AddMedicine.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  var accessToken;
  var medicine_list;
  bool isLoading = false;

  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];

    method();
    super.initState();
  }

  method() async {
    isLoading = true;
    var get_medicine_list =
        await MedicineMethodApi().getPrescriptionApi(accessToken, context);
    this.setState(() {
      medicine_list = get_medicine_list;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.app_color,
        title: const Text('Patient Medicine List'),
      ),
      body: Container(
        //  = MediaQuery.of(context).size.width;
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                // Container(
                //   // height: screenheight * 0.1,
                //   // color: Colors.amber,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.48,
                //         height: MediaQuery.of(context).size.height * 0.13,
                //         child: Padding(
                //           padding: const EdgeInsets.all(3.0),
                //           child: InkWell(
                //             splashColor: Colors.white,
                //             child: Container(
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(10),
                //                       topRight: Radius.circular(10),
                //                       bottomLeft: Radius.circular(10),
                //                       bottomRight: Radius.circular(10)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Colors.grey.withOpacity(0.3),
                //                       spreadRadius: 3,
                //                       blurRadius: 4,
                //                       offset: Offset(
                //                           0, 3), // changes position of shadow
                //                     ),
                //                   ],
                //                 ),
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: <Widget>[
                //                     // Icon(
                //                     //   Icons.local_hospital_outlined,
                //                     //   color: CustomColors.app_color,
                //                     // ), // <-- Icon
                //                     // Image.asset(
                //                     //   'assets/images/bulkpay_icon.png',
                //                     //   height: 40,
                //                     // ),
                //                     Icon(
                //                       Icons.payment,
                //                       color: CustomColors.app_color,
                //                       size: 50,
                //                     ),
                //                     Text("Bulk Medicine payment"), // <-- Text
                //                   ],
                //                 )),
                //             onTap: () {
                //               // Navigator.push(
                //               //   context,
                //               //   MaterialPageRoute(
                //               //       builder: (context) =>
                //               //           const DoctorsList()),
                //               // );

                //               this.setState(() {
                //                 // bulk_pay = !bulk_pay;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: MediaQuery.of(context).size.width * 0.48,
                //         height: MediaQuery.of(context).size.height * 0.13,
                //         child: Padding(
                //           padding: const EdgeInsets.all(3.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Column(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   InkWell(
                //                     splashColor: Colors.white,
                //                     child: Container(
                //                         width:
                //                             MediaQuery.of(context).size.width /
                //                                 2.2,
                //                         height:
                //                             MediaQuery.of(context).size.height *
                //                                 0.055,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(10),
                //                               topRight: Radius.circular(10),
                //                               bottomLeft: Radius.circular(10),
                //                               bottomRight: Radius.circular(10)),
                //                           boxShadow: [
                //                             BoxShadow(
                //                               color:
                //                                   Colors.grey.withOpacity(0.3),
                //                               spreadRadius: 3,
                //                               blurRadius: 4,
                //                               offset: Offset(0,
                //                                   3), // changes position of shadow
                //                             ),
                //                           ],
                //                         ),
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.center,
                //                           children: [
                //                             Icon(
                //                               Icons.add,
                //                               color: CustomColors.app_color,
                //                               size: 25,
                //                             ), // <-- Icon
                //                             Text(" Add Medicine"),
                //                           ],
                //                         )),
                //                     onTap: () {
                //                       // Navigator.push(
                //                       //   context,
                //                       //   MaterialPageRoute(
                //                       //       builder: (context) =>
                //                       //           const DoctorsList()),
                //                       // );
                //                     },
                //                   ),
                //                   InkWell(
                //                     splashColor: Colors.white,
                //                     child: Container(
                //                         width:
                //                             MediaQuery.of(context).size.width /
                //                                 2.2,
                //                         height:
                //                             MediaQuery.of(context).size.height *
                //                                 0.055,
                //                         // width: screenwidth * 0.4,
                //                         // height: screenHeight*0.22,
                //                         // height: screenHeight * 0.1,
                //                         decoration: BoxDecoration(
                //                           color: Colors.white,
                //                           borderRadius: BorderRadius.only(
                //                               topLeft: Radius.circular(10),
                //                               topRight: Radius.circular(10),
                //                               bottomLeft: Radius.circular(10),
                //                               bottomRight: Radius.circular(10)),
                //                           boxShadow: [
                //                             BoxShadow(
                //                               color:
                //                                   Colors.grey.withOpacity(0.3),
                //                               spreadRadius: 3,
                //                               blurRadius: 4,
                //                               offset: Offset(0, 3),
                //                             ),
                //                           ],
                //                         ),
                //                         child: Row(
                //                           mainAxisAlignment:
                //                               MainAxisAlignment.center,
                //                           children: [
                //                             Icon(
                //                               Icons.picture_as_pdf,
                //                               color: CustomColors.app_color,
                //                               size: 25,
                //                             ),
                //                             Text(" PDF"),
                //                           ],
                //                         )),
                //                     onTap: () {
                //                       // Navigator.push(
                //                       //   context,
                //                       //   MaterialPageRoute(
                //                       //       builder: (context) =>
                //                       //           const DoctorsList()),
                //                       // );
                //                     },
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(),
                !isLoading
                    ? Container(
                        // height: MediaQuery.of(context).size.height * 0.70,
                        child: Helper().isvalidElement(medicine_list) &&
                                medicine_list.length > 0
                            ? ListView.builder(
                                shrinkWrap: true,
                                // scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.all(5),
                                itemCount: medicine_list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = medicine_list[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
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
                                                                // Image.asset(
                                                                //   'assets/images/teeth1.png',
                                                                //   height:
                                                                //       18,
                                                                // ),
                                                                Icon(
                                                                  Icons.medical_information,
                                                                  // color: CustomColors
                                                                  //     .app_color,
                                                                  color: Colors
                                                                      .black45,
                                                                ),
                                                                Text(
                                                                    ' Medicine ${data['medicine']}',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12)),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                        child: Container(
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            style: TextButton
                                                                .styleFrom(
                                                              minimumSize: Size
                                                                  .zero, // Set this
                                                              padding: EdgeInsets
                                                                  .zero, // and this
                                                            ),
                                                            child: Text(
                                                              '${data['date']}',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .black,
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    children: [
                                                      // Image.asset(
                                                      //   'assets/images/treatment_icon.png',
                                                      //   height: 18,
                                                      // ),
                                                      Icon(
                                                        Icons
                                                            .description_outlined,
                                                        // color: CustomColors
                                                        //     .app_color,
                                                      ),
                                                      Text(
                                                          '  Pattern: ${data['medicine1']}',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          )),
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
                                                          'Total price: ${data['total_price'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                      Text(
                                                          'Balance: ${data['balance'].toString()}',
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
                                                          'Quantity: ${data['balance'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                      Text(
                                                          'Status: ${data['pay_status'].toString()}',
                                                          style: TextStyle(
                                                              fontSize: 12)),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox(
                                                //   height: 22,
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //             4.0),
                                                //     child: Row(
                                                //       mainAxisAlignment:
                                                //           MainAxisAlignment
                                                //               .spaceBetween,
                                                //       children: [
                                                //         Text(
                                                //             'Status: ${data['pay_status'].toString()}',
                                                //             style: TextStyle(
                                                //                 fontSize: 12)),
                                                //         TextButton(
                                                //           onPressed: () {
                                                //             // Navigator.push(
                                                //             //   context,
                                                //             //   MaterialPageRoute(
                                                //             //       builder:
                                                //             //           (context) =>
                                                //             //               BillingPay()),
                                                //             // );
                                                //           },
                                                //           style: TextButton
                                                //               .styleFrom(
                                                //             minimumSize: Size
                                                //                 .zero, // Set this
                                                //             padding: EdgeInsets
                                                //                 .zero, // and this
                                                //           ),
                                                //           child: Text(
                                                //             'Pay',
                                                //             style: TextStyle(
                                                //                 fontSize: 12,
                                                //                 color: CustomColors
                                                //                     .app_color,
                                                //                 fontWeight:
                                                //                     FontWeight
                                                //                         .bold),
                                                //           ),
                                                //         ),
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                            : Image.asset(
                                'assets/images/no_data_found.png',
                              ))
                    : Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/loading_image.png',
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
