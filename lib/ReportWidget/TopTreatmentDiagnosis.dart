import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';

import '../api/Apicall.dart';

class TopTreatmentDiagnosis extends StatefulWidget {

  const TopTreatmentDiagnosis({ super.key });

  @override
  State<TopTreatmentDiagnosis> createState() => _TopTreatmentDiagnosisState();
}

class _TopTreatmentDiagnosisState extends State<TopTreatmentDiagnosis> {


 late DateTime date;
  bool isLoading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );

  var treatmentList =null;
    var accessToken;
    @override
  void initState() {
        accessToken = storage.getItem('userResponse')['access_token'];

treatmentplanList();
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
            title: Text('Top Treatment & Diagnosis'),
          ),
        ),
           body: Container( 
            padding: EdgeInsets.all(8.0),
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
                      child:Column(
                        children: [
                           renderDatePicker(),
                      ],
                      )
                      //  renderDatePicker(),

                    ),
                    Container(
                      height: screenHeight * 0.04,
                      // color: Colors.black,
                      child: Text('Treatment',
                       style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)
                       ),

                    ),
                    Divider(),



                     !isLoading ? Container(
                        height: screenHeight * 0.37,
                         child: Helper().isvalidElement(treatmentList) &&
                  treatmentList.length > 0 ?
                  ListView.builder(
                    itemCount:treatmentList.length ,
                    itemBuilder: (BuildContext context, int index){
                       var data = treatmentList[index];
                       return Container(
                         color:  index%2==0?Color.fromARGB(255, 167, 193, 216):Color.fromARGB(255, 246, 247, 248),
                          child:SingleChildScrollView(
                          child: Column(
                             children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                
                                  children: [
                                    Text(
                                        'Treatment :',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                    Text(
                                        'Abcdef'),
                                  ],
                            ),
                             Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Count :',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                    Text(
                                        '2'),
                                  ],
                            ),
                               ],
                             ),                                                    
                             ],
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
          ),
                   Container(
                    height: screenHeight * 0.04,
                    // color: Colors.amber,
                     child: Text('Diagnosis',
                       style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)
                       ),
                   ),
                   Divider(),
                   Container(
                    height: screenHeight * 0.38,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                           Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Row(
                                  
                                    children: [
                                      Text(
                                          'Diagnosis :',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                      Text(
                                          'Abcdef'),
                                    ],
                              ),
                               Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Count :',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                      Text(
                                          '2'),
                                    ],
                              ),
                                 ],
                               ),
                                 Row(
                              children: [
                                Padding(padding: EdgeInsets.all(30),
                                child: Text('Adfdfd'),
                                )
                              ],
                             ),
                              Row(
                              children: [
                                Padding(padding: EdgeInsets.all(30),
                                child: Text('Adfdfd'),
                                )
                              ],
                             ),
                              Row(
                              children: [
                                Padding(padding: EdgeInsets.all(30),
                                child: Text('Adfdfd'),
                                )
                              ],
                             ),
                              Row(
                              children: [
                                Padding(padding: EdgeInsets.all(30),
                                child: Text('Ad'),
                                )
                              ],
                             ),
                        ],
                      ),
                    ),

                   )
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
    treatmentplanList();
    this.setState(() {});
  }

//    renderReportPending(){
//       var screenheight = MediaQuery.of(context).size.height;
//         var screenWidth = MediaQuery.of(context).size.width;
//   return Container(
//     height: screenheight,
//     width: screenWidth,
//     child: SingleChildScrollView(
//       child: Column(
//         children: [
//            Container(
//             height: screenheight * 0.5,
//             width: screenWidth,
//             color: Colors.red,
//             child: Text('Treatment',
//                         textAlign: TextAlign.left,),
    
    
    
//                       ),
//                     Container(
//                       height: screenheight * 0.5,
//                       width: screenWidth,
//                       color: Colors.black,
//                       child: Text('hi'),
    
    
//                    )
//         ],
//       ),
//     ),

//   );
 
//  }

treatmentplanList() async{
   var formatter = new DateFormat('yyyy-MM-dd');
var data = {
'from_date':  formatter.format(dateRange.start),
'to_date': formatter.format(dateRange.end),
'doctor':'All'
};
this.setState(() {
   isLoading = true;
});

              treatmentList = await api(). treatmentplan(accessToken,data);
              if(Helper().isvalidElement(treatmentList) && Helper().isvalidElement(treatmentList['status']) && treatmentList['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          treatmentList = treatmentList['top_treatment_report'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}