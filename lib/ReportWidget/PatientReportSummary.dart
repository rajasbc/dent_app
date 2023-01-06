import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

import '../api/Apicall.dart';

class PatientReportSummary extends StatefulWidget {

  const PatientReportSummary({ super.key });

  @override
  State<PatientReportSummary> createState() => _PatientReportSummaryState();
}

class _PatientReportSummaryState extends State<PatientReportSummary> {

   late DateTime date;
  bool isLoading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );
  var patientSummaryList =null;
    var accessToken;

@override
  void initState() {
        accessToken = storage.getItem('userResponse')['access_token'];

getpatientSummaryReportList();
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
            title: Text('Patient Summary Report'),
          ),
        ),
           body: Container( 
            height: screenHeight,
            width: screenWidth,
           
            child: Column(
              children: [
                  // Container(
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: Colors.blueAccent),
                  //       // borderRadius: BorderRadius.all(Radius.circular(20))
                  //     ),
                  //     height: screenHeight * 0.08,
                  //     //  height: screenHeight * 0.08,
                  //     child: renderDatePicker(),
                  //   ),
                     Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        // borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: screenHeight ,
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
   getpatientSummaryReportList();
    this.setState(() {});
  }
 renderReportPending(){
  var screenheight= MediaQuery.of(context).size.height;
  var screenWidth= MediaQuery.of(context).size.width;
  return 
   !isLoading ? Container(
    padding: EdgeInsets.all(10),
       child: Helper().isvalidElement(patientSummaryList) &&
                  patientSummaryList.length > 0 ?
                  ListView.builder(
                    itemCount: patientSummaryList.length,
                    itemBuilder: (BuildContext context, int index){
                       var data = patientSummaryList[index];
                      return Container(
                color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,

                         child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(3.0),
           child: Row(
            children: [
                      Container(
                        
                        width: screenWidth * 0.50,
                        // color: Colors.amber,
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Reg.No :',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                    ),
                                Text(
                                    "${data['patient_id'].toString()}",style: TextStyle(fontSize: 13),),
                              ],
                                ),
                             Row(
                                    
                              children: [
                                
                                Text(
                                    'Name :',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                    ),
                                Text(
                                    "${data['title'].toString() + "." + data['p_name'].toString().toUpperCase()}",style: TextStyle(fontSize: 13),),
                              ],
                                ),
                                 Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Age :',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                    ),
                                Text(
                                    "${data['p_age'].toString()}",style: TextStyle(fontSize: 13),),
                              ],
                                ),
                                Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Gender :',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                    ),
                                Text(
                                   "${data['gender'].toString().toUpperCase()}",style: TextStyle(fontSize: 13),),
                              ],
                                ),
                            ],
                          ),
                        )
                      ),
                       Container(
                        width: screenWidth *0.42,
                        // color: Colors.black,
                        // alignment: Alignment.centerRight,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
                            Row(
                              
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                              Text(
                                
                                  'Mobile.No :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                   "${data['p_phone'].toString()}",style: TextStyle(fontSize: 13),),
                            ],
                            ),
                             Row(
                              
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                              Text(
                                
                                  'DOB :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                             Text(Helper().isvalidElement(data)
                              ? data["p_dob"].toString()=="0000-00-00"
                              ?"yyyy-mm-dd"
                              : data["p_dob"].toString()=="1970-01-01"
                              ? 'yyyy-mm-dd'
                              : data["p_dob"].toString()
                              :"yyyy-mm-dd"
                              ),
                            ],
                            ),
                             Row(
                              
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                              Text(
                                
                                  'Email :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                    "${data['p_email'].toString()}",style: TextStyle(fontSize: 13),),
                            ],
                            ),
                             Row(
                              
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                              Text(
                                
                                  'Doctor :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                    "${data['doctor_name'].toString()}",style: TextStyle(fontSize: 13),),
                            ],
                            )
                          ],
                        ),
                      ),
                    ],
           ),
         ),
       ),

                      );
                    },
                  ): Image.asset(
                        'assets/images/no_data_found.png',
                        // height: screenheight * 0.3,
                        // color: Colors.blue.shade100,
                        // color: Colors.black12,
                      ),
  ): Align(
            alignment: Alignment.center,
            child: Image.asset(
                  'assets/images/loading_image.png',
                  // height: screenheight * 0.3,
                  // color: Colors.blue.shade100,
                  // color: Colors.black12,
                ),
          );
 }

 getpatientSummaryReportList() async{
// var data = {
// 'from_date':  formatter.format(dateRange.start),
// 'to_date': formatter.format(dateRange.end),
// };
this.setState(() {
   isLoading = true;
});

              patientSummaryList = await api().getpatientSummaryReport(accessToken);
              if(Helper().isvalidElement(patientSummaryList) && Helper().isvalidElement(patientSummaryList['status']) && patientSummaryList['status'] == 'Token is Expired'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          patientSummaryList = patientSummaryList['reports'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}