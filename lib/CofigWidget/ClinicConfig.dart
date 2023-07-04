import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

import '../Common/utils.dart';
import '../DashboardWidget/DasboardScreen.dart';
import '../api/Apicall.dart';
class ClinicConfig extends StatefulWidget {

  const ClinicConfig({ super.key });

  @override
  State<ClinicConfig> createState() => _ClinicConfigState();
}

class _ClinicConfigState extends State<ClinicConfig> {
   bool isLoading  = false;
   var clinicconfig=null;
  var accessToken = '';
  void initState() {
   
    super.initState();
 init();
  }
  init()async{
     accessToken =await storage.getItem('userResponse')['access_token'];
  await getclinicconfig();

  }
  
  TextEditingController  calltokenController = TextEditingController();
  TextEditingController  visittokenController = TextEditingController();
bool loading = false;
// int? _DiagSelected = 1;
  // String _DiagVal = "";
  
// int? _apptimeSelected = 1;
  // String _apptimeVal = "";
String? _DiagVal ;
String? _appitvalue;

   @override
   Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
       return Scaffold(
           appBar: AppBar(title: const Text('Clinic Configuration'),
             leading: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DashboardScreen(),
              ));
        },
        child: Icon(
          Icons.arrow_back,
          // color: colorAnimated.color,
          color: Colors.white,
        ),
      ),
           backgroundColor: CustomColors.app_color,),
           body:
           isLoading==true? Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                           //                 onChanged: (s) {
                           // int s = int.parse(
                           //  calltokenController.text);
                           //   },
                    keyboardType: TextInputType.number,
                    controller: calltokenController,
                    decoration: new InputDecoration(
                      filled: true,
                      labelText: 'Call Token',
                        contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colors.blueAccent, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                  ),
                    ),
                  ),
                ),
                  SizedBox(height: screenHeight*0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                    keyboardType: TextInputType.number,
                    controller: visittokenController ,
                    
                    decoration: new InputDecoration(
                      filled: true,
                      labelText: 'visit Token',
                      
                      // hintText:,
                        contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colors.blueAccent, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                  ),
                    ),
                    
                  ),
                ),
                SizedBox(height: 10,),
                Text('Do You Want Diagnosis ? ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),),
                SizedBox(height: 10,),
                Container(
                  width: screenWidth*0.9,
                height: screenHeight*0.05,
                  child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 Container( 
            padding: EdgeInsets.all(0),
            child: 
          Row(
            children: [
                
                // Text("What is your gender?", style: TextStyle( 
                //     fontSize: 18
                // ),),

                // Divider(),
                
                Container(
                   width: screenWidth*0.4,
                height: screenHeight*0.05,
                  child: RadioListTile(
                      title: Text("Yes"),
                      value: "yes", 
                      groupValue: _DiagVal, 
                      onChanged: (value){
                        setState(() {
                            _DiagVal = value.toString();
                        });
                      },
                  ),
                ),

                Container(
                   width: screenWidth*0.4,
                height: screenHeight*0.05,
                  child: RadioListTile(
                      title: Text("No"),
                      value: "no", 
                      groupValue: _DiagVal, 
                      onChanged: (value){
                        setState(() {
                            _DiagVal = value.toString();
                        });
                      },
                  ),
                ),

                
            ],
          ),
        ),
                  //  RadioListTile(
                  //           title: Text("Yes"),
                  //           value: "yes", 
                  //           groupValue: _DiagVal, 
                  //           onChanged: (value){
                  //             setState(() {
                  //   _DiagVal = value.toString();
                  //             });
                  //           },
                  //     ),
                  //      RadioListTile(
                  //           title: Text("NO"),
                  //           value: "no", 
                  //           groupValue: _DiagVal, 
                  //           onChanged: (value){
                  //             setState(() {
                  //   _DiagVal = value.toString();
                  //             });
                  //           },
                  //     )
                  // RadioButton(
                  //   description: "Yes",
                  //   value: "yes",
                  //   groupValue: _DiagVal,
                  //   onChanged: (value) => setState(
                  //     () => _DiagVal = value,
                  //   ),
                  //   // activeColor: Colors.red,
                  //   textStyle: TextStyle(
                  //       // fontSize: 30,
                  //       // fontWeight: FontWeight.w600,
                  //       // color: Colors.red
                  //       ),
                  // ),
                  // RadioButton(
                  //   description: "No",
                  //   value: "no",
                           
                  //   groupValue: _DiagVal,
                  //   onChanged: (value) => setState(
                  //     () => _DiagVal = value,
                  //   ),
                  //   // textPosition: RadioButtonTextPosition.left,
                  // ),
                  // //  RadioButton(
                  // //   description: "Other",
                  // //   value: "Other",
                           
                  // //   groupValue: _singleValue,
                  // //   onChanged: (value) => setState(
                  // //     () => _singleValue = value,
                  // //   ),
                  // //   // textPosition: RadioButtonTextPosition.left,
                  // // ),
                              ],
                            ),
                ),
                  SizedBox(height: 10,),
                Text('Do You Want Appointment Time ? ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),),
                SizedBox(height: 10,),
                     Container(
                  width: screenWidth*0.9,
                height: screenHeight*0.05,
                  child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 Container( 
            padding: EdgeInsets.all(0),
            child: 
          Row(
            children: [
                
                // Text("What is your gender?", style: TextStyle( 
                //     fontSize: 18
                // ),),

                // Divider(),
                
                Container(
                   width: screenWidth*0.4,
                height: screenHeight*0.05,
                  child: RadioListTile(
                      title: Text("Yes"),
                      value: "yes", 
                      groupValue: _appitvalue, 
                      onChanged: (value){
                        setState(() {
                            _appitvalue = value.toString();
                        });
                      },
                  ),
                ),

                Container(
                   width: screenWidth*0.4,
                height: screenHeight*0.05,
                  child: RadioListTile(
                      title: Text("No"),
                      value: "no", 
                      groupValue: _appitvalue, 
                      onChanged: (value){
                        setState(() {
                            _appitvalue = value.toString();
                        });
                      },
                  ),
                ),

                
            ],
          ),
        ),
                  //  RadioListTile(
                  //           title: Text("Yes"),
                  //           value: "yes", 
                  //           groupValue: _DiagVal, 
                  //           onChanged: (value){
                  //             setState(() {
                  //   _DiagVal = value.toString();
                  //             });
                  //           },
                  //     ),
                  //      RadioListTile(
                  //           title: Text("NO"),
                  //           value: "no", 
                  //           groupValue: _DiagVal, 
                  //           onChanged: (value){
                  //             setState(() {
                  //   _DiagVal = value.toString();
                  //             });
                  //           },
                  //     )
                  // RadioButton(
                  //   description: "Yes",
                  //   value: "yes",
                  //   groupValue: _DiagVal,
                  //   onChanged: (value) => setState(
                  //     () => _DiagVal = value,
                  //   ),
                  //   // activeColor: Colors.red,
                  //   textStyle: TextStyle(
                  //       // fontSize: 30,
                  //       // fontWeight: FontWeight.w600,
                  //       // color: Colors.red
                  //       ),
                  // ),
                  // RadioButton(
                  //   description: "No",
                  //   value: "no",
                           
                  //   groupValue: _DiagVal,
                  //   onChanged: (value) => setState(
                  //     () => _DiagVal = value,
                  //   ),
                  //   // textPosition: RadioButtonTextPosition.left,
                  // ),
                  // //  RadioButton(
                  // //   description: "Other",
                  // //   value: "Other",
                           
                  // //   groupValue: _singleValue,
                  // //   onChanged: (value) => setState(
                  // //     () => _singleValue = value,
                  // //   ),
                  // //   // textPosition: RadioButtonTextPosition.left,
                  // // ),
                              ],
                            ),
                ),
            //     Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     RadioButton(
            //       description: "Yes",
            //       value: "yes",
            //       groupValue: _appitvalue,
            //       onChanged: (value) => setState(
            //         () => _appitvalue = value,
            //       ),
            //       // activeColor: Colors.red,
            //       textStyle: TextStyle(
            //           // fontSize: 30,
            //           // fontWeight: FontWeight.w600,
            //           // color: Colors.red
            //           ),
            //     ),
            //     RadioButton(
            //       description: "No",
            //       value: "no",
           
            //       groupValue: _appitvalue,
            //       onChanged: (value) => setState(
            //         () => _appitvalue = value,
            //       ),
            //       // textPosition: RadioButtonTextPosition.left,
            //     ),
            //     //  RadioButton(
            //     //   description: "Other",
            //     //   value: "Other",
           
            //     //   groupValue: _singleValue,
            //     //   onChanged: (value) => setState(
            //     //     () => _singleValue = value,
            //     //   ),
            //     //   // textPosition: RadioButtonTextPosition.left,
            //     // ),
            //   ],
            // ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          primary: CustomColors.app_color,
                        ),
                  onPressed: (){
            var config_details={
           "call_token":calltokenController.text,
           "visit_token":visittokenController.text,           
           "show_diagnosis":_DiagVal,
           "show_appointment_time":_appitvalue,
            };
            add_config(config_details);
                }, child: Text('Update'))
              ],
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
  add_config(config_details) async {
    this.setState(() {
      loading = true;
    });

    var result = await api().update_config_call(accessToken, config_details);

    if (Helper().isvalidElement(result) &&
        Helper().isvalidElement(result['status']) &&
        result['status'] == 'Token is Expired') {
      Helper().appLogoutCall(context, 'Session expeired');
    } else {
      if (Helper().isvalidElement(result) &&
          Helper().isvalidElement(result['status']) &&
          result['status'] == 'Clinic Details Updated Successfully') {
        Fluttertoast.showToast(
            msg: 'Updated successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: CustomColors.success_color,
            textColor: Colors.white,
            fontSize: 15.0);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      }
      this.setState(() {
        // appointment_list = result['appointment_list'];
      });
    }
    this.setState(() {
      loading = false;
    });
  }

  getclinicconfig()async{
//     setState(() {
//    isLoading = ;
// });

   clinicconfig=await api().get_clinic_config(accessToken);
   if(Helper().isvalidElement(clinicconfig) && Helper().isvalidElement(clinicconfig['status']) && clinicconfig['status'] == 'Token is Expired'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          var data  = clinicconfig['list'];
          
  setState(() {          
  //  storage.setItem('diagnosisList', diagnosisList);
  calltokenController.text=data[0]['call_tkn'].toString();
  visittokenController.text=data[0]['visit_tkn'].toString();
  _DiagVal=data[0]['diagnosis_show'].toString().toLowerCase();
  _appitvalue=data[0]['time_show'].toString().toLowerCase();
                       
   isLoading = true;

});
print(data[0]);
 }
  }

}