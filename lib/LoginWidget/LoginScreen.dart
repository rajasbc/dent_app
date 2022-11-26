import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/main.dart';
import 'package:nigdent/Common/colors.dart' as appcolor;
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  bool isloading = false;

  @override
  void initState() {
    // patient_data = storage.getItem('selectedPatient');
    // print('object');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width - 20;
    var screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenheight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/dental.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/login_logo.png',
                height: screenheight * 0.3,
                // color: Colors.blue.shade100,
                color: Colors.black12,
              ),
            ),
            Container(
              // height: screenheight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 2.48),
                        )),
                  ),
                  SizedBox(
                    height: screenheight * 0.02,
                  ),
                  Container(
                    width: screenheight / 2.5,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    // padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 8.0),
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      width: screenheight / 2.5,
                      // decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.blueAccent),

                      //   borderRadius: BorderRadius.all(Radius.circular(20))),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // decoration: BoxDecoration(color: Colors.black,),
                            // color: Colors.red,
                            width: screenWidth * 0.65,
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
                            // color: Colors.yellow,
                            width: screenWidth * 0.15,
                            // width: screenheight / 2.5,
                            child: IconButton(
                              icon: Icon(
                                showPassword
                                    ? FontAwesome.eye_off
                                    : FontAwesome.eye,
                                color: Colors.black38,
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
                    height: screenheight * 0.02,
                  ),
                  SizedBox(
                    width: screenWidth * 0.88,
                    child: ElevatedButton(
                    
                      //  style: ElevatedButton.styleFrom(primary: const Color(0xff032423)),
                      child: isloading ? const 
                      SpinKitWave(
  color: Colors.white,
  size: 20.0,
) : const Text(
                        'LOGIN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1.5),
                      ),
                      onPressed: () async {
                        this.setState(() {
                          isloading = true;
                        });
                        var user_input = {
                          'email': _email.text,
                          'password': _password.text
                        };
                        if (!_email.text.isEmpty && !_password.text.isEmpty) {
                          var user_data =
                              await api().userLoginResponse(user_input);
                          storage.setItem('userResponse', user_data);
                          if (Helper().isvalidElement(user_data) && 
                          Helper().isvalidElement(user_data['error']) && 
                          user_data['error'] == 'Email_id and Password Incorrect') {
                            Fluttertoast.showToast(
                                msg:
                                    'Incorrect Email & Password',
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
                              _email.text = '';
                              _password.text = '';
                              this.setState(() {});
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           DashboardScreen()),
                              // );
                              Fluttertoast.showToast(
                                  msg:
                                      "${user_data['clinic_profile']['name']} login successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green.shade400,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              // Fluttertoast.showToast(
                              //     msg: "${user_data['lab_profile']['name']} ! login successfully",
                              //     toastLength: Toast.LENGTH_SHORT,
                              //     gravity: ToastGravity.CENTER,
                              //     timeInSecForIosWeb: 1,
                              //     backgroundColor: Colors.red,
                              //     textColor: Colors.white,
                              //     fontSize: 16.0);
                            }
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Email & Password cannot be empty',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                          this.setState(() {
                          isloading = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
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
