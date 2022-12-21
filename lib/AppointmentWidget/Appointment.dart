import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:intl/intl.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/AppointmentWidget/CreateAppointment.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/api/Apicall.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final LocalStorage storage = new LocalStorage('nigdent_store');

  late DateTime date;
  bool loading = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );
  @override
  String docDropdownvalue = 'All';

  var doctorDropdownList = [
    'All',
  ];
  var appointment_list = null;
  var accessToken = '';
  @override
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];
    get_appointment_list();

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 50;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text("Appointment List"),
            backgroundColor: CustomColors.app_color,
            leading: IconButton(onPressed: (){
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                  );
            }, icon: Icon(Icons.arrow_back)),
            actions: [
            
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAppointment()),
                  );
                },
                // child: Text("New"),
              )
            ],

            //backgroundColor: Colors.redAccent,
          ),
        ),
        body: Container(
            height: screenHeight,
            width: screenWidth,
            //  color: Colors.yellow,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.app_color),
                  ),
                  // color: Colors.red,
                  width: screenWidth,
                  height: screenHeight * 0.08,
                  child: renderDatePicker(),
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: CustomColors.app_color),
                      ),
                  // color: Colors.red,
                  width: screenWidth * 0.95,
                  // height: screenHeight * 0.08,
                  // child: renderDoctorDropdown(),
                ),
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: CustomColors.app_color),
                      ),
                  // color: Colors.red,
                  width: screenWidth,
                  height: screenHeight * 0.8,
                  child: renderReportPending(),
                ),
              ],
            )

            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //         Container(
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.blueAccent),
            //             ),
            //             height: screenHeight * 0.08,
            //             child: renderDatePicker(),
            //           ),
            //              Container(
            //             decoration: BoxDecoration(
            //               border: Border.all(color: Colors.blueAccent),
            //             ),
            //             height: screenHeight * 0.92,
            //             child: renderReportPending(),
            //           ),
            //     ],
            //   ),
            // ),

            ));
  }

  renderDoctorDropdown() {
    return DropdownButtonFormField(
      // Initial Value
      value: docDropdownvalue,

      // Down Arrow Icon
      // icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: doctorDropdownList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),

      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          docDropdownvalue = newValue!;
        });
      },
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
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );

    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
    get_appointment_list();

    // getPendingList();
    this.setState(() {});
  }

  renderReportPending() {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return !loading
        ? Container(
            // color: Colors.red,
            // height: screenheight * 0.8,
            child: Helper().isvalidElement(appointment_list) &&
                    appointment_list.length > 0
                ? ListView.builder(
                    padding: EdgeInsets.all(5.0),
                    itemCount: appointment_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: index % 2 == 0
                            ? Color.fromARGB(255, 218, 235, 238)
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    // 'Token: ${index + 1}',
                                    'Token: ${appointment_list[index]['acknowledge_no']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '${appointment_list[index]['name']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '${appointment_list[index]['mobile_no']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${appointment_list[index]['appointment_date']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    '${appointment_list[index]['appointment_time']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    'Status: ${appointment_list[index]['status']}',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
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

  get_appointment_list() async {
    var formatter = new DateFormat('yyyy-MM-dd');
    var data = {
      'from_date': formatter.format(dateRange.start),
      'to_date': formatter.format(dateRange.end),
      'doctor_id': ''
    };

    this.setState(() {
      
      loading = true;
    });
//  var result =  await api().billingCollectionReport(accessToken, da);

    var result = await api().getAppointmentList(accessToken, data);
    
    if (Helper().isvalidElement(result) &&
        Helper().isvalidElement(result['status']) &&
        result['status'] == 'Session expeired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      this.setState(() {
        appointment_list = result['appointment_list'];
      });
    }
    this.setState(() {
      loading = false;
    });
  }
}
