import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/api/Apicall.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  TextEditingController dateController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  //TextEditingController TitleController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  var autoCompleteLoader = false;
  var patientList = null;
  var userResponse = null;
 var selectedPatient = null;
   var showAutoComplete = true;

  @override
  void initState() {
    super.initState();
      this.setState(() {
         userResponse = storage.getItem('userResponse');
    });
        getPatientList();

    dateController.text = "";
  }

  DateTime currentDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2023));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    dobController.text = pickedDate.toString().split(' ')[0];
  }

  final List<String> docter = [
    'Riyaz',
    'Docter 1',
    'Docter 2',
    'Docter 3',
    'Docter 4',
  ];
  String? selectedValue;

  final List<String> time = [
    '5:00 PM to 11:00 PM',
  ];
  String? selectedValue2;

  // String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  final List<String> title = [
    'Mr',
    'Mrs',
    'Ms',
    'Master',
    'Miss',
    'Smt',
    'Dr',
    'Baby',
  ];
  String? Title;

  String? Appointment;
  String? gender;
  String? Adult;

  int? _genderSelected = 1;
  String _genderVal = "";
  int? _AppointmentSelected = 1;
  String _AppointmentVal = "";
  int? _AdultSelected = 1;
  String _AdultVal = "";

  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text("New Appointment"),
            //backgroundColor: Colors.redAccent,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            //height: screenHeight,
            //width: screenWidth,
            child: Column(
              children: [
                Container(
                  child: DropdownButton2(
                    //controller: TitleController,
                    hint: Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: title
                        .map((title) => DropdownMenuItem<String>(
                              value: title,
                              child: Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ))
                        .toList(),
                    value: Title,
                    onChanged: (String? newValue) {
                      setState(() {
                        Title = newValue!;
                        if (Title == 'Mr') {
                          _genderSelected = 1;
                        } else if (Title == 'Mrs') {
                          _genderSelected = 2;
                        }
                      });
                    },
                    buttonHeight: 60,
                    buttonWidth: 300,
                    itemHeight: 40,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: 
                  showAutoComplete ?  renderSearchBar(screenWidth, screenHeight):
                        renderSelectedPatientWidget(screenWidth, screenHeight),
                  // renderAutoComplete(screenHeight, screenWidth),
                  // TextFormField(
                  //   autovalidateMode: AutovalidateMode.always,
                  //   controller: NameController,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'You Must Enter a Name';
                  //     }
                  //     return null;
                  //   },
                  //   decoration: const InputDecoration(
                  //     //icon: Icon(Icons.person),
                  //     hintText: 'Name',
                  //     labelText: 'Name *',
                  //     contentPadding: EdgeInsets.all(15),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Contact No',
                          border: OutlineInputBorder(),
                          //icon: Icon(Icons.people),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Gender :",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _genderSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _genderSelected = value as int;
                                _genderVal = 'Male';
                                print(_genderVal);
                              });
                            },
                          ),
                          const Text("Male"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _genderSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _genderSelected = value as int;
                                _genderVal = 'Female';
                                print(_genderVal);
                              });
                            },
                          ),
                          const Text("Female"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _genderSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _genderSelected = value as int;
                                _genderVal = 'Other';
                                print(_genderVal);
                              });
                            },
                          ),
                          const Text("Other"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: TextFormField(
                    // obscure/Text: true,
                    keyboardType: TextInputType.none,
                    // maxLength: 3,
                    controller: dobController,
                    onTap: () {
                      selectDate(context);
                    },
                    decoration: new InputDecoration(
                      //icon: Icon(Icons.calendar_today),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'DOB',
                      hintText: 'yyyy-mm-dd',
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.blueAccent, width: 0.5),
                        // borderRadius: new BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.grey, width: 0.5),
                        // borderRadius: new BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: screenWidth,
                  child: SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Age*',
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.numbers),
                      ),
                      autovalidateMode: AutovalidateMode.always,
                      controller: ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'You Must Enter a Age';
                        }
                        return null;
                      },
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      maxLength: 3,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _AdultSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _AdultSelected = value as int;
                                _AdultVal = 'Adult';
                                print(_AdultVal);
                              });
                            },
                          ),
                          const Text("Adult"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _AdultSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _AdultSelected = value as int;
                                _AdultVal = 'Peado';
                                print(_AdultVal);
                              });
                            },
                          ),
                          const Text("Peado"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: TextField(
                        controller:
                            dateController, //editing controller of this TextField
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Date:",
                          hintText: 'enter Date', //label text of field
                        ),
                        readOnly: true, // when true user cannot edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              dateController.text =
                                  formattedDate; //set foratted date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                          //when click we have to show the datepicker
                        }),
                  ),
                ),
                Container(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Docter',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: docter
                        .map((docter) => DropdownMenuItem<String>(
                              value: docter,
                              child: Text(
                                docter,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 70,
                    buttonWidth: 300,
                    itemHeight: 40,
                  ),
                ),
                Container(
                  child: DropdownButton2(
                    hint: Text(
                      'Slot Time',
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: time
                        .map((time) => DropdownMenuItem<String>(
                              value: time,
                              child: Text(
                                time,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        selectedValue2 = value as String;
                      });
                    },
                    buttonHeight: 60,
                    buttonWidth: 300,
                    itemHeight: 40,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Appointment:",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _AppointmentSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _AppointmentSelected = value as int;
                                _AppointmentVal = 'Call';
                                print(_AppointmentVal);
                              });
                            },
                          ),
                          const Text("Call"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _AppointmentSelected,
                            activeColor: Colors.blue,
                            onChanged: (value) {
                              setState(() {
                                _AppointmentSelected = value as int;
                                _AppointmentVal = 'Visit';
                                print(_AppointmentVal);
                              });
                            },
                          ),
                          const Text("Visit"),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  //child: SizedBox(height: 30, width: 100)
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    if (NameController.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'Please Enter Name',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // Validate returns true if the form is valid, or false otherwise.
                    } else if (ageController.text.isEmpty) {
                      //  print('notok');

                      Fluttertoast.showToast(
                          msg: 'Please Enter Age',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      var Appointment_details = {
                        'Name': NameController,
                        'age': ageController,

                        //'Title': TitleController
                      };
                      // print(
                      //     'Appointment_details: ******${Appointment_details}');
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
            // child: DropdownButtonHideUnderline(
            //   child: DropdownButton2(
            //     hint: Text(
            //       'Select Item',
            //       style: TextStyle(
            //         fontSize: 14,
            //         color: Theme.of(context).hintColor,
            //       ),
            //     ),
            //     items: items
            //         .map((item) => DropdownMenuItem<String>(
            //               value: item,
            //               child: Text(
            //                 item,
            //                 style: const TextStyle(
            //                   fontSize: 14,
            //                 ),
            //               ),
            //             ))
            //         .toList(),
            //     value: selectedValue,
            //     onChanged: (value) {
            //       setState(() {
            //         selectedValue = value as String;
            //       });
            //     },
            //     buttonHeight: 40,
            //     buttonWidth: 140,
            //     itemHeight: 40,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  renderAutoComplete(screenWidth, screenHeight){
    return Autocomplete<List>(
      
      optionsBuilder: (TextEditingValue textEditingValue) {

         if (textEditingValue.text == '') {
      return const Iterable<List>.empty();
    }
    else{

 var matches = [];
        matches.addAll(patientList);
        matches.retainWhere((s){
           return s['p_name'].toString().toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
        // this.setState(() {
        //   showAutoComplete = true;
        // });
        return [matches];

    }
},
  fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted) {
          return TextField(
            decoration: InputDecoration(
              //  border: OutlineInputBorder(),
               hintText: 'Search Patient Name'
            ),
            controller: textEditingController,
            focusNode: focusNode,
      
          );
    },
  optionsViewBuilder: (
    BuildContext context,
    AutocompleteOnSelected<List> onSelected,
    Iterable<List> options
    ) {
  return options.toList()[0].length > 0 ?Align(
    alignment: Alignment.topLeft,
    child: Material(
      child: Container(
        
        width: screenWidth*0.5,
        height: screenHeight*0.5,
        color: CustomColors.app_color,
        child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: options.toList()[0].length,
          itemBuilder: (BuildContext context, int index) {
         final  option = options.toList()[0].elementAt(index);

            return GestureDetector(
              onTap: () {
// storage.setItem('selectedPatient', options.toList()[0][index]);
                  this.setState(() {
                    selectedPatient = options.toList()[0][index];
          showAutoComplete = false;
        });
              },
              child: Container(
                color: CustomColors.app_color,
                child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${options.toList()[0][index]['p_name'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                  Text('Phone: ${options.toList()[0][index]['p_phone'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                  Text('Age: ${options.toList()[0][index]['p_age'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                  Divider(thickness: 1,)
                ],
              ),),
            );
          },
        ),
      ),
    ),
  ): Align(
    alignment: Alignment.topLeft,
    child: Material(
      child: Container(
        
     width: screenWidth*0.5,
        height: screenHeight*0.08,
        color: CustomColors.app_color,
        child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
        //  final  option = options.toList()[0].elementAt(index);

            return GestureDetector(
              onTap: () {
// storage.setItem('selectedPatient', options.toList()[0][index]);
                  this.setState(() {
                    selectedPatient = options.toList()[0][index];
          showAutoComplete = false;
        });
              },
              child: Container(
                color: CustomColors.app_color,
                child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Search List Empty', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  // Text('Phone: ${options.toList()[0][index]['p_phone'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                  // Text('Age: ${options.toList()[0][index]['p_age'].toString().toUpperCase()}', style: const TextStyle(color: Colors.white)),
                  Divider(thickness: 1,)
                ],
              ),),
            );
          },
        ),
      ),
    ),
  );
},
);
  }
  getPatientList() async{
  this.setState(() {
    autoCompleteLoader = true;
  }); // userResponse = storage.getItem('userResponse');
    patientList = await api().getPatientList(userResponse['access_token']);
           if(Helper().isvalidElement(patientList) && Helper().isvalidElement(patientList['status']) && patientList['status'] == 'Token is Invalid'){
               Helper().appLogoutCall(context, 'Session expeired');
               }
         else{
          
  //  storage.setItem('diagnosisList', diagnosisList);
                          // isLoading = false;
                          this.setState(() {
                            patientList = patientList["patient_list"];
                            autoCompleteLoader = false;
                          });
                              }
}
renderSelectedPatientWidget(screenWidth, screenHeight){
return Container(
  decoration: BoxDecoration(
    
      border: Border.all(color: CustomColors.app_color),
          borderRadius: BorderRadius.all(Radius.circular(8))
    ),
  // color: Colors.black38, 
width: screenWidth,
child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: screenWidth*0.66,

        // color: Colors.yellow,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Helper().isvalidElement(selectedPatient) ? "${selectedPatient['title'].toString() + ". " + selectedPatient['p_name'].toString().toUpperCase()}":'', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(Helper().isvalidElement(selectedPatient) ? "Reg.No ${selectedPatient['patient_id'].toString()}":''),
              ],
            ),
            
          ],
        ),
      ),
      Container(
        // height: screenHeight,
            width: screenWidth*0.1,
              // color: Colors.green,
// width: screenWidth*0.2,
          child: IconButton(onPressed: (){
            //  storage.setItem('selectedPatient', null);
             this.setState(() {
               selectedPatient = null;
               showAutoComplete = true;
             });
                             
          }, icon: Icon(Icons.close,),color: CustomColors.error_color,))
    ],
  ),
),);
}
  renderSearchBar(screenWidth, screenHeight){
return Container(
  // color: Colors.red,
  height: screenHeight*0.08,
   decoration: BoxDecoration(
          // color: Colors.red,
          border: Border.all(color: CustomColors.app_color),
          borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Container(width: screenWidth*0.1,height: screenHeight, child: Icon(Icons.search)),
              Container(width: screenWidth*0.6,height: screenHeight, child: 
              renderAutoComplete(screenWidth, screenHeight)
          ),
            ],
          ),
);
  }
}
