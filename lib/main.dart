import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/LoginWidget/LoginScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nigdent/Common/storeBox.dart';
var userResponse;
var token;
 main() async{
  await Hive.initFlutter();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final LocalStorage storage = new LocalStorage('nigdent_store');
  
  await StoreBoxActions().openBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   final LocalStorage storage = new LocalStorage('nigdent_store');
    
  //   userResponse = storage.getItem('userResponse');
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     // initialRoute: 'LoginScreen',
  //     home: userResponse != null && userResponse['access_token'] != null
  //         ? DashboardScreen()
  //         : LoginScreen(),
  //       // home: LoginScreen(),
  //   );
  // }

    @override
  Widget build(BuildContext context) {
    token = Hive.box(StoreBoxActions().userResponseBox).get('userResponse');
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'LoginScreen',
      home: token != null ? DashboardScreen()
          : LoginScreen(),
    );
  }
}
