import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/MedicineWidget/MedicinePay.dart';
import 'package:nigdent/MedicineWidget/Methods/MadicineMethodApi.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool bulk_pay = true;
  var selectedPatient;

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
    dobController.text = currentDate.toString().split(' ')[0];
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
        firstDate:DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 10),);
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    dobController.text = pickedDate.toString().split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return new WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
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
            backgroundColor: CustomColors.app_color,
            title: const Text('Patient Medicine List'),
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: Container(
            //  = MediaQuery.of(context).size.width;
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    Container(
                      // height: screenheight * 0.1,
                      // color: Colors.amber,
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        Text(
                                            "Bulk Medicine payment"), // <-- Text
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
                                      InkWell(
                                        splashColor: Colors.white,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                                      .withOpacity(0.3),
                                                  spreadRadius: 3,
                                                  blurRadius: 4,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add,
                                                  color: CustomColors.app_color,
                                                  size: 25,
                                                ), // <-- Icon
                                                Text(" Add Medicine"),
                                              ],
                                            )),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddMedicine()),
                                          );
                                        },
                                      ),
                                      InkWell(
                                        splashColor: Colors.white,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.055,
                                            // width: screenwidth * 0.4,
                                            // height: screenHeight*0.22,
                                            // height: screenHeight * 0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
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
                                                      .withOpacity(0.3),
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
                                                  Icons.picture_as_pdf,
                                                  color: CustomColors.app_color,
                                                  size: 25,
                                                ),
                                                Text(" PDF"),
                                              ],
                                            )),
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           const DoctorsList()),
                                          // );
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
                    // Divider(),
                    bulk_pay
                        ? !isLoading
                            ? Container(
                                // height: MediaQuery.of(context).size.height * 0.70,
                                child: Helper().isvalidElement(medicine_list) &&
                                        medicine_list.length > 0
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        // scrollDirection: Axis.vertical,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.all(5),
                                        itemCount: medicine_list.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var data = medicine_list[index];
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
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
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
                                                                              color: Colors.white,
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
                                                                        Icon(
                                                                          Icons
                                                                              .medical_information,
                                                                          // color: CustomColors
                                                                          //     .app_color,
                                                                          color:
                                                                              Colors.black45,
                                                                        ),
                                                                        Text(
                                                                            ' Medicine : ${data['medicine']}',
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(fontSize: 12)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 16,
                                                                child:
                                                                    Container(
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
                                                              // Image.asset(
                                                              //   'assets/images/treatment_icon.png',
                                                              //   height: 18,
                                                              // ),

                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .description_outlined,
                                                                    // color: CustomColors
                                                                    //     .app_color,
                                                                  ),
                                                                  Text(
                                                                      '  Pattern: ${data['medicine1']}',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      )),
                                                                ],
                                                              ),
                                                              Text(
                                                                  'Quantity: ${data['balance'].toString()}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12)),
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
                                                                  'Total price: ${data['total_price'].toString()}',
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
                                                        // Padding(
                                                        //   padding:
                                                        //       const EdgeInsets.all(4.0),
                                                        //   child: Row(
                                                        //     mainAxisAlignment:
                                                        //         MainAxisAlignment
                                                        //             .spaceBetween,
                                                        //     children: [
                                                        //       Text(
                                                        //           'Quantity: ${data['balance'].toString()}',
                                                        //           style: TextStyle(
                                                        //               fontSize: 12)),
                                                        //       Text(
                                                        //           'Status: ${data['pay_status'].toString()}',
                                                        //           style: TextStyle(
                                                        //               fontSize: 12)),
                                                        //     ],
                                                        //   ),
                                                        // ),
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
                                                                  onPressed:
                                                                      () {
                                                                    storage.setItem(
                                                                        'medicine_list_item',
                                                                        data);
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              MedicinePay()),
                                                                    );
                                                                  },
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                    minimumSize:
                                                                        Size.zero, // Set this
                                                                    padding:
                                                                        EdgeInsets
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
                                                                            FontWeight.bold),
                                                                  )
                                                                  :  Text(
                                                                    'Pay',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: CustomColors
                                                                            .app_color,
                                                                        fontWeight:
                                                                            FontWeight.bold),
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
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Bulk Medicine Payment',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        // selectDate(context);
                                      },
                                      decoration: new InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelText: 'Date',
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
                                    SizedBox(height: 20),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          CustomColors
                                                              .app_color)),
                                              child: Text('Save'),
                                              onPressed: () async {
                                                if (payDropdownvalue ==
                                                    "Payment Type : ") {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Please Select Playment Type',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else if (paidController
                                                            .text ==
                                                        '' ||
                                                    paidController.text ==
                                                        null) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Please Enter Paid Amount',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else if (double.parse(
                                                        "${total()}") <
                                                    double.parse(
                                                        paidController.text)) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          'Please Check Amount',
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  var data = {
                                                    "patient_id":
                                                        selectedPatient['id']
                                                            .toString(),
                                                    "pay_method":
                                                        payDropdownvalue,
                                                    "pay_amt":
                                                        paidController.text
                                                  };

                                                  // print(data);
                                                  var result =
                                                      await MedicineMethodApi()
                                                          .medicineBulkPaymentApi(accessToken,
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
                                                              const Medicine()),
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
                                                  bulk_pay = true;
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
          )),
    );
  }

  total() {
    double total = 0;

    var index = 0;
    for (index; medicine_list.length > index; index++) {
      total = total + double.parse(medicine_list[index]['balance'].toString());
    }
    return total.toString();
  }
}
