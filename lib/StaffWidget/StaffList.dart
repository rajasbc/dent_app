import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import '../Common/utils.dart';
import '../api/Apicall.dart';
import 'AddStaff.dart';

class StaffList extends StatefulWidget {

  const StaffList({ super.key });

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
   bool isLoading  = false;

  var StaffList =null;
    var accesstoken;

@override
  void initState() {
        accesstoken = storage.getItem('userResponse')['access_token'];

getStafflist();
    // TODO: implement initState
    super.initState();
  }


   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Staff List'),
            backgroundColor: CustomColors.app_color,
             actions: [
          
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddStaff()),
                  );
                },
                // child: Text("New"),
              )
          ],),
           body:
           !isLoading ? Container(
            padding: EdgeInsets.all(10),
         child: Helper().isvalidElement(StaffList) &&
                  StaffList.length > 0 ?
                  ListView.builder(
                    itemCount: StaffList.length,
                    itemBuilder: (BuildContext context, int index){
                       var data =StaffList[index];
                       return Container(
                        color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,
                        
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
                                      Text( "${data['name'].toString()}",style: TextStyle(fontSize: 13),)
                      ],
                    ),
                     Row(
                      children: [
                         Text(
                                      'Mobile.No :',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                     Text( "${data['contact_no'].toString()}",style: TextStyle(fontSize: 13),)
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
                                      'UserLevel:',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                     Text( "${data['user_type'].toString()}",style: TextStyle(fontSize: 13),)
                      ],
                    ),
                     Row(
                      children: [
                         Text(
                                      'Email:',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                     Text( "${data['email'].toString()}",style: TextStyle(fontSize: 13),)
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
                                      'UserName:',
                                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                                      ),
                                       Text( "${data['username'].toString()}",style: TextStyle(fontSize: 13),)
                      ],
                    ),                   
                  ],
                )
              ],
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
       )
       );
  }
   getStafflist() async{
// var data = {
// 'from_date':  formatter.format(dateRange.start),
// 'to_date': formatter.format(dateRange.end),
// // };
this.setState(() {
   isLoading = true;
});

              StaffList = await api().getstafflist(accesstoken);
              if(Helper().isvalidElement(StaffList) && Helper().isvalidElement(StaffList['status']) && StaffList['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          StaffList = StaffList['reports'];
  //  storage.setItem('diagnosisList', diagnosisList);
                         this.setState(() {
   isLoading = false;
});

 }
 }
}







