import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/DashboardWidget/DasboardScreen.dart';
import 'package:nigdent/LoginWidget/LoginScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nigdent/Common/storeBox.dart';
var userResponse;
var token= null;
var storeBox;
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final LocalStorage storage = new LocalStorage('nigdent_store');
  // await Hive.initFlutter();
  // storeBox = await Hive.openBox('userResponse');
  // storeBoxRegister();
  runApp(MyApp());
}
  //  storeBoxRegister()async{
  // await Hive.initFlutter();
  // await StoreBoxActions().openBox();

  //   }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalStorage storage = new LocalStorage('nigdent_store');
    
    userResponse = storage.getItem('userResponse');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'LoginScreen',
      home: userResponse != null && userResponse['access_token'] != null
          ? DashboardScreen()
          : LoginScreen(),
        //  home:  DashboardScreen()
          
        // home: LoginScreen(),
    );
  }

//     @override
//   Widget build(BuildContext context) {
//     token = Hive.box('userResponse').get('userResponse');
    
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialRoute: 'LoginScreen',
//             home: Helper().isvalidElement(token) && Helper().isvalidElement(token['access_token']
// )  ? DashboardScreen() : LoginScreen(),


//     );
//   }
 
}
