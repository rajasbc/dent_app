import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/main.dart';
import 'package:nigdent/Common/colors.dart' as appcolor;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LocalStorage storage = new LocalStorage('nigdent_store');

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool showPassword = false;

  @override
  void initState() {
    // patient_data = storage.getItem('selectedPatient');
    // print('object');
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 20;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/dental.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              // padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  border: InputBorder.none,
                  hintText: 'Username',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                width: screenWidth,
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.blueAccent),

                //   borderRadius: BorderRadius.all(Radius.circular(20))),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: Colors.black,),
                      width: screenWidth * 0.83,
                      child: TextField(
                        obscureText: showPassword,
                        controller: _password,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      child: IconButton(
                        icon: Icon(
                          showPassword ? FontAwesome.eye_off : FontAwesome.eye,
                          color: Colors.blueAccent,
                          size: 18,
                        ),
                        onPressed: () {
                          togglePasswordView();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
        //  style: ElevatedButton.styleFrom(primary: const Color(0xff032423)),
              child: const Text('LOGIN'),
              onPressed: () async {
                var user_input = {
                  'email': _email.text,
                  'password': _password.text
                };
                if (!_email.text.isEmpty && !_password.text.isEmpty) {
                  var user_data = await api().userLoginResponse(user_input);
                  storage.setItem('userResponse', user_data);
                  if (user_data == 'Email_id and Password Incorrect') {
                    Fluttertoast.showToast(
                        msg: 'Please Enter Your Correct Username and Password',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 15.0);
                  } else {
                    // var user = UserData.fromMap(user_data);
                    // await storeBox?.put('userResponse', user);

                    if (user_data['access_token'] != null) {
                      this.setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           DashboardScreen()),
                      // );
                    } else {
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: 'Username And Password Cannot Be Empty',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.red,
                      textColor: Colors.white);
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
      showPassword = !showPassword;
    });
  }
}
