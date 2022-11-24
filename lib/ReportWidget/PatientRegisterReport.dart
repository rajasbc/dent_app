import 'package:flutter/material.dart';

class PatientRegisterReport extends StatefulWidget {

  const PatientRegisterReport({ super.key });

  @override
  State<PatientRegisterReport> createState() => _PatientRegisterReportState();
}

class _PatientRegisterReportState extends State<PatientRegisterReport> {
  late DateTime date;
  bool loading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );

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
            title: Text('Patient Report Page'),
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
                    color: Colors.blueAccent,
                    onPressed: () {
                      pickDateRange();
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
                Container(
                    width: screenWidth / 3,
                    child: ElevatedButton(
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
  return Container(
       child: Row(
        children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Bill no: 143'),
                              Text(
                                  'Date: 14-2-2000'),
                              Text(
                                  'Amount: 143'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //         'Patient: ${pending_list[index]['patient_name'].toString()}'),
                          //     Text(
                          //         'Ref By: ${pending_list[index]['ref_by'].toString()}'),
                          //     Text(
                          //       'Status: ${pending_list[index]['status'].toString()}',
                          //       style: TextStyle(
                          //           color: pending_list[index]['status']
                          //                       .toString() ==
                          //                   'Pending'
                          //               ? Colors.red
                          //               : pending_list[index]['status']
                          //                           .toString() ==
                          //                       'Completed'
                          //                   ? Colors.green
                          //                   : Colors.blueAccent),
                          //     ),
                          //   ],
                          // ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Patient: mumthaj'),
                              // Text(
                              //     'Ref By: ${pending_list[index]['ref_by'].toString()}'),
                              // Text(
                              //   'Status: ${pending_list[index]['status'].toString()}',
                              //   style: TextStyle(
                              //       color: pending_list[index]['status']
                              //                   .toString() ==
                              //               'Pending'
                              //           ? Colors.red
                              //           : pending_list[index]['status']
                              //                       .toString() ==
                              //                   'Completed'
                              //               ? Colors.green
                              //               : Colors.blueAccent),
                              // ),
                            ],
                          ),
                             SizedBox(
                            height: 5,
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //     'Patient: ${pending_list[index]['patient_name'].toString()}'),
                              Text(
                                  'Ref By: shajagan'),
                              // Text(
                              //   'Status: ${pending_list[index]['status'].toString()}',
                              //   style: TextStyle(
                              //       color: pending_list[index]['status']
                              //                   .toString() ==
                              //               'Pending'
                              //           ? Colors.red
                              //           : pending_list[index]['status']
                              //                       .toString() ==
                              //                   'Completed'
                              //               ? Colors.green
                              //               : Colors.blueAccent),
                              // ),
                            ],
                          ),
                             SizedBox(
                            height: 5,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(
                              //     'Patient: ${pending_list[index]['patient_name'].toString()}'),
                              // Text(
                              //     'Ref By: ${pending_list[index]['ref_by'].toString()}'),
                              Text(
                                'Status: tajmahal'
                              ),
                            ],
                          ),
                             SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu)))
                ],
       ),
  );
 }
}