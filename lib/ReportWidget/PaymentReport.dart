import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import '../Common/utils.dart';
import '../api/Apicall.dart';

class PaymentReport extends StatefulWidget {
  const PaymentReport({super.key});

  @override
  State<PaymentReport> createState() => _PaymentReportState();
}

class _PaymentReportState extends State<PaymentReport> {
  late DateTime date;
  bool isLoading = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );
  var paymentRegisterList = null;
  var accessToken;

  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];

    getpaymentRegisterList();
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
          backgroundColor: CustomColors.app_color,
          title: Text('Payment Report'),
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: screenHeight * 0.08,
              //  height: screenHeight * 0.08,
              child: renderDatePicker(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              height: screenHeight * 0.92,
              child: renderReportPending(),
            ),
          ],
        ),
      ),
    );
  }

  renderDatePicker() {
    final start = dateRange.start;
    final end = dateRange.end;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: ,

      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: screenWidth / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.app_color)),
                      onPressed: () {
                        pickDateRange();
                      },
                      child: Text(
                        '${start.year}/${start.month}/${start.day}',
                      ),
                    )),
                Container(
                  width: screenWidth / 6,
                  child: IconButton(
                    color: CustomColors.app_color,
                    onPressed: () {
                      pickDateRange();
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
                Container(
                    width: screenWidth / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              CustomColors.app_color)),
                      onPressed: () {
                        pickDateRange();
                      },
                      child: Text('${end.year}/${end.month}/${end.day}'),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
    getpaymentRegisterList();
    this.setState(() {});
  }

  renderReportPending() {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return !isLoading
        ? Container(
            padding: EdgeInsets.all(10),
            child: Helper().isvalidElement(paymentRegisterList) &&
                    paymentRegisterList.length > 0
                ? ListView.builder(
                    itemCount: paymentRegisterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = paymentRegisterList[index];
                      return Container(
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              Container(
                                  width: screenWidth * 0.46,
                                  // color: Colors.amber,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Date :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('2-3-2000'),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Patient Id :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('ri398'),
                                        ],
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Patient Name :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('riyaz'),
                                        ],
                                      ),
                                      //     Row(
                                      // // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // children: [
                                      //   Text(
                                      //       ' :',
                                      //       style: TextStyle(fontWeight: FontWeight.bold),
                                      //       ),
                                      //   Text(
                                      //       'Abcdefghijklmnop'),
                                      // ],
                                      //   ),
                                    ],
                                  )),
                              Container(
                                width: screenWidth * 0.46,
                                // color: Colors.black,
                                // alignment: Alignment.centerRight,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Bill Amount :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('2500'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Paid :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('2000'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Balance :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('500'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Image.asset(
                    'assets/images/no_data_found.png',
                    // height: screenheight * 0.3,
                    // color: Colors.blue.shade100,
                    // color: Colors.black12,
                  ),
          )
        : Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/loading_image.png',
              // height: screenheight * 0.3,
              // color: Colors.blue.shade100,
              // color: Colors.black12,
            ),
          );
  }

  getpaymentRegisterList() async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var data = {
      'from_date': formatter.format(dateRange.start),
      'to_date': formatter.format(dateRange.end),
    };
    this.setState(() {
      isLoading = true;
    });

    paymentRegisterList = await api().paymentReport(accessToken, data);
    if (Helper().isvalidElement(paymentRegisterList) &&
        Helper().isvalidElement(paymentRegisterList['status']) &&
        paymentRegisterList['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      paymentRegisterList = paymentRegisterList['patient_name'];
      //  storage.setItem('diagnosisList', diagnosisList);
      this.setState(() {
        isLoading = false;
      });
    }
  }
}
