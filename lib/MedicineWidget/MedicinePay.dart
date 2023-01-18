import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/MedicineWidget/MedicineList.dart';
import 'package:nigdent/MedicineWidget/Methods/MadicineMethodApi.dart';

import '../BillingWidget/Methods/BillingMethodApi.dart';
import '../Common/utils.dart';

class MedicinePay extends StatefulWidget {
  MedicinePay({Key? key}) : super(key: key);

  @override
  State<MedicinePay> createState() => _MedicinePayState();
}

class _MedicinePayState extends State<MedicinePay> {
  bool View_history = false;

  var pay = [
    'Payment Type : ',
    'Amazon Pay',
    'Cash',
    'Card',
    'Google Pay',
    'Net Banking',
    'PAYTM',
    'PhonePe',
  ];

  TextEditingController balanceReceivedController = TextEditingController();

  String payDropdownvalue = 'Payment Type : ';

  bool isLoading = false;
  var accessToken;
  var selectedPatient;
  var medicineLog;
  var medicine_item_list;
  @override
  void initState() {
    // TODO: implement initState
    accessToken = storage.getItem('userResponse')['access_token'];

    selectedPatient = storage.getItem('selectedPatient');

    method();
    super.initState();
  }

  method() async {
    isLoading = true;

    var get_medicine_item_list = storage.getItem('medicine_list_item');

    var data = {
      "presc_id": get_medicine_item_list['id'],
    };
    var get_medicinePayLog = await MedicineMethodApi()
        .getMadicinePayLogApi(accessToken, context, data);

    this.setState(() {
      medicineLog = get_medicinePayLog;
      medicine_item_list = get_medicine_item_list;
      isLoading = false;
    });

    // this.setState(() {
    //   bill_item_list = get_bill_item_list;
    //   billingPayLog = get_billingPayLog;
    //   isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Pay'),
        backgroundColor: CustomColors.app_color,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: !isLoading
                ? Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 4,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Medicine Amount "),
                                                Text(
                                                    "${medicineLog['total_price'].toString()}"),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Payable"),
                                                Text(
                                                    "${medicineLog['total_price']}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  splashColor: Colors.white,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 3,
                                            blurRadius: 4,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "Total paid (₹): ${medicineLog['total_paid']}"),
                                                SizedBox(
                                                  height: 20,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      // Navigator.push(
                                                      //   context,
                                                      //   MaterialPageRoute(
                                                      //       builder:
                                                      //           (context) =>
                                                      //               BillingPay()),
                                                      // );
                                                      this.setState(() {
                                                        View_history =
                                                            !View_history;
                                                      });
                                                    },
                                                    style: TextButton.styleFrom(
                                                      minimumSize:
                                                          Size.zero, // Set this
                                                      padding: EdgeInsets
                                                          .zero, // and this
                                                    ),
                                                    child: Text(
                                                      'View History',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: CustomColors
                                                              .app_color,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    "Balance Amount (₹): ${medicineLog['balance']}"),
                                                Text(""),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      View_history
                          ? Container(
                              child: medicineLog['billing_log'].length > 0 &&
                                      medicineLog['billing_log'] !=
                                          "No Transcation"
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      // scrollDirection: Axis.vertical,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.all(5),
                                      itemCount:
                                          medicineLog['billing_log'].length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data =
                                            medicineLog['billing_log'][index];
                                        return Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              // color: Colors.white,
                                              color: index % 2 == 0
                                                  ? Color.fromARGB(
                                                      255, 218, 235, 238)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
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
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                GestureDetector(
                                                                  // onTap: () {message();},
                                                                  child:
                                                                      ClipOval(
                                                                    child:
                                                                        Container(
                                                                      color: CustomColors
                                                                          .app_color,
                                                                      height:
                                                                          25.0,
                                                                      width:
                                                                          25.0,
                                                                      child: Center(
                                                                          child: Text(
                                                                        '${index + 1}',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 16),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          6.0),
                                                                  child: Row(
                                                                    children: [
                                                                      // Image.asset(
                                                                      //   'assets/images/teeth1.png',
                                                                      //   height:
                                                                      //       18,
                                                                      // ),
                                                                      // Icon(
                                                                      //   Icons
                                                                      //       .person,
                                                                      //   // color: CustomColors
                                                                      //   //     .app_color,
                                                                      //   color: Colors
                                                                      //       .black45,
                                                                      // ),
                                                                      Text(
                                                                          '  payment of Mode: ${data['pay_mode'].toString()}',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 16,
                                                              child: Container(
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {},
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    minimumSize:
                                                                        Size.zero, // Set this
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero, // and this
                                                                  ),
                                                                  child: Text(
                                                                    '${data['date']}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                // 'Credit: ${data['credit'].toString()}',
                                                                "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12)),
                                                            Text(
                                                                'Credit: ${data['credit'].toString()}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                  :
                                  // Image.asset(
                                  //     'assets/images/no_data_found.png',
                                  //   )
                                  Text(
                                      'No Transaction',
                                    ))
                          : Container(
                              height: 0,
                            ),
                      SizedBox(height: 10),
                      medicine_item_list['pay_status'] == 'Pending'
                      
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Payment Mode',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    DropdownButtonFormField(
                                      // Initial Value
                                      value: payDropdownvalue,

                                      // Down Arrow Icon
                                      // icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: pay.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),

                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          payDropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Text('Balance Received (₹)',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      // keyboardType: TextInputType.phone,
                                      // maxLength: 15,
                                      controller: balanceReceivedController,
                                      decoration: new InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: 'Enter Amount',
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.blueAccent,
                                              width: 0.5),
                                          // borderRadius: new BorderRadius.circular(20),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.grey, width: 0.5),
                                          // borderRadius: new BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          if (payDropdownvalue ==
                                              'Payment Type : ') {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Please Select Playment Mode',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else if (balanceReceivedController
                                                      .text ==
                                                  '' ||
                                              balanceReceivedController.text ==
                                                  null) {
                                            Fluttertoast.showToast(
                                                msg: 'Please Enter Amount',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else if (double.parse(
                                                  balanceReceivedController
                                                      .text) >
                                              double.parse(
                                                  medicineLog['balance']
                                                      .toString())) {
                                            Fluttertoast.showToast(
                                                msg: 'Please Check Amount',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else {
                                            var presc_id = storage
                                                .getItem('medicine_list_item');
                                            var data = {
                                              "patient_id":
                                                  selectedPatient['id']
                                                      .toString(),
                                              "pay_mode": payDropdownvalue,
                                              "balance_received":
                                                  balanceReceivedController
                                                      .text,
                                              "presc_id":
                                                  presc_id['id'].toString()
                                            };

                                            var result =
                                                await MedicineMethodApi()
                                                    .medicinePayApi(accessToken,
                                                        context, data);

                                            if (result == 'Success') {
                                              Fluttertoast.showToast(
                                                  msg: 'Payment Success',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: CustomColors
                                                      .success_color,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Medicine()),
                                              );
                                              storage.deleteItem(
                                                  'medicine_list_item');
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: 'Payment Failed',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }

                                            // print(data);
                                          }
                                        },
                                        child: Text('Pay'))
                                  ],
                                ),
                              ),
                            )
                          : Container(height: 0)
                    ],
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/loading_image.png',
                      // height: screenheight * 0.3,
                      // color: Colors.blue.shade100,
                      // color: Colors.black12,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
