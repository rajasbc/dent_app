import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
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

treatmentdiagnosisplanList();
    // TODO: implement initState
    super.initState();
  }
   var diagnosisList =null;



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
                    Container(
                      height: screenHeight * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Treatment',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                          Text('Count',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                    ),


SizedBox(height: 10,),
                     !isLoading ? Container(
                        height: screenHeight * 0.34,
                         child: Helper().isvalidElement(treatmentList) &&
                  treatmentList.length > 0 ?
                  ListView.builder(
                    itemCount:treatmentList.length ,
                    itemBuilder: (BuildContext context, int index){
                       var data = treatmentList[index];
                       return Container(
                color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,
                          child:SingleChildScrollView(
                          child: Column(
                             children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  
                                 children: [
                                   Row(
                                  
                                    children: [
                                      Column(
                                        children: [
                                          // Text(
                                          //     'Treatment :',
                                          //     style: TextStyle(fontWeight: FontWeight.bold),
                                          //     ),
                                              Text( "${data["treatment_name"].toString()}",style: TextStyle(fontSize: 13),)
                                        ],
                                      ),
                                    //   Text(
                                    //       "${data["treatment_name"].toString()}"),
                                    ],
                            ),
                             Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //     'Count :',
                                      //     style: TextStyle(fontWeight: FontWeight.bold),
                                      //     ),
                                      Text(
                                          "${data["count"].toString()}",style: TextStyle(fontSize: 13),),
                                    ],
                            ),
                                 ],
                             ),
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
                  height: screenHeight * 0.34,
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
                      height: screenHeight * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Diagnosis',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          Text('Count',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  !isLoading ? Container(
                    height: screenHeight * 0.33,
                     child: Helper().isvalidElement(diagnosisList) &&
                  diagnosisList.length > 0 ?
                  ListView.builder(
                    itemCount: diagnosisList.length,
                    itemBuilder: (BuildContext context, int index){
                       var data = diagnosisList[index];
                      return Container(
                color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,

                         child: SingleChildScrollView(
                      child: Column(
                        children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Row(
                                    
                                      children: [
                                        // Text(
                                        //     'Diagnosis :',
                                        //     style: TextStyle(fontWeight: FontWeight.bold),
                                        //     ),
                                        Text(
                                            "${data["diagnosis_name"].toString()}",style: TextStyle(fontSize: 13),),
                                      ],
                                ),
                                 Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //     'Count :',
                                        //     style: TextStyle(fontWeight: FontWeight.bold),
                                        //     ),
                                        Text(
                                           "${data["count"].toString()}",style: TextStyle(fontSize: 13),),
                                      ],
                                ),
                                   ],
                                 ),
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
                  height: screenHeight * 0.33,
                  // color: Colors.blue.shade100,
                  // color: Colors.black12,
                ),
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
    treatmentdiagnosisplanList();
    this.setState(() {});
  }
treatmentdiagnosisplanList() async{
   var formatter = new DateFormat('yyyy-MM-dd');
var data = {
'from_date':  formatter.format(dateRange.start),
'to_date': formatter.format(dateRange.end),
'doctor':'All'
};
this.setState(() {
   isLoading = true;
});

             var  treatment_diagnosis_list = await api().treatmentDiagnosisplan(accessToken,data);
              if(Helper().isvalidElement( treatment_diagnosis_list) && Helper().isvalidElement( treatment_diagnosis_list['status']) &&  treatment_diagnosis_list['status'] == 'Token is Expired'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
                                    treatmentList = treatment_diagnosis_list['top_treatment_report'];
          diagnosisList = treatment_diagnosis_list['top_diagnosis_report'];

   isLoading = false;
});

 }
//  diagnosisList = await api(). diagnosisplan(accessToken,data);
//               if(Helper().isvalidElement(diagnosisList) && Helper().isvalidElement(diagnosisList['status']) && diagnosisList['status'] == 'Token is Invalid'){
//                Helper().appLogoutCall(context, 'Session expeired');
//                }
//          else{
//   //  storage.setItem('diagnosisList', diagnosisList);
//                          this.setState(() {
//    isLoading = false;
// });

//  }
 }
}





