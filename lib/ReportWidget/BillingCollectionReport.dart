import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import '../api/Apicall.dart';

class CollectionReport extends StatefulWidget {
  const CollectionReport({super.key});

  @override
  State<CollectionReport> createState() => _CollectionReportState();
}

class _CollectionReportState extends State<CollectionReport> {
  late DateTime date;
  bool isLoading = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );

  var billingCollectionlist = null;
  var accessToken;

  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];

    getbillingCollectionReportList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
       onWillPop: () async {
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
        return true;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: CustomColors.app_color,
            title: Text('Billing Collection Report'),
                leading: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ));
        },
        child: Icon(
          Icons.arrow_back,
          // color: colorAnimated.color,
          color: Colors.white,
        ),
      ),
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
      lastDate: DateTime(2024),
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
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
    getbillingCollectionReportList();
    this.setState(() {});
  }

  renderReportPending() {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return !isLoading
        ? Container(
            padding: EdgeInsets.all(10),
            child: Helper().isvalidElement(billingCollectionlist) &&
                    billingCollectionlist.length > 0
                ? ListView.builder(
                    itemCount: billingCollectionlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = billingCollectionlist[index];
                      return Container(
                        color: index % 2 == 0
                            ? Color.fromARGB(255, 218, 235, 238)
                            : Colors.white,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              Container(
                                  width: screenWidth * 0.46,
                                  // color: Colors.amber,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Reg.No :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              "${data['preg_no'].toString()}",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Patient :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              "${data['p_name'].toString()}",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Date :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              "${data['p_phone'].toString()}",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Treatment :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              "${data['p_phone'].toString()}",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                                          'Doctor :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "${data['p_email'].toString()}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Payment Mode :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "${data['p_dob'].toString()}",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Amount :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                        Text(
                                          "${data['preg_date'].toString()}",
                                          style: TextStyle(fontSize: 13),
                                        ),
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

  getbillingCollectionReportList() async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var data = {
      'from_date': formatter.format(dateRange.start),
      'to_date': formatter.format(dateRange.end),
    };
    this.setState(() {
      isLoading = true;
    });

    billingCollectionlist =
        await api().billingCollectionReport(accessToken, data);
    if (Helper().isvalidElement(billingCollectionlist) &&
        Helper().isvalidElement(billingCollectionlist['status']) &&
        billingCollectionlist['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      billingCollectionlist = billingCollectionlist['reports'];
      //  storage.setItem('diagnosisList', diagnosisList);
      this.setState(() {
        isLoading = false;
      });
    }
  }
}
