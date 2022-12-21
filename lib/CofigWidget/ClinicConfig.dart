import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
class ClinicConfig extends StatefulWidget {

  const ClinicConfig({ super.key });

  @override
  State<ClinicConfig> createState() => _ClinicConfigState();
}

class _ClinicConfigState extends State<ClinicConfig> {
  TextEditingController  calltokenController = TextEditingController();
  TextEditingController  visittokenController = TextEditingController();


int? _DiagSelected = 1;
  String _DiagVal = "";
  
int? _apptimeSelected = 1;
  String _apptimeVal = "";


   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Clinic Configaration'),
           backgroundColor: CustomColors.app_color,),
           body: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: calltokenController,
                  decoration: new InputDecoration(
                    filled: true,
                    labelText: 'Call Token',
                      contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.blueAccent, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                ),
                  ),
                ),
                  SizedBox(height: 10,),
                TextField(
                  controller: visittokenController,
                  decoration: new InputDecoration(
                    filled: true,
                    labelText: 'visit Token',
                      contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.blueAccent, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                ),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Do You Want Diagnosis ? ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                         Radio(
                                  value: 1,
                                  groupValue: _DiagSelected,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    setState(() {
                                      _DiagSelected = value as int;
                                      _DiagVal = 'Yes';
                                      print(_DiagVal);
                                    });
                                  },
                                ),
                                const Text("Yes"),
                      ],
                    ),
                     Row(
                      children: [
                         Radio(
                                  value: 2,
                                  groupValue: _DiagSelected,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    setState(() {
                                      _DiagSelected = value as int;
                                      _DiagVal = 'No';
                                      print(_DiagVal);
                                    });
                                  },
                                ),
                                const Text("No"),
                      ],
                    )
                  ],
                ),
                  SizedBox(height: 10,),
                Text('Do You Want Appointment Time ? ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                         Radio(
                                  value: 1,
                                  groupValue: _apptimeSelected,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    setState(() {
                                      _apptimeSelected = value as int;
                                      _apptimeVal = 'Yes';
                                      print(_apptimeVal);
                                    });
                                  },
                                ),
                                const Text("Yes"),
                      ],
                    ),
                     Row(
                      children: [
                         Radio(
                                  value: 2,
                                  groupValue: _apptimeSelected,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    setState(() {
                                      _apptimeSelected = value as int;
                                      _apptimeVal = 'No';
                                      print(_apptimeVal);
                                    });
                                  },
                                ),
                                const Text("No"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          primary: CustomColors.app_color,
                        ),
                  onPressed: (){

                }, child: Text('Update'))
              ],
            ),
           ),
       );
  }
}