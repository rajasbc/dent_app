import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;


class AddStaff extends StatefulWidget {

  const AddStaff({ super.key });

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
    TextEditingController staffnameController = TextEditingController();
        TextEditingController designationController = TextEditingController();
                TextEditingController numberController = TextEditingController();
                     TextEditingController emailController = TextEditingController();
                        TextEditingController addressController = TextEditingController();
                            TextEditingController usernameController = TextEditingController();
                                 TextEditingController passwordController = TextEditingController();
                                      TextEditingController confirmpassController = TextEditingController();
                                        bool showPassword = false;
                bool showPassword2 = false;


String userlevelDropdownvalue= 'UserLevel : ';
String choosevalueDropdownvalue= 'Choose Branch : ';

var userlevel = [
  'UserLevel : ',
  'Admin',
  'Staff',
];
var choosevalue = [
  'Choose Branch : ',
  'Main Branch',
];


   @override
    bool _passwordVisible =false;
   bool _passwordVisible2 =false;
    void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Add Staff'),
             backgroundColor: CustomColors.app_color,),
           body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Staff Name',
                            border: OutlineInputBorder(),
                            //icon: Icon(Icons.numbers),
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          controller: staffnameController,
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
                            labelText: 'Mobile No',
                            border: OutlineInputBorder(),
                            //icon: Icon(Icons.numbers),
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          controller: numberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          maxLength: 10,
                        
                        ),
                      ),
                       SizedBox(height: 10,),
                       SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email ID',
                            border: OutlineInputBorder(),
                            //icon: Icon(Icons.numbers),
                          ),
                          autovalidateMode: AutovalidateMode.always,
                          controller: emailController,
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
                       SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButtonFormField(
                             value: userlevelDropdownvalue,
                             
                            items: userlevel.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                  onChanged: (String? newValue) {
                                  setState(() {
                                    userlevelDropdownvalue = newValue!;
                                  });
                                },
                          ),
                        ),
                         SizedBox(height: 10,),
                       SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButtonFormField(
                             value: choosevalueDropdownvalue,
                             
                            items: choosevalue.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                  onChanged: (String? newValue) {
                                  setState(() {
                                    choosevalueDropdownvalue = newValue!;
                                  });
                                },
                          ),
                        ),
                          SizedBox(height: 10,),
                       SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'User Name',
                            border: OutlineInputBorder(),
                            //icon: Icon(Icons.numbers),
                          ),
                          // autovalidateMode: AutovalidateMode.always,
                          controller: usernameController,
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return '';
                          //   }
                          //   return null;
                          // },
                        
                        ),
                      ),
                      SizedBox(height: 10,),
                     TextFormField(
                 keyboardType: TextInputType.text,
                 controller: passwordController,
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
                 controller: confirmpassController,
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
                      SizedBox(
                        child: ElevatedButton(onPressed:(){
                          if(staffnameController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Staff Name',
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
                 else if(numberController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Mobile Number',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(emailController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Enter Email Id',
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
                 else if(userlevelDropdownvalue == 'UserLevel : '){
                   Fluttertoast.showToast(msg: 'Please Select User Level',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else if(choosevalueDropdownvalue == 'Choose Branch : '){
                   Fluttertoast.showToast(msg: 'Please Choose Branch',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                  else if(passwordController != confirmpassController){
                   Fluttertoast.showToast(msg: 'Password Does not Match',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                 else if(passwordController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Password Cannot Be Empty',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else if(confirmpassController.text.isEmpty){
                   Fluttertoast.showToast(msg: 'Please Confirm Your Password',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                }
                else{
                  var staff_details=[

                  ];
                }



                        }, child: Text('Save')),
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