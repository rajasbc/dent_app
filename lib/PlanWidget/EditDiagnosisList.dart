import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'package:nigdent/PlanWidget/DentalPlanWidget.dart';

import '../Common/utils.dart';

import './Methods/PlanMethodApi.dart';

class EditDiagnosisiList extends StatefulWidget {
  EditDiagnosisiList({
    Key? key,
  }) : super(key: key);

  // TextEditingController dobController = TextEditingController();
  // TextEditingController feesController = TextEditingController();

  @override
  State<EditDiagnosisiList> createState() => _EditDiagnosisiListState();
}

class _EditDiagnosisiListState extends State<EditDiagnosisiList> {
  final LocalStorage storage = new LocalStorage('nigdent_store');
  final List<String> visit_items = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '12',
  ];
  late String accessToken;
  var treatment_list;
  var diagnosis_list;
  var diagnosisDropdownvalue_name;
  var treatmentDropdownvalue_name;
  bool isLoading = false;

  void initState() {
    accessToken = storage.getItem('userResponse')['access_token'];

    method();
  }

  method() async {
    isLoading = true;
    var result =
        await PlanMethodApi().getTreatmentListApi(accessToken, context);
    var result1 =
        await PlanMethodApi().getDiagnosisListApi(accessToken, context);

    var get_diagnosisi_item_list = storage.getItem('diagnosis_item_list');

    feesController.text = Helper().isvalidElement(get_diagnosisi_item_list)
        ? Helper().isvalidElement(get_diagnosisi_item_list)
            ? get_diagnosisi_item_list['fees'].toString()
            : '0.00'
        : '0.00';

    discountController.text = Helper().isvalidElement(get_diagnosisi_item_list)
        ? Helper().isvalidElement(get_diagnosisi_item_list)
            ? get_diagnosisi_item_list['discount'].toString()
            : '0.00'
        : '0.00';

    // diagnosisDropdownvalue = Helper().isvalidElement(get_diagnosisi_item_list)
    //     ? get_diagnosisi_item_list['diagnosis']
    //     : '';

    // treatmentDropdownvalue = Helper().isvalidElement(get_diagnosisi_item_list)
    //     ? Helper().isvalidElement(get_diagnosisi_item_list['treatment'])
    //         ? get_diagnosisi_item_list['treatment']
    //         : ''
    //     : '';
    visitDropdownvalue = Helper().isvalidElement(get_diagnosisi_item_list)
        ? Helper().isvalidElement(get_diagnosisi_item_list['visit'].toString())
            ? get_diagnosisi_item_list['visit'].toString()
            : '0'
        : '0';

    this.setState(() {
      treatment_list = result;
      diagnosis_list = result1;
      isLoading = false;
    });
  }

  @override
  TextEditingController dobController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController discountController = TextEditingController();

  String diagnosisDropdownvalue = '';
  String treatmentDropdownvalue = '';
  String visitDropdownvalue = '';

  DateTime currentDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1950),
        lastDate: DateTime(2023));

    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
      dobController.text = pickedDate.toString().split(' ')[0];
    } else {
      dobController.text = "";
    }
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    String? selectedValue;
    var get_diagnosisi_item_list1 = storage.getItem('diagnosis_item_list');
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: CustomColors.app_color,
            title: Text('Edit Diagnosis List'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: !isLoading
              ? Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.none,
                            controller: dobController,
                            onTap: () {
                              selectDate(context);
                            },
                            decoration: new InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: Helper()
                                      .isvalidElement(get_diagnosisi_item_list1)
                                  ? get_diagnosisi_item_list1['treatment_date']
                                              .toString() ==
                                          "1970-01-01"
                                      ? "dd-mm-yyyy"
                                      : get_diagnosisi_item_list1[
                                              'treatment_date']
                                          .toString()
                                  : "dd-mm-yyyy",
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.blueAccent, width: 0.5),
                                // borderRadius: new BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Colors.grey, width: 0.5),
                                // borderRadius: new BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton2(
                      //       hint: Text(
                      //         'Select Item',
                      //         style: TextStyle(
                      //           fontSize: 14,
                      //           color: Theme.of(context).hintColor,
                      //         ),
                      //       ),
                      //       items: items
                      //           .map((item) => DropdownMenuItem<String>(
                      //                 value: item,
                      //                 child: Text(
                      //                   item,
                      //                   style: const TextStyle(
                      //                     fontSize: 14,
                      //                   ),
                      //                 ),
                      //               ))
                      //           .toList(),
                      //       value: selectedValue,
                      //       onChanged: (value) {
                      //         setState(() {
                      //            selectedValue = value as String;
                      //         });

                      //       },
                      //       buttonHeight: 40,
                      //       buttonWidth: 140,
                      //       itemHeight: 40,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          // padding: EdgeInsets.only(top: 15),
//                   child:
//                   showDocAutoComplete ?  renderSearchBar(screenWidth, screenHeight):
//                         renderSelectedPatientWidget(screenWidth, screenHeight),

                          child: Helper().isvalidElement(diagnosis_list) &&
                                  diagnosis_list.length > 0
                              ? Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Diagnosis',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )),
                                    DropdownButtonFormField(
                                      // validator: (value) => validateDrops(value),
                                      // isExpanded: true,
                                      hint: Text(
                                        diagnosisDropdownvalue == ''
                                            ? Helper().isvalidElement(
                                                    get_diagnosisi_item_list1)
                                                ? get_diagnosisi_item_list1[
                                                        'diagnosis']
                                                    .toString()
                                                : 'dd'
                                            : 'Select Diagnosis',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      // value:' _selectedState[i]',
                                      onChanged: (diagnosis_val) {
                                        var a = diagnosis_val
                                            .toString()
                                            .split('*&');
                                        setState(() {
                                          diagnosisDropdownvalue =
                                              a[0].toString();
                                          diagnosisDropdownvalue_name =
                                              a[1].toString();
                                          // selectedDoctor = doctor;
                                          // print("Stae value");
                                          // print(newValue);
                                          // _selectedState[i]= newValue;
                                          // getMyDistricts(newValue, i);
                                        });
                                      },
                                      items: diagnosis_list
                                          .map<DropdownMenuItem<String>>(
                                              (item) {
                                        return new DropdownMenuItem(
                                          child: new Text(
                                            item['diagnosis_name'].toString(),
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: item['id'].toString() +
                                              "*&" +
                                              item['diagnosis_name'].toString(),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                              : DropdownButtonFormField(
                                  // validator: (value) => validateDrops(value),
                                  // isExpanded: true,
                                  hint: Text('Select Diagnosis'),
                                  // value:' _selectedState[i]',
                                  onChanged: (selectedDoctor) {
                                    setState(() {
                                      // selectedDoctor = selectedDoctor;
                                      // print("Stae value");
                                      // print(newValue);
                                      // _selectedState[i]= newValue;
                                      // getMyDistricts(newValue, i);
                                    });
                                  },
                                  items:
                                      [].map<DropdownMenuItem<String>>((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(''),
                                      value: '',
                                    );
                                  }).toList(),
                                )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          // padding: EdgeInsets.only(top: 15),
//                   child:
//                   showDocAutoComplete ?  renderSearchBar(screenWidth, screenHeight):
//                         renderSelectedPatientWidget(screenWidth, screenHeight),

                          child: Helper().isvalidElement(treatment_list) &&
                                  treatment_list.length > 0
                              ? Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Treatment',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )),
                                    DropdownButtonFormField(
                                      // validator: (value) => validateDrops(value),
                                      // isExpanded: true,
                                      hint: Text(
                                        treatmentDropdownvalue == ''
                                            ? Helper().isvalidElement(
                                                    get_diagnosisi_item_list1)
                                                ? Helper().isvalidElement(
                                                        get_diagnosisi_item_list1[
                                                            'treatment'])
                                                    ? get_diagnosisi_item_list1[
                                                                    'treatment']
                                                                .toString() !=
                                                            ''
                                                        ? get_diagnosisi_item_list1[
                                                                'treatment']
                                                            .toString()
                                                        : 'Select Treatment'
                                                    : 'Select Treatment'
                                                : 'Select Treatment'
                                            : 'Select Treatment',
                                        style: TextStyle(fontSize: 14),
                                      ),

                                      // value:' _selectedState[i]',
                                      onChanged: (treament_val) {
                                        var t_v =
                                            treament_val.toString().split('*&');
                                        setState(() {
                                          treatmentDropdownvalue =
                                              t_v[0].toString();
                                          treatmentDropdownvalue_name =
                                              t_v[1].toString();
                                          // selectedDoctor = doctor;
                                          // print("Stae value");
                                          // print(newValue);
                                          // _selectedState[i]= newValue;
                                          // getMyDistricts(newValue, i);
                                        });
                                      },
                                      items: treatment_list
                                          .map<DropdownMenuItem<String>>(
                                              (item) {
                                        return new DropdownMenuItem(
                                          child: new Text(
                                            item['treatment_name'].toString(),
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          value: item['id'].toString() +
                                              "*&" +
                                              item['treatment_name'].toString(),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                              : DropdownButtonFormField(
                                  // validator: (value) => validateDrops(value),
                                  // isExpanded: true,
                                  hint: Text('Select Treatment'),
                                  // value:' _selectedState[i]',
                                  onChanged: (selectedDoctor) {
                                    setState(() {
                                      // selectedDoctor = selectedDoctor;
                                      // print("Stae value");
                                      // print(newValue);
                                      // _selectedState[i]= newValue;
                                      // getMyDistricts(newValue, i);
                                    });
                                  },
                                  items:
                                      [].map<DropdownMenuItem<String>>((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(''),
                                      value: '',
                                    );
                                  }).toList(),
                                )),
                      SizedBox(height: 10),

                      Container(
                        child: TextField(
                          controller: feesController,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Fees',
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
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      Container(
                        child: TextField(
                          controller: discountController,
                          decoration: new InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Discount',
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
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          // padding: EdgeInsets.only(top: 15),
//                   child:
//                   showDocAutoComplete ?  renderSearchBar(screenWidth, screenHeight):
//                         renderSelectedPatientWidget(screenWidth, screenHeight),

                          child: Helper().isvalidElement(treatment_list) &&
                                  treatment_list.length > 0
                              ? Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '	Visit',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )),
                                    DropdownButtonFormField(
                                      // validator: (value) => validateDrops(value),
                                      // isExpanded: true,

                                      hint: Text(
                                        visitDropdownvalue != ''
                                            ? visitDropdownvalue
                                            : 'Select Visit',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      // value:' _selectedState[i]',
                                      onChanged: (visit_val) {
                                        setState(() {
                                          visitDropdownvalue =
                                              visit_val.toString();
                                          // selectedDoctor = doctor;
                                          // print("Stae value");
                                          // print(newValue);
                                          // _selectedState[i]= newValue;
                                          // getMyDistricts(newValue, i);
                                        });
                                      },
                                      items: visit_items
                                          .map<DropdownMenuItem<String>>(
                                              (item) {
                                        return new DropdownMenuItem(
                                          child: new Text(
                                            item,
                                          ),
                                          value: item,
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                              : DropdownButtonFormField(
                                  // validator: (value) => validateDrops(value),
                                  // isExpanded: true,
                                  hint: Text('Select Visit'),
                                  // value:' _selectedState[i]',
                                  onChanged: (selectedDoctor) {
                                    setState(() {
                                      // selectedDoctor = selectedDoctor;
                                      // print("Stae value");
                                      // print(newValue);
                                      // _selectedState[i]= newValue;
                                      // getMyDistricts(newValue, i);
                                    });
                                  },
                                  items:
                                      [].map<DropdownMenuItem<String>>((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(''),
                                      value: '',
                                    );
                                  }).toList(),
                                )),

                      SizedBox(height: 10),
                      Container(
                        child: ElevatedButton(
                          // style: style,
                          onPressed: () async {
                            var get_item_diagnosis_id =
                                storage.getItem('diagnosis_item_list');
                            var update_diagnosis = {
                              "Date": dobController.text == ''
                                  ? get_item_diagnosis_id['treatment_date']
                                              .toString() ==
                                          "1970-01-01"
                                      ? ""
                                      : get_diagnosisi_item_list1[
                                              'treatment_date']
                                          .toString()
                                  : dobController.text,
                              "id": get_item_diagnosis_id['id'].toString(),
                              "d_id": diagnosisDropdownvalue == ''
                                  ? get_item_diagnosis_id['d_id'].toString()
                                  : diagnosisDropdownvalue,
                              "t_id": treatmentDropdownvalue == ''
                                  ? get_item_diagnosis_id['t_id'].toString()
                                  : treatmentDropdownvalue,
                              "Diagnosis": diagnosisDropdownvalue_name != null
                                  ? diagnosisDropdownvalue_name != ''
                                      ? diagnosisDropdownvalue_name
                                      : get_item_diagnosis_id['diagnosis']
                                          .toString()
                                  : get_item_diagnosis_id['diagnosis']
                                      .toString(),
                              "Treatment": treatmentDropdownvalue_name != null
                                  ? treatmentDropdownvalue_name != ''
                                      ? treatmentDropdownvalue_name
                                      : get_item_diagnosis_id['treatment']
                                          .toString()
                                  : get_item_diagnosis_id['treatment']
                                      .toString(),
                              "Fees": feesController.text,
                              "Discount": discountController.text,
                              "Visit": visitDropdownvalue
                            };
                            var result_edit_diagnnosis = await PlanMethodApi()
                                .editDiagnosisListApi(
                                    accessToken, context, update_diagnosis);

                            if (result_edit_diagnnosis ==
                                'Update Added  Successfully') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DentalPlan()),
                              );
                              storage.deleteItem('diagnosis_item_list');
                            }

                            print(update_diagnosis);
                            // print(get_item_diagnosis_id);
                          },
                          child: const Text('Update'),
                        ),
                      )
                    ],
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/loading_image.png',
                    // height: screenheight * 0.3,
                    // color: Colors.blue.shade100,
                    // color: Colors.black12,
                  ),
                ),
        ),
      ),
    );
  }
}
