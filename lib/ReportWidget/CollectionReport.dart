import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import '../api/Apicall.dart';

class CollectionReport extends StatefulWidget {

  const CollectionReport({ super.key });

  @override
  State<CollectionReport> createState() => _CollectionReportState();
}

class _CollectionReportState extends State<CollectionReport> {

   late DateTime date;
  bool  isLoading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );

  var billingCollectionlist =null;
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
       return Scaffold(
            appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: CustomColors.app_color,
            title: Text('Collection Report'),
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
   getbillingCollectionReportList();
    this.setState(() {});
  }

  renderReportPending(){
  var screenheight= MediaQuery.of(context).size.height;
  var screenWidth= MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.all(10),
       child: Helper().isvalidElement(billingCollectionlist) &&
                 billingCollectionlist.length > 0 ?
                 ListView.builder(
                  itemCount:billingCollectionlist.length,
                  itemBuilder: (BuildContext context, int index){
                     var data =  billingCollectionlist[index];
                     return Container(
                        color:  index%2==0?Color.fromARGB(255, 116, 133, 148):Color.fromARGB(255, 142, 194, 236),

                      child: SingleChildScrollView(
         child: Row(
          children: [
                    Container(
                      width: screenWidth * 0.46,
                      // color: Colors.amber,
                      child:Column(
                        children: [
                         Row(
                                
                          children: [
                            Text(
                                'Reg.No :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(
                                 "${data['preg_no'].toString()}"),
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
                               "${data['p_name'].toString()}"),
                          ],
                            ),
                            Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Mobile :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(
                                "${data['p_phone'].toString()}"),
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
                              
                                'Email :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(
                                "${data['p_email'].toString()}"),
                          ],
                          ),
                           Row(
                            
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              
                            Text(
                              
                                'DOB :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(
                               "${data['p_dob'].toString()}"),
                          ],
                          ),
                           Row(
                            
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              
                            Text(
                              
                                'Reg.Date :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            Text(
                               "${data['preg_date'].toString()}"),
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
                 ): Image.asset(
                        'assets/images/no_data_found.png',
                        // height: screenheight * 0.3,
                        // color: Colors.blue.shade100,
                        // color: Colors.black12,
                      ),
  );
 }

  getbillingCollectionReportList() async{
   var formatter = new DateFormat('yyyy-MM-dd');
var data = {
'from_date':  formatter.format(dateRange.start),
'to_date': formatter.format(dateRange.end),
};
this.setState(() {
   isLoading = true;
});

             billingCollectionlist = await api().billingCollectionReport(accessToken,data);
              if(Helper().isvalidElement( billingCollectionlist) && Helper().isvalidElement( billingCollectionlist['status']) &&  billingCollectionlist['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          billingCollectionlist =  billingCollectionlist['reports'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}