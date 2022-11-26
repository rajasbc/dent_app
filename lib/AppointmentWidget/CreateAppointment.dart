import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CreateAppointment extends StatefulWidget {
  const CreateAppointment({super.key});

  @override
  State<CreateAppointment> createState() => _CreateAppointmentState();
}

class _CreateAppointmentState extends State<CreateAppointment> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
  }

  final List<String> items = [
    'Docter 1',
    'Docter 2',
    'Docter 3',
    'Docter 4',
  ];
  String? selectedValue;

  String? gender;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Appointment"),
          //backgroundColor: Colors.redAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          height: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: [
              Center(
                child: TextField(
                    controller:
                        dateController, //editing controller of this TextField
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today), //icon of text field
                        labelText: "Enter Date" //label text of field
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
              DropdownButton2(
                hint: Text(
                  'Select Docter',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                    // padding: EdgeInsets.all(15),
                    //height: MediaQuery.of(context).size.width / 3,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
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
                buttonHeight: 40,
                buttonWidth: 140,
                itemHeight: 40,
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
    );
  }
}
