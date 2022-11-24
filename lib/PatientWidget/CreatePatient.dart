import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:group_radio_button/group_radio_button.dart';
// import 'package:country_state_city_picker/country_state_city_picker.dart';

class CreatePatient extends StatefulWidget {
  const CreatePatient({super.key});

  @override
  State<CreatePatient> createState() => _CreatePatientState();
}

class _CreatePatientState extends State<CreatePatient> {
  var show_information;
  void initState() {
    show_information = 'Basic Information';
  }

  @override

  // String? _singleValue;
//  int _radioSelected = 1;
int? _radioSelected=1;
String _radioVal ="";


  String? _vaccivalue;

  TextEditingController patientnameController = TextEditingController();
  TextEditingController  dobController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController altermobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addrsline1Controller = TextEditingController();
  TextEditingController addrsline2Controller = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController streetnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController homephoneController = TextEditingController();
  TextEditingController officephoneController = TextEditingController();
  TextEditingController emergencycontactController = TextEditingController();
  TextEditingController idnoController = TextEditingController();
  TextEditingController regnoController = TextEditingController();
  TextEditingController regdateController = TextEditingController();
  TextEditingController regfeeController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController hygynistController = TextEditingController();
  TextEditingController expiresonController = TextEditingController();
  TextEditingController marketinfoController = TextEditingController();
  TextEditingController catogeryController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController citynameController = TextEditingController();
  // TextEditingController stateController = TextEditingController();
  // TextEditingController countryController = TextEditingController();
  
  




  

   String titleDropdownvalue = 'Mr';
   String bloodDropdownvalue = 'Select Blood Group';
   String idDropdownvalue = 'Select ID Proof';
   String PCMDropdownvalue = 'Preferred Contact Method';
   String regtypeDropdownvalue = 'Register Type : ';
   String payDropdownvalue = 'Payment Type : ';
   String validateDropdownvalue = 'Validity : ';
   String stateDropdownvalue = 'State : ';
   String countryDropdownvalue = 'Country : ';



  var title = [
    'Mr',
    'Mrs',
    'Master',
    'Ms',
    'Dr',
    'Baby',
  ];
  
   var blood = [
    'Select Blood Group',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  var id = [
   'Select ID Proof',
   'Aadhaar Card',
   'Passport',
   'Voter ID Card',
   'PAN Card',
   'Driving Licensees'
  ];
  var PCM = [
    'Preferred Contact Method',
    'Whatsapp',
    'Email',
    'phone',
  ];

  var regtype = [
    'Register Type : ',
    'New patient',
    'Visit patient',
  ];

   var pay = [
    'Payment Type : ',
    'Paytm',
    'Google Pay',
    'Amazon Pay',
    'PhonePe',
    'Credit/Debit Card',
    'Cash',
    'Others'
  ];

   var validate = [
    'Validity : ',
    '01 month',
    '02 month',
    '03 month',
    '04 month',
    '05 month',
    '06 month',
    '07 month',
    '08 month',
    '09 month',
    '10 month',
    '11 month',
    '12 month',
  ];

  var state = [
    'State : ',
    'Tamil Nadu',
    'Andhrapradesh',
    'Karnatakka',
    'Kerala',
    'Mumbai',
    'Maharashtra',
    'Gujarath'
  ];

  var country = [
    'Country : ',
    'India',
    'Australia',
    'South Africa',
    'Newzland',
    'England',
    'Cash',
    'West Indies'
  ];

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
 


DateTime currentdate = DateTime.now();

  Future<void> selectdate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentdate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2023));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
   regdateController.text = pickedDate.toString().split(' ')[0];
    
  }

  late String countryValue;
  late String stateValue;
  late String cityValue;

   bool? check1 = false;

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
            title: Text('Add Patient'),
          ),
        ),
        body:
         SingleChildScrollView(
           child: Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.003),
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.33,
                        child: ElevatedButton(
                          onPressed: () {
                            this.setState(() {
                              show_information = 'Basic Information';
                            });
                          },
                          child: Align(
                              alignment: Alignment.center, child: Text('Basic')),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.33,
                        child: ElevatedButton(
                          onPressed: () {
                            this.setState(() {
                              show_information = 'Personal Information';
                            });
                          },
                          child: Align(
                              alignment: Alignment.center,
                              child: Text('Personal')),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.33,
                        child: ElevatedButton(
                          onPressed: () {
                            this.setState(() {
                              show_information = 'Other Information';
                            });
                          },
                          child: Align(
                              alignment: Alignment.center, child: Text('Other')),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Container(
                  height: screenHeight * 0.93,
                  width: screenWidth,
                  // decoration: BoxDecoration(color: Colors.yellow),
                  child: SingleChildScrollView(
                      child: show_information == 'Basic Information'
                          ? renderBasicInformationWidget()
                          : show_information == 'Personal Information'
                              ? renderPersonalInformationWidget()
                              : renderOtherInformationWidget()),
                ),
              ],
            ),
                 ),
         ),
      ),
    );
  }

  renderBasicInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
             SizedBox(
                width: MediaQuery.of(context).size.width,
                 child: DropdownButtonFormField(
                          // Initial Value
                          autovalidateMode: AutovalidateMode.always,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value == 'Select title') {
                              return 'You must select title';
                            }
                            return null;
                          },
                          value: titleDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items

                          items: title.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              titleDropdownvalue = newValue!;
                              if(titleDropdownvalue=='Mr'){
                                _radioSelected=1;
                              }
                              else if(titleDropdownvalue=='Mrs'){
                                _radioSelected=2;
                              }
                            });
                          },
                        ),
              ),


               SizedBox(height: 10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: patientnameController,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return'You Must Enter A Patient Name';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'First Name',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

               SizedBox(height: 10,),
              TextFormField(
                // autovalidateMode: AutovalidateMode.always,
                controller: lastnameController,
                // validator: (value){
                //   if(value==null || value.isEmpty){
                //     return'You Must Enter A Patient Name';
                //   }
                //   return null;
                // },
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Last Name',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                SizedBox(height: 10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: ageController,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return'You Must Enter Age';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                maxLength: 3,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Age',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),
                        SizedBox(height: 10),
                      TextFormField(
                        // obscure/Text: true,
                        keyboardType: TextInputType.none,
                        // maxLength: 3,
                        controller: dobController,
                        onTap: () {
                          selectDate(context);
                        },
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'D O B',
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

               SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: mobileController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Mobile.No',
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

                       SizedBox(height: 10),
                      TextFormField(
                        // obscureText: true,
                        autovalidateMode: AutovalidateMode.always,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'You must enter email';
                        //   }
                        //   return null;
                        // },
                        controller: emailController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Email',
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


                      Divider(),
                      
                      
                //        Text("Gender: ", style: TextStyle( 
                //     fontSize: 18
                // ),),
                //  autovalidateMode: AutovalidateMode.always,
                // validator: (value){
                //   if(value==null || value.isEmpty){
                //     return'You Must Enter Gender';
                //   }
                //   return null;
                // },),
               

              //  Padding(
              //           padding: EdgeInsets.only(left: 5, right: 5),),
                        Row(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value as int;
                      _radioVal = 'Male';
                      print(_radioVal);
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
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value as int;
                      _radioVal = 'Female';
                      print(_radioVal);
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
                  groupValue: _radioSelected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _radioSelected = value as int;
                      _radioVal = 'Other';
                      print(_radioVal);
                    });
                  },
                ),
                const Text("Other"),
              ],
            ),
          ],
        ),


              SizedBox(height: 10,),
              TextFormField(
                // autovalidateMode: AutovalidateMode.always,
                controller: addrsline1Controller,
                // validator: (value){
                //   if(value==null || value.isEmpty){
                //     return'You Must Enter A Patient Name';
                //   }
                //   return null;
                // },
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Address Line 1',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                SizedBox(height: 10,),
              TextFormField(
                // autovalidateMode: AutovalidateMode.always,
                controller: addrsline2Controller,
                // validator: (value){
                //   if(value==null || value.isEmpty){
                //     return'You Must Enter A Patient Name';
                //   }
                //   return null;
                // },
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Address Line 2',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                SizedBox(height: 10,),
              TextFormField(
                controller: streetnameController,
       
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Street',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

               SizedBox(height: 10,),
              TextFormField(
                controller: citynameController,
       
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'City',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

               SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: stateDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: state.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              stateDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                       SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: countryDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: country.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              countryDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),



            //   SelectState(
            //      onStateChanged:(value) {
            //   setState(() {
            //     stateValue = value;
            //   });
            // },
            //  onCountryChanged: (value) {
            //   setState(() {
            //     countryValue = value;
            //   });
            // },
            //  onCityChanged:(value) {
            //   setState(() {
            //     cityValue = value;
            //   });
            // },
            //   ),

                SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: pincodeController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Postal Code',
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



          ],
        ),
      ),
    );
  }

  renderPersonalInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [

             SizedBox(height: 10,),
              TextFormField(
                controller: nicknameController,
       
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Nick Name',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                 SizedBox(height: 10,),
              TextFormField(
                controller: occupationController,
       
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Occupation',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: bloodDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: blood.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              bloodDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),


                          SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: homephoneController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Home Phone',
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

                          SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: officephoneController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Office Phone',
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

                          SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        controller: emergencycontactController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Emergency Contact',
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

                      
                SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: idDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: id.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              idDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                        SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        maxLength: 70,
                        controller: idnoController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'ID No',
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

                       SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: PCMDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: PCM.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              PCMDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),




          ],
        )
      ),
    );
  }

  renderOtherInformationWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child:Column(
          children: [
             SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        maxLength: 15,
                        controller: regnoController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Reg No',
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

                       SizedBox(height: 10),
                      TextFormField(
                        // obscure/Text: true,
                        keyboardType: TextInputType.none,
                        // maxLength: 3,
                        controller: regdateController,
                        onTap: () {
                          selectdate(context);
                        },
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Reg Date',
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

                      SizedBox(height: 10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: regfeeController,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return'You Must Enter Register Fee';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Reg Fee',
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,bottom: 8.0,top: 8.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.blueAccent,width: 0.5
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(
                      color: Colors.grey,width: 0.5
                    ),
                  ),
                ),
              ),

                SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: doctorController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Doctor',
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

                        SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: hygynistController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Hygienists',
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

                        SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: expiresonController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Expires On',
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

                       SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: regtypeDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: regtype.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              regtypeDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                       SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value: payDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: pay.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              payDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                       SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButtonFormField(
                          // Initial Value
                          value:validateDropdownvalue,

                          // Down Arrow Icon
                          // icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: validate.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              validateDropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),


                       SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: marketinfoController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Marketing Info',
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

                       SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: catogeryController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Category',
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

                       SizedBox(height: 10),
                      TextFormField(
                        // keyboardType: TextInputType.phone,
                        // maxLength: 15,
                        controller: remarksController,
                        decoration: new InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Remarks',
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

                      Text('Vaccinate ?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                      ),),


                       Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RadioButton(
                  description: "Yes",
                  value: "Yes",
                  groupValue: _vaccivalue,
                  onChanged: (value) => setState(
                    () => _vaccivalue = value,
                  ),
                  // activeColor: Colors.red,
                  textStyle: TextStyle(
                    // fontSize: 30,
                    // fontWeight: FontWeight.w600,
                    // color: Colors.red
                  ),
                ),
                RadioButton(
                  description: "No",
                  value: "No",

                  groupValue: _vaccivalue,
                  onChanged: (value) => setState(
                    () => _vaccivalue = value,
                  ),
                  // textPosition: RadioButtonTextPosition.left,
                ),
                //  RadioButton(
                //   description: "Other",
                //   value: "Other",

                //   groupValue: _singleValue,
                //   onChanged: (value) => setState(
                //     () => _singleValue = value,
                //   ),
                //   // textPosition: RadioButtonTextPosition.left,
                // ),
              ],
            ),

           Row(
             children: [
               Checkbox( //only check box
                        value: check1, //unchecked
                        onChanged: (bool? value){
                            //value returned when checkbox is clicked
                            setState(() {
                                check1 = value;
                            });
                        },
                      ),
                      Text('Collect Here')
             ],
           ),

           Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        onPressed: (){


                          
                          // //  var _radioVal;
                         
                                    



                                   
                          if(ageController.text.isEmpty){
                              //  print('notok');

                            Fluttertoast.showToast(msg: 'Please Enter Age',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                            
                          }
                          else if(patientnameController.text.isEmpty ){
                            Fluttertoast.showToast(msg: 'Please Enter Name',
                             toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0
                            );
                            
                          }
                          else if(titleDropdownvalue=='Select title'){
                            Fluttertoast.showToast(msg: 'Please Select Title',
                             toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                          }
                          else if(regfeeController.text.isEmpty){
                            Fluttertoast.showToast(msg: 'Please Enter Reg Fees',
                             toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                             timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                            textColor: Colors.white,
                                    fontSize: 16.0);
                          }
                          else {
                              var patient_details={
                                   'title': titleDropdownvalue,
                                   'first_name': patientnameController.text,
                                   'last_name': lastnameController.text,
                                   'age' :  ageController.text,
                                   'dob': dobController.text,
                                   'mobile_no': mobileController.text,
                                   'email': emailController.text,
                                   'gender':   _radioSelected,
                                   'address_line1': addrsline1Controller.text,
                                   'address_line2': addrsline2Controller.text,
                                   'street': streetnameController.text,
                                   'city': citynameController.text,
                                   'state': stateDropdownvalue,
                                   'country': countryDropdownvalue,
                                   'postal_code': pincodeController.text,
                                   'nick_name': nicknameController.text,
                                   'occupation': occupationController.text,
                                   'blood_group':bloodDropdownvalue,
                                   'home_phone':homephoneController.text,
                                   'office_phone': officephoneController.text,
                                   'emergency_contact': emergencycontactController.text,
                                   'id_proof': idDropdownvalue,
                                   'id_no':idnoController.text,
                                   'preferred_contact_method': PCMDropdownvalue,
                                   'reg_no':regnoController.text,
                                   'reg_date': regdateController.text,
                                   'reg_fee': regfeeController.text,
                                   'doctor': doctorController.text,
                                   'hygienists': hygynistController.text,
                                   'expires_on': expiresonController.text,
                                   'register_type': regtypeDropdownvalue,
                                   'payment_type': payDropdownvalue,
                                   'validity': validateDropdownvalue,
                                   'marketing_info': marketinfoController.text,
                                   'category': catogeryController.text,
                                   'remarks': remarksController.text,
                                   'vaccinate': _vaccivalue,
                                   'collect_here': check1,


                                   };
                                       print('patient detalis: ******${patient_details}');
                          }
                          


                              
                        }, child: Text('Save'))))



          ],
        ),
      ),
    );
  }
 

}