import 'package:flutter/material.dart';

class PatientReportSummary extends StatefulWidget {

  const PatientReportSummary({ super.key });

  @override
  State<PatientReportSummary> createState() => _PatientReportSummaryState();
}

class _PatientReportSummaryState extends State<PatientReportSummary> {

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
            title: Text('Patient Summary Report'),
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
                    width: MediaQuery.of(context).size.width *0.8,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Column(
                        children: [
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                              
                                children: [
                                  Text(
                                      'Name :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      'rskdjksd'),
                                ],
                          ),
                           Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Age :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      '35'),
                                ],
                          ),
                             ],
                           ),
                          // Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                              
                                children: [
                                  Text(
                                      'Gender :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      'Male'),
                                ],
                          ),
                           Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Mobile.No :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      '5666756678'),
                                ],
                          ),
                             ],
                           ),
                          // Divider(),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Row(
                              
                                children: [
                                  Text(
                                      'DOB :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      '27-7-1988'),
                                ],
                          ),
                           Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Email :',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                      'rs@gmail.com'),
                                ],
                          ),
                             ],
                           ),
                        ],
                      ),
                    ),
                  ),
                ],
       ),
  );
 }

}