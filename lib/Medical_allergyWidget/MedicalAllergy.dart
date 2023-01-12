import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

class MedicalAllergy extends StatefulWidget {

  const MedicalAllergy({ super.key });

  @override
  State<MedicalAllergy> createState() => _MedicalAllergyState();
}

class _MedicalAllergyState extends State<MedicalAllergy> {
  TextEditingController bloodpressureController = TextEditingController();
  TextEditingController pulserateController = TextEditingController();
  TextEditingController resprateController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  TextEditingController diabetisController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  bool? bp = false;
  bool? pulse = false;
  bool? resp = false;
  bool? temp = false;
   bool? diabetis = false;
    bool? heartaling = false;
     bool? rheumatic = false;
      bool? asthma = false;
       bool? tuberculosis = false;
        bool? stomach = false;
         bool? kidney = false;
          bool? smoke = false;
          bool? artificialhip = false;
          bool? dentaltreatment = false;
           bool? list = false;
            bool? medicalcare = false;
             bool? drugs = false;
              bool? female = false;
               bool? allergies = false;
                 bool? thyroid = false;
                   bool? bleeding = false;
                     bool? epilespy = false;
                      bool? hepatites = false;
                       bool? hiv = false;
                        bool? stop = false;
   @override
   Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
       return Scaffold(
           appBar: AppBar(title: const Text('Medical Allergy'),
             backgroundColor: CustomColors.app_color,),
           body: Container(
            // height: screenheight,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                            Checkbox(value: bp,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        bp = value;
                      });
                           }),
                           Text('Blood Pressure')
                          ],
                        ),
                      ),
                      Container(
                        width: screenwidth*0.44,
                        child: TextFormField(
                           controller: bloodpressureController,
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder()
                        ),
                        ),
                      ),
                      Container(
                        width: screenwidth*0.06,
                      )

                    ],
                  ),
                   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                            Checkbox(value: pulse,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        pulse = value;
                      });
                           }),
                           Text('Pulse Rate')
                          ],
                        ),
                      ),
                      Container(
                        width: screenwidth*0.44,
                        child: TextFormField(
                           controller: pulserateController,
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder()
                        ),
                        ),
                      ),
                      Container(
                        width: screenwidth*0.06,
                      )
                    ],
                  ),
                   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                            Checkbox(value: resp,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        resp = value;
                      });
                           }),
                           Text('Resp Rate')
                          ],
                        ),
                      ),
                      Container(
                        width: screenwidth*0.44,
                        child: TextFormField(
                           controller: resprateController,
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder()
                        ),
                        ),
                      ),
                      Container(
                        width: screenwidth*0.06,
                      )
                    ],
                  ),
                   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                            Checkbox(value: temp,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        temp = value;
                      });
                           }),
                           Text('Temp')
                          ],
                        ),
                      ),
                      Container(
                        width: screenwidth*0.44,
                        child: TextFormField(
                           controller: tempController,
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder()
                        ),
                        ),
                      ),
                      Container(
                        width: screenwidth*0.06,
                      )
                    ],
                  ),
                   SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                            Checkbox(value: diabetis,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        diabetis = value;
                      });
                           }),
                           Text('Diabetis')
                          ],
                        ),
                      ),
                      Container(
                        width: screenwidth*0.44,
                        child: TextFormField(
                           controller: diabetisController,
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder()
                        ),
                        ),
                      ),
                      Container(
                        width: screenwidth*0.06,
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                 
                 
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: heartaling,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            heartaling = value;
                          });
                               }),
                               Text('Heart Alignment',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                  // SizedBox(height: 3,),
                  Row(
                    children: [
                      Checkbox(value: rheumatic,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            rheumatic = value;
                          });
                               }),
                               Text('Rheumatic Fever',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                  // SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: asthma,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            asthma = value;
                          });
                               }),
                               Text('Astma,Chest or Breathing Problem',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                  // SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: tuberculosis,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            tuberculosis = value;
                          });
                               }),
                               Text('Tuberculosis',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                  // SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: stomach,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            stomach = value;
                          });
                               }),
                               Text('Stomach or Bowel Problems(eg.Ulcer)',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                  // SizedBox(height: 10,),
                  Row(
                    children: [
                      Checkbox(value: kidney,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            kidney = value;
                          });
                               }),
                               Text('Kidney Diseases',
                                style: TextStyle(fontSize: 18),
                                )
                    ],
                    
                  ),
                   Row(
                    children: [
                      Container(
                        width: screenwidth*0.50,
                        child: Row(
                          children: [
                             Checkbox(value: smoke,
                           onChanged: (bool ? value){
                              //value returned when checkbox is clicked
                      setState(() {
                        smoke = value;
                      });
                           }),
                           Text('Do You Smoke ?',
                           style: TextStyle(fontSize: 16),
                           )
                          ],
                        ),
                      ),
                      Container(

                        child: Row(
                          children: [
                            Container(
                              width: screenwidth*0.20,
                              child: Text('How Many'),
                            ),
                            Container(
                              width: screenwidth*0.15,
                              child: TextFormField(
                                controller: smokeController,
                                decoration: const InputDecoration(
                                  labelText: '',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 15),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            Container(
                              width: screenwidth*0.15,
                              child: Text('   /Day'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                   Row(
                    children: [
                      Checkbox(value: artificialhip,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            artificialhip = value;
                          });
                               }),
                               Text('Do you have an artificial hip / heart valve',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Text('    / prosthetic implant ?',
                       style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                   Row(
                    children: [
                      Checkbox(value: dentaltreatment,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            dentaltreatment = value;
                          });
                               }),
                               Text('Have You ever had problem with dental',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                Row(
                    children: [
                      Text('    treatment ?',
                       style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: list,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            list = value;
                          });
                               }),
                               Text('List any other previous illness',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Checkbox(value: medicalcare,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            medicalcare = value;
                          });
                               }),
                               Text('Are you presently under medical care?',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                    Row(
                    children: [
                      Checkbox(value: drugs,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            drugs = value;
                          });
                               }),
                               Text('Are you taking any drugs / medicine ',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                   Row(
                    children: [
                      Text('    /tablets ?',
                       style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(value: female,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            female = value;
                          });
                               }),
                               Text('Female Patients,Are you pregnant',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                   Row(
                    children: [
                      Text('    /Feeding ?',
                       style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                   Row(
                    children: [
                      Checkbox(value: allergies,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            allergies = value;
                          });
                               }),
                               Text('Do you have allergies',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                   Row(
                    children: [
                      Checkbox(value: thyroid,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            thyroid = value;
                          });
                               }),
                               Text('Thyroid Problems',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                   Row(
                    children: [
                      Checkbox(value: bleeding,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            bleeding = value;
                          });
                               }),
                               Text('Excessive bleeding / blood disorder',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Checkbox(value: epilespy,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            epilespy = value;
                          });
                               }),
                               Text('Epilespy',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Checkbox(value: hepatites,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            hepatites = value;
                          });
                               }),
                               Text('Hepatitis',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Checkbox(value: hiv,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            hiv = value;
                          });
                               }),
                               Text('HIV/AIDS',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  Row(
                    children: [
                      Checkbox(value: stop,
                               onChanged: (bool ? value){
                                  //value returned when checkbox is clicked
                          setState(() {
                            stop = value;
                          });
                               }),
                               Text('Would you Like to stop',
                                style: TextStyle(fontSize: 17),
                                )
                    ],
                    
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        width: screenwidth*0.20,
                        child: Text('      Notes'),

                      ),
                      Container(
                        width: screenwidth*0.77,
                        child: TextFormField(
                          controller: notesController,
                          decoration: const InputDecoration(
                            // contentPadding: const EdgeInsets.symmetric(vertical: 35,horizontal: 15),
                            border: OutlineInputBorder(),
                          ),
                        ),

                      ),
                      Container(
                        width: screenwidth*0.03,
                      )
                    ],
                  ),
                  SizedBox(height: 25,),
                  ElevatedButton(
                    style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  CustomColors.app_color)),onPressed: (){

                  },
                   child: Text('Save'))
                ],
                // children: [
                //   Row(
                    
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Row(
                        
                //         children: [
                          
                //           Checkbox(value: check1,
                //            onChanged: (bool ? value){
                //               //value returned when checkbox is clicked
                //       setState(() {
                //         check1 = value;
                //       });
                //            }),
                //            Text('Blood Pressure')
                //         ],
                //       ),
                //       Row(
                        
                //         children: [
                //           Text('hi')
                //         ],
                //       ),
                      
                //       // TextFormField(
                //       //   controller: bloodpressureController,
                //       //   decoration: const InputDecoration(
                //       //     labelText: '',
                //       //     border: OutlineInputBorder()
                //       //   ),
                //       // )
                //     ],
                //   )
                // ],
              ),
            ),
           ),
       );
  }
}