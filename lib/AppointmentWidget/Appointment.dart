import 'package:flutter/material.dart';
import 'package:nigdent/AppointmentWidget/CreateAppointment.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {

   late DateTime date;
  bool loading  = false;
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
  Widget build(BuildContext context) {

     double screenHeight = MediaQuery.of(context).size.height -
        50;
         var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
         preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text("Appointment List"),
          backgroundColor: CustomColors.app_color,
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
            child:Column(
              children: [
                Container(
  decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.app_color),
                        ),
                  // color: Colors.red,
                  width: screenWidth,
                  height: screenHeight*0.08,
                  child: renderDatePicker(),
                ),
                      
                
                              Container(
  decoration: BoxDecoration(
                          // border: Border.all(color: CustomColors.app_color),
                        ),
                  // color: Colors.red,
                  width: screenWidth*0.95,
                  height: screenHeight*0.08,
                  child: renderDoctorDropdown(),
                ),
                        Container(
  decoration: BoxDecoration(
                          // border: Border.all(color: CustomColors.app_color),
                        ),
                  // color: Colors.red,
                  width: screenWidth,
                  height: screenHeight*0.8,
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
           
      )
    );
  }
  renderDoctorDropdown(){
    return  DropdownButtonFormField(
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
                       style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),

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
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),
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
    // getPendingList();
    this.setState(() {});
  }

  renderReportPending(){
  var screenheight= MediaQuery.of(context).size.height;
  var screenWidth= MediaQuery.of(context).size.width;
  return Container(
    // color: Colors.red,
    // height: screenheight * 0.8,
    child: 
     ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Token: ${index+1}', style: TextStyle(fontSize: 13),),
                      Text('Arunkumar', style: TextStyle(fontSize: 13),),
                      Text('9629643402', style: TextStyle(fontSize: 13),),
                    ],
                  ),
                       Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [            
                      Text('29-Dec-2022', style: TextStyle(fontSize: 13),),
                      Text('05:00 PM to 11:00 PM', style: TextStyle(fontSize: 13),),
                        Text('Status: Pending', style: TextStyle(fontSize: 13),),
                    ],
                  ),
                ],
              ),
            ),);
          },
     )
  );
 }
}
