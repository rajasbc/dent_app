import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/LoginWidget/LoginScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nigdent/Common/storeBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
var userResponse;
var token= null;
var storeBox;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final LocalStorage storage = new LocalStorage('nigdent_store');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = new LocalStorage('nigdent_store');
    
    userResponse = storage.getItem('userResponse');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         home:  DentWrapper()
    );
  }
 
}


class DentWrapper extends StatefulWidget {
  const DentWrapper({super.key});

  @override
  State<DentWrapper> createState() => _DentWrapperState();
}

class _DentWrapperState extends State<DentWrapper> {
  late SharedPreferences pref;
bool? isLoggedIn =false;
  @override
  void initState() {
    initPreferences();
    // TODO: implement initState
        super.initState();
  }
  void initPreferences() async{
    pref = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = pref.getBool('isLogin');
    });
  }
  @override
  Widget build(BuildContext context) {
         return isLoggedIn == 
         
         true ? DashboardScreen() : LoginScreen();
  }
}