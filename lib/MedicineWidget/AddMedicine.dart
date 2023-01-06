import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/Common/utils.dart';

import '../Common/storeBox.dart';

class AddMedicine extends StatefulWidget {

  const AddMedicine({ super.key });

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  TextEditingController genricnameController = TextEditingController();
TextEditingController daysController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController expireController = TextEditingController();
TextEditingController totalpriceController = TextEditingController();
TextEditingController instructionsController = TextEditingController();


late final Box? addmedicineList_storebox = Hive.box(StoreBoxActions().addMedicineBox);
String presetDropdownvalue = 'Preset';
String medicineDropdownvalue = 'Medicine';
String patternDropdownvalue = 'Pattern';

var preset =[
  'Preset',
  'sa',
];
var medicine=[
   'Medicine',
   'aaa',
];
var t_value ;

var pattern=[
  'Pattern',
  '0-0-0',
  '0-0-1',
  '0-1-0',
  '0-1-1',
  '1-0-0',
  '1-0-1',
  '1-1-0',
  '1-1-1',
  '0-0-2',
  '0-2-0',
  '0-2-2',
  '2-0-0',
  '2-0-2',
  '2-2-0',
  '2-2-2',
  'S-O-S',
];
 void initState(){
  calculate();
 }

 calculate(){
  // var c = int.parse(priceController.text) + int.parse(quantityController.text);
  var a = Helper().isvalidElement(priceController.text) ? priceController.text == "" ? '0' : priceController.text
  : '0';
  var b = Helper().isvalidElement(quantityController.text) ? quantityController.text == "" ? "0" : quantityController.text
  : '0';

  var c = int.parse(a) * int.parse(b);
  setState(() {
    totalpriceController.text= c.toString();
  });
 }
 DateTime currentDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: CustomColors.app_color, // <-- SEE HERE
            onPrimary: Colors.white, // <-- SEE HERE
            onSurface: CustomColors.app_color, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: CustomColors.app_color, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    expireController.text = pickedDate.toString().split(' ')[0];
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(
             backgroundColor: CustomColors.app_color,
             title: const Text('Add Medicine'),),
           body: Container(
            height: MediaQuery.of(context).size.height
,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField(
            
                  value: presetDropdownvalue,
                  items: preset.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      presetDropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
               SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Genric Name',
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.numbers),
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            controller: genricnameController,
                          
                          ),
                        ),
                        SizedBox(height: 10,),
                          SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField(
            
                  value: medicineDropdownvalue,
                  items: medicine.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      medicineDropdownvalue = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
                          SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButtonFormField(
            
                  value: patternDropdownvalue,
                  items: pattern.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      patternDropdownvalue = newValue!;
                    });
                  },
                ),
              ),
               SizedBox(height: 10,),
               SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Days',
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.numbers),
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            controller: daysController,
                            keyboardType: TextInputType.number,
                          
                          ),
                        ),
                        SizedBox(height: 10,),
               SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.numbers),
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            controller: priceController,
                            keyboardType: TextInputType.number,
                          
                          ),
                        ),
                        SizedBox(height: 10,),
               SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.numbers),
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            autovalidateMode: AutovalidateMode.always,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              this.setState(() {
                                calculate();
                                })
                            },
                            // onEditingComplete: (){
                            //   this.setState(() {
                            //     calculate();
                            //   //  totalpriceController = int.parse(priceController.text) + int.parse(quantityController.text) ;
                            //   });
                            // },
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                          
                          ),
                        ),
                         SizedBox(height: 10),
              TextFormField(
                // obscure/Text: true,
                keyboardType: TextInputType.none,
                // maxLength: 3,
                controller: expireController,
                onTap: () {
                  selectDate(context);
                },
                decoration: new InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Expire Date',
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Colors.blueAccent, width: 0.5),
                    // borderRadius: new BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey, width: 0.5),
                    // borderRadius: new BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height:10),
                SizedBox(
                        //   child: TextFormField(
                        //     decoration: const InputDecoration(
                        //       labelText: 'total',
                        //       border: OutlineInputBorder(),
                        //       //icon: Icon(Icons.numbers),
                        //     ),
                        //     initialValue: ,
                        //     // autovalidateMode: AutovalidateMode.always,
                        //     controller: totalpriceController,
                        //     keyboardType: TextInputType.number,
                          
                        //   ),
                        child: TextField(controller: totalpriceController,
                            decoration: new InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Total Price',
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blueAccent, width: 0.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey, width: 0.5),
                              ),
                            ), ),
                        ),
                          SizedBox(height: 10,),
               SizedBox(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Instructions',
                              border: OutlineInputBorder(),
                              //icon: Icon(Icons.numbers),
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            controller: instructionsController,
                            // keyboardType: TextInputType.number,
                          
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () async
                          {
                            
                          if(medicineDropdownvalue.isEmpty || medicineDropdownvalue=='Medicine'){
                             Fluttertoast.showToast(
                              msg: 'Select Medicine',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: CustomColors.error_color,
                              textColor: Colors.white,
                              fontSize: 15.0);

                          }
                          else if(daysController.text.isEmpty){
                            Fluttertoast.showToast(
                              msg: 'Enter The Days',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: CustomColors.error_color,
                              textColor: Colors.white,
                              fontSize: 15.0);
                          }
                          else if(priceController.text.isEmpty){
                            Fluttertoast.showToast(
                              msg: 'Enter The Price',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: CustomColors.error_color,
                              textColor: Colors.white,
                              fontSize: 15.0);
                          }
                          else if(quantityController.text.isEmpty){
                            Fluttertoast.showToast(
                              msg: 'Enter The Quantity',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: CustomColors.error_color,
                              textColor: Colors.white,
                              fontSize: 15.0);
                          }
                          else if(totalpriceController.text.isEmpty){
                            Fluttertoast.showToast(
                              msg: 'Enter Total Price',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: CustomColors.error_color,
                              textColor: Colors.white,
                              fontSize: 15.0);
                          }
                          else{
                            var medicine_details={
                              "preset":presetDropdownvalue,
                              "genricname":genricnameController.text,
                              "medicine":medicineDropdownvalue,
                              "pattern":patternDropdownvalue,
                              "days":daysController.text,
                              "price":priceController.text,
                              "quantity":quantityController.text,
                              "expiredate":expireController.text,
                              "totalprice":totalpriceController.text,
                              "instruction":instructionsController.text,
                            };
                            var data = medicine_details;
                           await addmedicineList_storebox?.put(
                              'addMedicine',data);
                            getItem();

                            // print(medicine_details);
                            // presetDropdownvalue="";
                            // genricnameController.text="";
                            // medicineDropdownvalue = 'Medicine';
                           this.setState(() {
                            presetDropdownvalue="Preset";
                            genricnameController.text="";
                             medicineDropdownvalue="Medicine";
                             patternDropdownvalue="Pattern";
                             daysController.text="";
                             priceController.text="";
                             quantityController.text="";
                             expireController.text="";
                             totalpriceController.text="";
                             instructionsController.text="";
                           }
                           );
                            // patternDropdownvalue="";

                          }
                          
                        }, child: Text("add")),
                        Divider(),
                        // Container(

                        //   child: ListView.builder(
                        //     itemCount: 4,
                        //      itemBuilder: (BuildContext context, int index){
                        //       return Container(
                        //          color: index%2 ==0 ? Color.fromARGB(255, 218, 235, 238): Colors.white,
                        //            child: Column(
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Row(
                        //               children: [
                        //                 Text(
                        //               'Date :',
                        //               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                        //               ),
                        //               Text('hi')
                        //               ],
                        //             ),
                        //              Row(
                        //               children: [
                        //                 Text(
                        //               'Medicine :',
                        //               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                        //               ),
                        //               Text('hi')
                        //               ],
                        //             ),
                                                          
                        //           ],
                        //         )
                        //       ],
                        //                                     ),
                        //       );
                        //      },
                          
                        //   ),
                        // )
                ],
              ),
            ),
           ),
       );
  }
  
getItem() async{
  var result = addmedicineList_storebox?.get('addMedicine');
  return addmedicineList_storebox?.values.toList()[0];
}
putItem() async {
  
}
}