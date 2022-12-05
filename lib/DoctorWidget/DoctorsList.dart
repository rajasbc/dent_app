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

var doctorlist =null;
    var accessToken;

    @override
  void initState() {
        accessToken = storage.getItem('userResponse')['access_token'];

 getdoctortList();
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
           ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddDoctor(),));

           }, child: const Text('Add Doctor'))
            // IconButton(onPressed: getAllCustomers, icon: Icon(Icons.category))
          ],
            // leading: ElevatedButton(onPressed: (){

            // }, child: const Text('Add Doctor')),
            ),
           body: Container(
        

             child: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
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
                                  'Name :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                   'Riyaz'),
                            ],
                              ),
                               Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Mobile.No :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                '5645643456'),
                            ],
                              ),
                              Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Email.Id :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                'rs@gmail.com'),
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
                                
                                  'Address :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize:13 ),
                                  ),
                              Text(
                                  '23,sdjiid',
                                  ),
                            ],
                            ),
                             Row(
                              
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                              Text(
                                
                                  'User Level :',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                  ),
                              Text(
                                 'Doctor'),
                            ],
                            ),
                            //  Row(

                            // mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                                
                            //   Text(
                                
                            //       'Reg.Date :',
                            //       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                            //       ),
                            //   Text(
                            //     'hi'),
                            // ],
                            // )
                          ],
                        ),
                      ),
                    ],
           ),
         ),
       ),
           ),
       );
  }
   getdoctortList() async{
  //  var formatter = new DateFormat('yyyy-MM-dd');
var data = {
// 'from_date':  formatter.format(dateRange.start),
// 'to_date': formatter.format(dateRange.end),
// "referral_name":nameController.text,
"mobile_number":"98765432398",
"email_id":"pooja@gmail.com",
"rtype":"Doctor",
"password":"123456",
"designation":"heart",
"page_type":"doctor",
"usertype":"Doctor",
"address":"my heart",
};
this.setState(() {
  //  isLoading = true;
});

             doctorlist = await api().addDoctor(accessToken,data);
              if(Helper().isvalidElement( doctorlist) && Helper().isvalidElement( doctorlist['status']) &&  doctorlist['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          doctorlist =  doctorlist['reports'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
  //  isLoading = false;
});

 }
 }
}