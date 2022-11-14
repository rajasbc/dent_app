import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/api/Apicall.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dental.png"), fit: BoxFit.cover)),
        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: _email,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                          Container(
                    padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: _isHidden,
                      controller: _password,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                          suffix: InkWell(
                  onTap: togglePasswordView, 
                  child: Icon(
                    _isHidden ?    
                     Icons.visibility :
                     Icons.visibility_off,
                  ),
                ),
                      ),
                    ),
                  ), 
                     ElevatedButton(
                      child: const Text('   Login    '),
                      onPressed: () async{
                        var user_input={
                          'email':_email.text,
                          'password':_password.text
                        };
                        if(!_email.text.isEmpty &&
                            !_password.text.isEmpty){
                              var user_data =
                              await api().userLoginResponse(user_input);
                              if(user_data=='Email_id and Password Incorrect'){
                                Fluttertoast.showToast(
                                  msg: 
                                  'Please Enter Your Correct Username and Password',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.red ,
                                  textColor: Colors.white,
                                  fontSize: 15.0 );
                              }
                            }else{
                              Fluttertoast.showToast(
                                msg: 'Username And Password Cannot Be Empty',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.red,
                                textColor: Colors.white );
                            }
                      },
                    ),
                      ],
        ),
      ),
    );
  }
      togglePasswordView() {
    setState(() {
        _isHidden = !_isHidden;
    });
}
}