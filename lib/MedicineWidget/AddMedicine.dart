import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

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


String presetDropdownvalue = 'Preset';
String medicineDropdownvalue = 'Medicine';
String patternDropdownvalue = 'Pattern';

var preset =[
  'Preset',
  'sa',
];
var medicine=[
   'Medicine'
];

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
              SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Total Price',
                            border: OutlineInputBorder(),
                            //icon: Icon(Icons.numbers),
                          ),
                          // autovalidateMode: AutovalidateMode.always,
                          controller: priceController,
                          keyboardType: TextInputType.number,
                        
                        ),
                      ),
              ],
            ),
           ),
       );
  }
}