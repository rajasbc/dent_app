import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/BillingWidget/BillingPay.dart';
import 'package:nigdent/BillingWidget/Methods/BillingMethodApi.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';

import '../Common/utils.dart';

class BillingList extends StatefulWidget {
  const BillingList({Key? key}) : super(key: key);

  @override
  State<BillingList> createState() => _BillingListState();
}

class _BillingListState extends State<BillingList> {
  final entries = ['A', 'B', 'C'];
  final colorCodes = [600, 500, 100];
  bool bulk_pay = true;
  bool isLoading = false;

  var accessToken;
  var billing_list;

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
  var selectedPatient;

  TextEditingController paidController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String payDropdownvalue = 'Payment Type : ';

  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];
        selectedPatient = storage.getItem('selectedPatient');

      DateTime currentDate = DateTime.now();

    method();
    super.initState();
    dobController.text = currentDate.toString().split(' ')[0];;
  }

  method() async {
    var get_billing_list =
        await BillingMethodApi().getBillingListApi(accessToken, context);

    this.setState(() {
      billing_list = get_billing_list;
    });
  }

  DateTime currentDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: CustomColors.app_color, // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: CustomColors.app_color, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: CustomColors.app_color, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2024));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    dobController.text = pickedDate.toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new WillPopScope(
        onWillPop: () async {
          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
          // if (Platform.isAndroid) {
          //   exit(0);
          // } else if (Platform.isIOS) {
          //   exit(0);
          // }
          // exit(0);
          return true;
        },
        child: Scaffold(
      appBar: AppBar(
        title: Text("Billing"),
        backgroundColor: CustomColors.app_color,
        leading: IconButton(onPressed: (){
           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            splashColor: Colors.white,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    // Icon(
                                    //   Icons.local_hospital_outlined,
                                    //   color: CustomColors.app_color,
                                    // ), // <-- Icon
                                    // Image.asset(
                                    //   'assets/images/bulkpay_icon.png',
                                    //   height: 40,
                                    // ),
                                    Icon(
                                      Icons.payment,
                                      color: CustomColors.app_color,
                                      size: 50,
                                    ),
                                    Text("Bulk bill payment"), // <-- Text
                                  ],
                                )),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const DoctorsList()),
                              // );

                              this.setState(() {
                                bulk_pay = !bulk_pay;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // InkWell(
                                  //   splashColor: Colors.white,
                                  //   child: Container(
                                  //       width:
                                  //           MediaQuery.of(context).size.width /
                                  //               2.2,
                                  //       height:
                                  //           MediaQuery.of(context).size.height *
                                  //               0.055,
                                  //       decoration: BoxDecoration(
                                  //         color: Colors.white,
                                  //         borderRadius: BorderRadius.only(
                                  //             topLeft: Radius.circular(10),
                                  //             topRight: Radius.circular(10),
                                  //             bottomLeft: Radius.circular(10),
                                  //             bottomRight: Radius.circular(10)),
                                  //         boxShadow: [
                                  //           BoxShadow(
                                  //             color:
                                  //                 Colors.grey.withOpacity(0.3),
                                  //             spreadRadius: 3,
                                  //             blurRadius: 4,
                                  //             offset: Offset(0,
                                  //                 3), // changes position of shadow
                                  //           ),
                                  //         ],
                                  //       ),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //         children: [
                                  //           Icon(
                                  //             Icons.picture_as_pdf,
                                  //             color: CustomColors.app_color,
                                  //             size: 25,
                                  //           ), // <-- Icon
                                  //           Text("  PDF"),
                                  //         ],
                                  //       )
                                  //       ),
                                  //   onTap: () {
                                  //     // Navigator.push(
                                  //     //   context,
                                  //     //   MaterialPageRoute(
                                  //     //       builder: (context) =>
                                  //     //           const DoctorsList()),
                                  //     // );
                                  //   },
                                  // ),
                                  InkWell(
                                    splashColor: Colors.white,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        // height:
                                        //     MediaQuery.of(context).size.height *
                                        //         0.055,
                                        height: MediaQuery.of(context).size.height * 0.12,
                                        // width: screenwidth * 0.4,
                                        // height: screenHeight*0.22,
                                        // height: screenHeight * 0.1,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 3,
                                              blurRadius: 4,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.screen_share,
                                              color: CustomColors.app_color,
                                            ),
                                            Text(" Check out"),
                                          ],
                                        )),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DashboardScreen()),
                                      );
                                      storage.setItem('selectedPatient', null);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   child: Expanded(child: Divider()),
                // ),
                bulk_pay
                    ? !isLoading
                        ? Container(
                            // height: MediaQuery.of(context).size.height * 0.70,
                            child: Helper().isvalidElement(billing_list) &&
                                    billing_list.length > 0
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    // scrollDirection: Axis.vertical,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(5),
                                    itemCount: billing_list.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data = billing_list[index];
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
                                                bottomLeft: Radius.circular(10),
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
                                                          const EdgeInsets.all(
                                                              5.0),
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
                                                                  child:
                                                                      Container(
                                                                    color: CustomColors
                                                                        .app_color,
                                                                    height:
                                                                        25.0,
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
                                                                        left:
                                                                            6.0),
                                                                child: Row(
                                                                  children: [
                                                                    // Image.asset(
                                                                    //   'assets/images/teeth1.png',
                                                                    //   height:
                                                                    //       18,
                                                                    // ),
                                                                    Icon(
                                                                      Icons
                                                                          .person,
                                                                      // color: CustomColors
                                                                      //     .app_color,
                                                                      color: Colors
                                                                          .black45,
                                                                    ),
                                                                    Text(
                                                                        ' Doctor ${data['doctor_name']}',
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
                                                                onPressed:
                                                                    () {},
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  minimumSize: Size
                                                                      .zero, // Set this
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
                                                          const EdgeInsets.all(
                                                              4.0),
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
                                                              '  Description: ${data['Description']}',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Fees: ${data['fee'].toString()}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Text(
                                                              'Discount: ${data['discount'].toString()}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Paid: ${data['payable'].toString()}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Text(
                                                              'Balance: ${data['balance'].toString()}',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 22,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                'Status: ${data['pay_status'].toString()}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12)),
                                                            TextButton(
                                                              onPressed: () {
                                                                storage.setItem('billing_list_item', data);
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              BillingPay()),
                                                                );
                                                              },
                                                              style: TextButton
                                                                  .styleFrom(
                                                                minimumSize: Size
                                                                    .zero, // Set this
                                                                padding: EdgeInsets
                                                                    .zero, // and this
                                                              ),
                                                              child: 
                                                              data['pay_status'] == 'Paid'
                                                              ?
                                                              Text(
                                                                'Paid',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: CustomColors
                                                                        .success_color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                              : 
                                                               Text(
                                                                'Pay',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: CustomColors
                                                                        .app_color,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )
                                                            ),
                                                          ],
                                                        ),
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
                                : Image.asset(
                                    'assets/images/no_data_found.png',
                                  ))
                        : Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/loading_image.png',
                            ),
                          )
                    :
                    //  SizedBox(
                    //     height: 10,
                    //   ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Bulk Bill Payment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: CustomColors.app_color),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //  height: MediaQuery.of(context).size.height * 0.35,
                                  width: MediaQuery.of(context).size.width,
                                  //  color: Colors.red,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Bill Amount : ${total()}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  // obscure/Text: true,
                                  keyboardType: TextInputType.none,
                                  // maxLength: 3,
                                  controller: dobController,
                                  onTap: () {
                                    selectDate(context);
                                  },
                                  decoration: new InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Date',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blueAccent, width: 0.5),
                                      // borderRadius: new BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 0.5),
                                      // borderRadius: new BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: DropdownButtonFormField(
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
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  // keyboardType: TextInputType.phone,
                                  // maxLength: 15,
                                  controller: paidController,
                                  decoration: new InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Paid Amount',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blueAccent, width: 0.5),
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
                                TextFormField(
                                  // keyboardType: TextInputType.phone,
                                  // maxLength: 15,
                                  enabled: false,
                                  
                                  controller: paidController,
                                  decoration: new InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'Total Paid Amount',
                                    contentPadding: const EdgeInsets.only(
                                        left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blueAccent, width: 0.5),
                                      // borderRadius: new BorderRadius.circular(20),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.grey, width: 0.5),
                                      // borderRadius: new BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      CustomColors.app_color)),
                                          child: Text('Save'),
                                          onPressed: () async {
                                            if (payDropdownvalue ==
                                                "Payment Type : ") {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please Select Playment Type',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else if (paidController.text ==
                                                    '' ||
                                                paidController.text == null) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'Please Enter Paid Amount',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }else if (double.parse("${total()}") < double.parse(paidController.text)){
Fluttertoast.showToast(
                                                  msg:
                                                      'Please Check Amount',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                            else {
                                              var data = {
                                                "patient_id":
                                                    selectedPatient['id']
                                                        .toString(),
                                                "pay_method": payDropdownvalue,
                                                "balance_received":
                                                    paidController.text
                                              };
                                              var result =
                                                  await BillingMethodApi()
                                                      .bulkBillPay(accessToken,
                                                          context, data);
                                                          
                                              if (result == "Success") {
                                                Fluttertoast.showToast(
                                                    msg: 'Paid Successfully',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        CustomColors
                                                            .success_color,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const BillingList()),
                                                );
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg: 'Faild',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.red)),
                                          child: Text('Cancel'),
                                          onPressed: () {
                                            this.setState(() {
                                              bulk_pay= true;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  total() {
    double total = 0;

    var index = 0;
    for (index; billing_list.length > index; index++) {
      total = total + double.parse(billing_list[index]['balance'].toString());
    }
    return total.toString();
  }
}
