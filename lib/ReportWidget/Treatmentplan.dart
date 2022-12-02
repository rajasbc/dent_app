import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

import '../api/Apicall.dart';
class Treatmentplan extends StatefulWidget {

  const Treatmentplan({ super.key });

  @override
  State<Treatmentplan> createState() => _TreatmentplanState();
}

class _TreatmentplanState extends State<Treatmentplan> {
  late DateTime date;
  bool isLoading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );
  var treatmentPlanList =null;
    var accessToken;

@override
  void initState() {
        accessToken = storage.getItem('userResponse')['access_token'];

gettreatmentplanList();
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
    gettreatmentplanList();
    this.setState(() {});
  }

  renderReportPending(){
  var screenheight= MediaQuery.of(context).size.height;
  var screenWidth= MediaQuery.of(context).size.width;
  return 
  !isLoading ? Container(
    width: screenWidth,
    padding: EdgeInsets.all(10),
      child: Helper().isvalidElement(treatmentPlanList) &&
                  treatmentPlanList.length > 0 ?
                  ListView.builder(
                    itemCount: treatmentPlanList.length,
                    itemBuilder: (BuildContext context, int index){
                       var data =  treatmentPlanList[index];
                       return Container(
            color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,

                         child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(3.0),
           child: Column(
             children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                          Row(
                            children: [
                              Text(
                                
                                  'Date :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),  Text(
                             "${data['treatment_date'].toString()}",style: TextStyle(fontSize: 13),),

                            ],
                          ),
                          Row(
                             children: [
                             
                           Text(
                             
                               'Patient :',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                               ),
                           Text(
                               'riyaz',style: TextStyle(fontSize: 13),),
                              ],
                          ),

                        ],
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                          Row(
                            children: [
                              Text(
                                
                                  'Doctor :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),  Text(
                              'Riyaz',style: TextStyle(fontSize: 13),),

                            ],
                          ),
                          Row(
                             children: [
                             
                           Text(
                             
                               'Pay Status :',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                               ),
                           Text(
                               "${data['pay_status'].toString()}",style: TextStyle(fontSize: 13),),
                              ],
                          ),

                        ],
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                          Row(
                            children: [
                              Text(
                                
                                  'Fee :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),  Text(
                             "${data['fee'].toString()}",style: TextStyle(fontSize: 13),),

                            ],
                          ),
                          Row(
                             children: [
                             
                           Text(
                             
                               'Paid :',
                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                               ),
                           Text(
                               "${data['payable'].toString()}",style: TextStyle(fontSize: 13),),
                              ],
                          ),

                        ],
               ), Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                          Row(
                            children: [
                              Text(
                                
                                  'Diagnosis :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),  Text(
                             "${data['diagnosis'].toString()}",style: TextStyle(fontSize: 13),),

                            ],
                          ),
                          // Row(
                          //    children: [
                             
                          //  Text(
                             
                          //      'Paid :',
                          //      style: TextStyle(fontWeight: FontWeight.bold),
                          //      ),
                          //  Text(
                          //      "${data['payable'].toString()}",style: TextStyle(fontSize: 13),),
                          //     ],
                          // ),

                        ],
               ),
             ],
           ),
         ),
       ),
                       );
                    },
                  ):  Image.asset(
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
 gettreatmentplanList() async{
   var formatter = new DateFormat('yyyy-MM-dd');
var data = {
'from_date':  formatter.format(dateRange.start),
'to_date': formatter.format(dateRange.end),
};
this.setState(() {
   isLoading = true;
});

             treatmentPlanList = await api().treatmentPlanReport(accessToken,data);
              if(Helper().isvalidElement(treatmentPlanList) && Helper().isvalidElement(treatmentPlanList['status']) && treatmentPlanList['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          treatmentPlanList = treatmentPlanList['reports'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}





