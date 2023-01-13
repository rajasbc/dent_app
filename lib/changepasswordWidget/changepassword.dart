import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:fluttertoast/fluttertoast.dart';

class Changepassword extends StatefulWidget {

  const Changepassword({ super.key });

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  bool showPassword = false;
  bool showPassword2 = false;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();

   @override
   bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Change Password'),backgroundColor: CustomColors.app_color,),
           body: Container(
            child: Column(
              children: [
                 SizedBox(
                   child: TextFormField(
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.always,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          } else if (value.length >= 1 && value.length <6) {
                            return 'Password should more than 6 characters';
                          } else {
                            return null;
                          }
                        },
                        obscureText:
                            !_passwordVisible, //This will obscure text dynamically
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          // hintText: 'Password',
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
                 ),
                    SizedBox(height: 10,),
                     SizedBox(
                       child: TextFormField(
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.always,
                        controller: confirmpassController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          // else if(value.length>1 && passwordController != confirmpassController){
                          //   return'Should Be Same as Password';
                          // }
                          else {
                            return null;
                          }
                        },
                        obscureText:
                            !_passwordVisible2, //This will obscure text dynamically
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          // hintText: ' Confirm Password',
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
                     ),
                     SizedBox(
                      height: 15,
                     ),
                     ElevatedButton(
                        style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          CustomColors.app_color)),
                                          onPressed: (){
                                            if(passwordController.text.isEmpty){
                                                Fluttertoast.showToast(
                                      msg: 'Please Enter Password',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                            }
                                            else if(passwordController.text.length<6){
                                               Fluttertoast.showToast(
                                      msg: 'Password Must Have Six Digits',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                            }
                                             else if(confirmpassController.text.isEmpty){
                                               Fluttertoast.showToast(
                                      msg: 'Please Confirm Your Password',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                             }
                                            else if(passwordController.text != confirmpassController.text){
                                               Fluttertoast.showToast(
                                      msg: 'Password Does Not Match',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                            }
                                            else {
                                              var passdetails ={
                                                "new_Password":passwordController,
                                                "confirm_Password":confirmpassController,
                                              };
                                            }

                     }, child: Text('Save'))
              ],
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