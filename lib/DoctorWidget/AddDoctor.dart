import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import '../Common/utils.dart';
import '../api/Apicall.dart';
import 'DoctorsList.dart';

class AddDoctor extends StatefulWidget {

  const AddDoctor({ super.key });

  @override
  
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController nameController = TextEditingController();
    TextEditingController designationController = TextEditingController();
      TextEditingController professionController = TextEditingController();
        TextEditingController mobileController = TextEditingController();
          TextEditingController emailController = TextEditingController();
            TextEditingController addressController = TextEditingController();
              TextEditingController passwordController = TextEditingController();
               TextEditingController conpasswordController = TextEditingController();
                bool showPassword = false;
                bool showPassword2 = false;

  String doctorDropdownvalue = 'Dr';

   @override
   bool _passwordVisible =false;
   bool _passwordVisible2 =false;
    void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }
    var storeBox;
   
  //   void initState() {
  //   _passwordVisible2 = false;
  // }
   var doctor= [
    'Dr'
   ];
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Add Doctor'),
                       backgroundColor: CustomColors.app_color,
),
           body: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonFormField(
                         value: doctorDropdownvalue,
                        items: doctor.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                              onChanged: (String? newValue) {
                              setState(() {
                                doctorDropdownvalue = newValue!;
                              });
                            },
                      ),
                    ),
                     SizedBox(height: 10,),
                    SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Doctor Name',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    
                    ),
                  ),
                  SizedBox(height: 10,),
                      SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Designation',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: designationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    
                    ),
                  ),
                   SizedBox(height: 10,),
                      SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Profession',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: professionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    
                    ),
                  ),
                   SizedBox(height: 10,),
                    SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        else if(value.length>=1 && value.length<=9){
                          return 'Mobile.No Must Contain 10 Digits';
                        }
                        else{
                        return null;
                        }
                      },
                      keyboardType:
                          TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                   SizedBox(height: 10,),
                    SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Id',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: emailController,
                      validator: (value) {
                       if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.') || !value.contains('com')) {
                          return '';
                        }
                        return null;
                      },
                    
                    ),
                  ),
                   SizedBox(height: 10,),
                    SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                    
                    ),
                  ),
                    SizedBox(height: 10,),
                 TextFormField(
   keyboardType: TextInputType.text,
     autovalidateMode: AutovalidateMode.always,
   controller: passwordController,
   validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        else if(value.length>=1 && value.length<=6){
                          return'More Than 6 Characters';
                        }
                        else{
                        return null;
                        }
                      },
   obscureText: !_passwordVisible,//This will obscure text dynamically
   decoration: InputDecoration(
       labelText: 'Password',
       hintText: 'Password',
       // Here is key idea
       suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color: Theme.of(context).primaryColorDark,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
          ),
        ),
         SizedBox(height: 10,),
                 TextFormField(
   keyboardType: TextInputType.text,
     autovalidateMode: AutovalidateMode.always,
   controller: conpasswordController,
    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        return null;
                      },
   obscureText: !_passwordVisible2,//This will obscure text dynamically
   decoration: InputDecoration(
       labelText: 'Confirm Password',
       hintText: ' Confirm Password',
       // Here is key idea
       suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible2
               ? Icons.visibility
               : Icons.visibility_off,
               color: Theme.of(context).primaryColorDark,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible2 = !_passwordVisible2;
               });
             },
           
            ),
          ),
          // onEditingComplete: (){
          //   print('333333333333333333');
          // },
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              // width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),

                onPressed: () async{
                if(nameController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Doctor Name',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(designationController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Designation',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                  else if(professionController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Profession',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(mobileController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Mobile.No',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(mobileController.text.length<10){
                   Fluttertoast.showToast(msg: 'Mobile.No Must Have 10 Digits',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else if(emailController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Email',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if( ! emailController.text. contains('@') || ! emailController.text.contains('.') || !emailController.text.contains('com')){
                   Fluttertoast.showToast(msg: 'Please Enter Valid Email Id',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else if(addressController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Address',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(passwordController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Password',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(conpasswordController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Confirm Your Password',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(passwordController.text != conpasswordController.text){
                   Fluttertoast.showToast(msg: 'Password does not Match',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else{
                  
                  var doctor_details={
                    // "referral_name":nameController.text,
                    "doctor_name":nameController.text,
                    "mobile_number":mobileController.text,
                    "email_id":emailController.text,
                    // "rtype":"Doctor",
                    "password":passwordController.text,
                    "designation":designationController.text,
                    // "page_type":"doctor",
                    // "usertype":professionController.text,
                    "address":addressController.text,
                    "doctor_id":""
                  };
                   String access_token = storage.getItem('userResponse')['access_token'];

                          var result=  await api().addDoctor(access_token, doctor_details);
                          print(result);
                          if(result['status'] == "Doctor Added  Successfully"){
                              Fluttertoast.showToast(msg: 'Doctor Added Successfully',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                            textColor: Colors.white,
                                    fontSize: 16.0);

                                    Navigator.push(context, MaterialPageRoute(
                                      builder:  (context) => const DoctorsList()));

                          }
                          else{
                             Fluttertoast.showToast(msg: 'Please Try Again Later',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                          }
                }

              }, child: Text('Save')),
            ),
            //  SizedBox(
            //   // width: MediaQuery.of(context).size.width / 2,
            //   child: ElevatedButton(
            //       child: const Text('Reset'),
            //       onPressed: () {
            //        nameController.clear();
            //        designationController.clear();
            //        professionController.clear();
            //        mobileController.clear();
            //        emailController.clear();
            //        addressController.clear();
            //        passwordController.clear();
            //        conpasswordController.clear();
            //       },
            //       style: ElevatedButton.styleFrom(
            //         primary: Colors.deepOrangeAccent,
            //         //onPrimary: Colors.black,
            //       ),
            //     ),
            // ),
          ],
        )
                  ],
                ),
              ),
             ),
           ),
       );
  }
  togglePasswordView() {
    setState(() {
      showPassword = !showPassword;
      //  showPassword2 = !showPassword2;
    });
  }
  
}