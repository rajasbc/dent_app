import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/api/Apicall.dart';

import '../Common/utils.dart';
import '../DashboardWidget/DasboardScreen.dart';
class Profile extends StatefulWidget {

  const Profile({ super.key });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
var accessToken = '';
  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];
  // getclinicconfig();
    super.initState();

  }
  TextEditingController clinicnameController = TextEditingController();
   TextEditingController shopshortnameController = TextEditingController();
    TextEditingController shopregnoController = TextEditingController();
     TextEditingController dlnoController = TextEditingController();
      TextEditingController shopgstnumberController = TextEditingController();
       TextEditingController addressline1Controller = TextEditingController();
        TextEditingController addressline2Controller = TextEditingController();
         TextEditingController areaController = TextEditingController();
          TextEditingController cityController = TextEditingController();
           TextEditingController stateController = TextEditingController();
            TextEditingController statecodeController = TextEditingController();
             TextEditingController countryController = TextEditingController();
              TextEditingController pincodeController = TextEditingController();
               TextEditingController mobilenoController = TextEditingController();
                TextEditingController alternatemobilenoController = TextEditingController();
                 TextEditingController landlinenoController = TextEditingController();

bool loading = false;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Profile'),
           backgroundColor: CustomColors.app_color,),
           body: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Clinic Name*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: clinicnameController,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                    SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Shop Short Name",
                        ),
                       
                        controller: shopshortnameController,
                      
              
                      ),
                    ),
                    SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Shop Registration Number",
                        ),
                       
                        controller: shopregnoController,
                      
              
                      ),
                    ),
                    SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "DL No*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: dlnoController,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                     SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Shop GST Number",
                        ),
                       
                        controller: shopgstnumberController,
                      
              
                      ),
                    ),
                     SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Address Line 1*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: addressline1Controller,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                    SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Address Line 2",
                        ),
                       
                        controller: addressline2Controller,
                      
              
                      ),
                    ),
                     SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Area",
                        ),
                       
                        controller: areaController,
                      
              
                      ),
                    ),
                     SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "City*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: cityController,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                     SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "State*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: stateController,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                    SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "State Code*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: statecodeController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                    SizedBox(height: 10,),
                     SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Country",
                        ),
                       
                        controller: countryController,
                      
              
                      ),
                    ),
                    SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "PIN Code*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: pincodeController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                          return null;
                        },
              
                      ),
                    ),
                      SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Mobile Number*",
                        ),
                        autovalidateMode: AutovalidateMode.always,
                        controller: mobilenoController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return "";
                          }
                         else if (value.length >= 1 && value.length <= 9) {
                            return 'Mobile.No Must Contain 10 Digits';
                          } else {
                            return null;
                          }
                        },
              
                      ),
                    ),
                    SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Alternate Mobile Number",
                        ),
                      
                        controller: alternatemobilenoController,
                        keyboardType: TextInputType.number,
                        
              
                      ),
                    ),
                    SizedBox(height: 10,),
                      SizedBox(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Landline Number",
                        ),
                      
                        controller: landlinenoController,
                        keyboardType: TextInputType.number,
                        
              
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton( style: ElevatedButton.styleFrom(
                          primary: CustomColors.app_color,
                        ),
                        onPressed: (){
                          if(clinicnameController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Clinic Name',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(dlnoController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter DL No',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(addressline1Controller.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Address',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(cityController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Your City',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(stateController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Your State',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(statecodeController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Your State Code',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(pincodeController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Your PIN code',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(mobilenoController.text.isEmpty){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Mobile Number',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else if(mobilenoController.text.length<10){
                             Fluttertoast.showToast(
                                      msg: 'Please Enter Valid Mobile Number',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                          }
                          else{
                          var profile_details={
                            "id":"12",
                            "clinic_name":clinicnameController.text,
                            "shop_short_name":shopshortnameController.text,
                            "shop_registration_number":shopregnoController.text,
                            "dl_no":dlnoController.text,
                            "shop_gst_number":shopgstnumberController.text,
                            "address_line_1":addressline1Controller.text,
                            "address_line_2":addressline2Controller.text,
                            "area":areaController.text,
                            "city":cityController.text,
                            "state":stateController.text,
                            "state_code":statecodeController.text,
                            "country":countryController.text,
                            "pincode":pincodeController.text,
                            "mobile_number":mobilenoController.text,
                            "alternative_mobile_mumber":alternatemobilenoController.text,
                            "landline_mumber":landlinenoController.text,
                          };
                          update_profile(profile_details);
                          }

                    }, child: Text('Update'))
                  ],
                ),
              ),
            ),
           ),
       );
  }
  update_profile(profile_details) async {
    this.setState(() {
      loading = true;
    });

    var result = await api().profile_update(accessToken, profile_details);
     if (Helper().isvalidElement(result) &&
        Helper().isvalidElement(result['status']) &&
        result['status'] == 'Token is Expired' ){
      Helper().appLogoutCall(context, 'Session expeired');
    } 
     else {
      if (Helper().isvalidElement(result) &&
          Helper().isvalidElement(result['status']) &&
          result['status'] == 'Profile update successfully') {
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
}