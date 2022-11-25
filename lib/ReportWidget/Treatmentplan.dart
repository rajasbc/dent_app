import 'package:flutter/material.dart';

class Treatmentplan extends StatefulWidget {

  const Treatmentplan({ super.key });

  @override
  State<Treatmentplan> createState() => _TreatmentplanState();
}

class _TreatmentplanState extends State<Treatmentplan> {
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
            title: Text('Treatment Plan Report'),
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
  var screenheight= MediaQuery.of(context).size.height;
  var screenWidth= MediaQuery.of(context).size.width;
  return Container(
    width: screenWidth,
    padding: EdgeInsets.all(10),
       child: SingleChildScrollView(
         child: Column(
           children: [
             Row(
              children: [
                        Container(
                          width: screenWidth * 0.46,
                          // color: Colors.amber,
                          child:Column(
                            children: [
                             Row(
                                    
                              children: [
                                Text(
                                    'Date :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '3-2-2000'),
                              ],
                                ),
                                 Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Patient :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'riyaz'),
                              ],
                                ),
                                Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Doctor :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'Riyaz'),
                              ],
                                ),
                                 Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Diagnosis :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'Abcdefgh'),
                              ],
                                ),
                              
                            ],
                          )
                        ),
                         Container(
                          width: screenWidth *0.46,
                          // color: Colors.black,
                          // alignment: Alignment.centerRight,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              
                             
                               Row(
                                
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                Text(
                                  
                                    'Fee :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '2300'),
                              ],
                              ),
                               Row(
                                
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                Text(
                                  
                                    'Paid :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '2000'),
                              ],
                              ),
                                Row(
                                
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                Text(
                                  
                                    'Pay Status :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'pending'),
                              ],
                              ),

                              Container(
                                color: Colors.amber,

                              )
                            ],
                          ),
                        ),
                      ],
             ),
           ],
         ),
       ),
  );
 }
}