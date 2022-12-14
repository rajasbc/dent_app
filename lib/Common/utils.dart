import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;
import '../main.dart';
import 'colors.dart' as CustomColor;
final LocalStorage storage = new LocalStorage('nigdent_store');
  late SharedPreferences pref;
class Helper {
  isvalidElement(data) {
    return data != null;
  }

  // getCurrentDate() {
  //   var now = new DateTime.now();
  //   var formatter = new DateFormat('yyyy-MM-dd');
  //   String formattedDate = formatter.format(now);
  //   print(formattedDate);
  //   return formattedDate;
  // }

  appLogoutCall(context, action) async {
    // StoreBoxActions().clearBoxKey('userResponse');
    // storage.setItem('userResponse', null);
    // storage.setItem('selectedPatient', null);
    pref = await SharedPreferences.getInstance();
 await pref.setBool('isLogin', false);
    storage.clear();
    //  pref.setString('access_token', user_data['access_token']);
    //                         pref.setBool('isLogin', true);
    await pref.remove('access_token');
     await pref.remove('isLogin');

        // await Hive.box('userResponse').delete(userResponse);
    Navigator.push(context, MaterialPageRoute(builder: (context) => DentWrapper()));
    Fluttertoast.showToast(
        msg: action == 'logout' ? 'Logout successfully' : 'Session expeired',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor:
            action == 'logout' ?CustomColor.success_color: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    // );
  }

  // getLastWeekDate() {
  //   DateTime now = DateTime.now();
  //   var formatter = new DateFormat('yyyy-MM-dd');
  //   String formattedDate = formatter.format(now.subtract(Duration(
  //     days: now.weekday,
  //   )));
  //   print(formattedDate);
  //   return formattedDate;
  // }
}

// import 'package:niglabs/entities.dart';
// import 'package:niglabs/objectbox.g.dart';

// Store? store;

// //  getuserResponse(){
// // final List<UserResponse> userResponse = store!.box<UserResponse>().getAll();

// //  }

// Future<List<UserResponse>> getAllCustomers() async {
//   final List<UserResponse> parents = [];
//   final List<UserResponse> userResponse =
//       await store!.box<UserResponse>().getAll();
//   for (final p in userResponse) {
//     // print(p.name);
//     parents.add(p);
//   }
//   print(userResponse.length);
//   // this.setState(() {
//   //   userList = parents;
//   // });
//   // this.setState(() {});
//   return userResponse;
// }

//   getAllCustomer() async {
//     final UserResponse parents;
//     final UserResponse parentsObox = await store!.box<UserResponse>().getAll() as UserResponse;
//     // for (final p in parentsObox) {
//     //   print(p.name);
//     //   parents.add(p);
//     // }
//     // print(parentsObox.length);
//     // this.setState(() {
//     //   userList = parents;
//     // });
//     // this.setState(() {});
//     return parentsObox;
//   }
// // getAllCustomers() async {
// //   final List<UserResponse> parents = [];
// //   final List<UserResponse> userResponse =
// //       await store!.box<UserResponse>().getAll();
// //   for (final p in userResponse) {
// //     // print(p.name);
// //     parents.add(p);
// //   }
// //   print(userResponse.length);
// //   // this.setState(() {
// //   //   userList = parents;
// //   // });
// //   // this.setState(() {});
// //   return userResponse;
// // }

//     // final List<User> parentsObox = await store!.box<User>().getAll();
