import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:nigdent/DoctorWidget/AddDoctor.dart';


import 'AddDoctor.dart';


class DoctorsList extends StatefulWidget {

  const DoctorsList({ super.key });

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
    bool isLoading  = false;

  var DoctorList =null;
    var accessToken;

@override
  void initState() {
        accessToken = storage.getItem('userResponse')['access_token'];

getDoctorList();
    // TODO: implement initState
    super.initState();
  }


   @override
   Widget build(BuildContext context) {
       var screenWidth= MediaQuery.of(context).size.width;
       return Scaffold(
           appBar: AppBar(title: const Text('Doctors List'),
            backgroundColor: CustomColors.app_color,
             actions: [
          
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddDoctor()),
                  );
                },
                // child: Text("New"),
              )
          ],
            // leading: ElevatedButton(onPressed: (){

            // }, child: const Text('Add Doctor')),
            ),
           body: 
             !isLoading ? Container(
        padding: EdgeInsets.all(10),
         child: Helper().isvalidElement(DoctorList) &&
                  DoctorList.length > 0 ?
                  ListView.builder(
                    itemCount: DoctorList.length ,
                    itemBuilder: (BuildContext context, int index){
                      var data =DoctorList[index];
                      return Container(
                         color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,
                                   child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Text(
                                      'Name :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                        Text(
                                   "${data['name'].toString()}",style: TextStyle(fontSize: 13),),
                   ],
                 ),
                  Row(
                   children: [
                     Text(
                                      'User Level :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                        Text(
                                   "${data['user_type'].toString()}",style: TextStyle(fontSize: 13),),
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
                                      'Email.Id :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                        Text(
                                   "${data['email'].toString()}",style: TextStyle(fontSize: 13),),
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
                                      'Address :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                        Text(
                                   "${data['address'].toString()}",style: TextStyle(fontSize: 13),),
                   ],
                 ),
                  Row(
                   children: [
                     Text(
                                      'Mobile :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                        Text(
                                   "${data['contact_no'].toString()}",style: TextStyle(fontSize: 13),),
                   ],
                 ),
                            
               ],
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
          ),
       );
  }

   getDoctorList() async{
// var data = {
// 'from_date':  formatter.format(dateRange.start),
// 'to_date': formatter.format(dateRange.end),
// // };
this.setState(() {
   isLoading = true;
});

              DoctorList = await api().getdoctorlist(accessToken);
              if(Helper().isvalidElement(DoctorList) && Helper().isvalidElement(DoctorList['status']) && DoctorList['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          DoctorList = DoctorList['doctor_list'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}




    // children: [
    //                   Container(
    //                     width: screenWidth * 0.46,
    //                     // color: Colors.amber,
    //                     child:Column(
    //                       children: [
    //                        Row(
                                  
    //                         children: [
    //                           Text(
    //                               'Name :',
    //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
    //                               ),
    //                           Text(
    //                                "${data['name'].toString()}",style: TextStyle(fontSize: 13),),
    //                         ],
    //                           ),
    //                            Row(
    //                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                               'Mobile.No :',
    //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
    //                               ),
    //                           Text(
    //                           "${data['contact_no'].toString()}",style: TextStyle(fontSize: 13),),
    //                         ],
    //                           ),
    //                           Row(
    //                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                               'Email.Id :',
    //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
    //                               ),
    //                           Text(
    //                            "${data['email'].toString()}",style: TextStyle(fontSize: 13),),
    //                         ],
    //                           ),
    //                       ],
    //                     )
    //                   ),
    //                    Container(
    //                     width: screenWidth *0.46,
    //                     // color: Colors.black,
    //                     // alignment: Alignment.centerRight,
    //                     child: Column(
    //                       // mainAxisAlignment: MainAxisAlignment.end,
    //                       children: [
    //                         Row(
                              
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                           children: [
                                
    //                           Text(
                                
                                  // 'Address :',
    //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize:13 ),
    //                               ),
    //                           Text(
    //                              "${data['address'].toString()}",style: TextStyle(fontSize: 13),
    //                               ),
    //                         ],
    //                         ),
    //                          Row(
                              
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                           children: [
                                
    //                           Text(
                                
    //                               'User Level :',
    //                               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
    //                               ),
    //                           Text(
    //                              "${data['user_type'].toString()}",style: TextStyle(fontSize: 13),),
    //                         ],
    //                         ),
                           
    //                       ],
    //                     ),
    //                   ),
    //                 ],