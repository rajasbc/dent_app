import 'package:flutter/material.dart';
import 'package:nigdent/AppointmentWidget/CreateAppointment.dart';

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
String docDropdownvalue = 'Select Doctor : ';

  var doc = [
    'Select Doctor : ',
    'Mohan',
    'Riyaz',
  ];
  Widget build(BuildContext context) {

     double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
         var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment List"),
        actions: [
ElevatedButton(onPressed: (){
      Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CreateAppointment()),
              );
}, child: Text('New Appointment'))
          // IconButton(
          //   icon: Icon(Icons.add),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const CreateAppointment()),
          //     );
          //   },
          //   // child: Text("New"),
          // )
        ],

        //backgroundColor: Colors.redAccent,
      ),
      body: Container(
         height: screenHeight,
            width: screenWidth,
           
            child:SingleChildScrollView(
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
           
      )
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
    padding: EdgeInsets.all(10),
       child: SingleChildScrollView(
         child: Column(
          
           children: [
             SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: docDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: doc.map((String items) {
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
                        ),
                      ),
                      Divider(),

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
                                    'Token Number :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '1'),
                              ],
                                ),
                                 Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Date :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '22-3-2022'),
                              ],
                                ),
                                Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Time :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '11:45'),
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
                                  
                                    'Patient Nmae :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'riyaz'),
                              ],
                              ),
                               Row(
                                
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                Text(
                                  
                                    'Mobile No :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    '33532004506'),
                              ],
                              ),
                               Row(
                                
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                Text(
                                  
                                    'Status :',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                Text(
                                    'Not come'),
                              ],
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
