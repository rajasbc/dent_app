import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nigdent/Common/utils.dart';
import 'package:nigdent/PlanWidget/DentalPlanWidget.dart';
import 'package:nigdent/api/Apicall.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nigdent/Common/colors.dart' as CustomColor;


class DiagnosisList extends StatefulWidget {
  final String option;
  const DiagnosisList({Key? key, required this.option}) : super(key: key);

  @override
  State<DiagnosisList> createState() => _DiagnosisListState();
}

class _DiagnosisListState extends State<DiagnosisList> {
    final LocalStorage storage = new LocalStorage('nigdent_store');
    late String accessToken;
    var selectedTeeth;
    var selected_diagnosis_treatment;
    var diagnosisList ;
    bool isLoading = false;
      var searchList;
        TextEditingController searchText = TextEditingController();

  @override
  void initState() {

    // TODO: implement initState
    accessToken = storage.getItem('userResponse')['access_token'];
selectedTeeth = storage.getItem('selectedTeethPosition');

getDiagnosisList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: 
        PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text('${widget.option} List'),
        ),
      ),
              resizeToAvoidBottomInset: false,

        body: 
           !isLoading ? Container(
             height: screenHeight,
             child: Column(

               children: [
                SizedBox(height: screenHeight*0.01,),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, right: 10),
                  child: Container(
                    height: screenHeight * 0.085,
                    child: renderSearchBar(),
                  ),
                ),
                 SizedBox(height: screenHeight*0.01,),
                 Container(
                    height: screenHeight*0.89,
        width: screenWidth,
                  child:  Helper().isvalidElement(diagnosisList) &&
                  Helper().isvalidElement(diagnosisList.values)&&
                  Helper().isvalidElement(diagnosisList.values.toList())&&
                  Helper().isvalidElement(diagnosisList.values.toList()[0]) && diagnosisList.values.toList()[0].length > 0 ?  
                  ListView.builder(
                                  // itemCount:diagnosisList.values.toList()[0].length,

                                   itemCount: searchText.text.isEmpty
                      ? diagnosisList.values.toList()[0].length
                      : searchList?.length,
                                  // scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                     final data;
                                     int data_index = index;
                                    data = searchText.text.isEmpty
                          ? diagnosisList.values.toList()[0]
                          : diagnosisList.values.toList();
                                    return Container(
                                      width: screenWidth,
                                      child: Row(
                                      
                                            children: [
                                             Container(
                                              // color: Colors.red,
                                              width: screenWidth*0.78,
                                               child: Padding(
                                                 padding: const EdgeInsets.only(left: 8.0, right:8.0, top: 15.0, bottom: 15.0),
                                                 child: Text('${index+1}. ${diagnosisList.values.toList()[0][index]['diagnosis_name'].toString()}'),
                                               ),
                                             ),
                                             SizedBox(width: screenWidth*0.01,),
                                             Container(
                                                // color: Colors.green,
                                              width: screenWidth*0.2,
                                              child: ElevatedButton(onPressed: (){
                                                    print('selectedTeeth ${selectedTeeth.length}');
                                                    if(Helper().isvalidElement(selectedTeeth) && selectedTeeth.length > 0){
                                                      var diag_treat_list = [];

                                                      var get_diag_treat_list = storage.getItem('selected_diagnosis_treatment');
                                                      if(Helper().isvalidElement(get_diag_treat_list) &&  get_diag_treat_list.length > 0){
                                                        diag_treat_list = get_diag_treat_list;
                                                        diag_treat_list.add(data[data_index]);
                                                        // var list = get_diag_treat_list;
                                                      //  for (var element in get_diag_treat_list) {
                                                      //   diag_treat_list.add(element);
                                                      //   }
                                                        
                                                        // diag_treat_list = get_diag_treat_list;
                                                      }else{
                                                        diag_treat_list.add(data[data_index]);
                                                      }
                                                              storage.setItem('selected_diagnosis_treatment', diag_treat_list);
                                                              // Navigator.pop(context);
                                                              Navigator.pop(context,
              MaterialPageRoute(builder: (context) => DentalPlan()));


                                                    }else{
                                      Fluttertoast.showToast(
                                      msg:
                                          'Kindly Add Atleast One Teeth Part',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: CustomColor.error_color,
                                      textColor: Colors.white,
                                      fontSize: 15.0);
                                                    }
                                              },child: 
                                              Text('Add', style: TextStyle(),textAlign: TextAlign.center,),),

                                             )
                                            ],
                                      
                                      ),
                                    );
                                  }): Image.asset(
                        'assets/images/no_data_found.png',
                        // height: screenheight * 0.3,
                        // color: Colors.blue.shade100,
                        // color: Colors.black12,
                      ),),
               ],
             ),
           ): Align(
            alignment: Alignment.center,
            child: Image.asset(
                  'assets/images/loading_image.png',
                  // height: screenheight * 0.3,
                  // color: Colors.blue.shade100,
                  // color: Colors.black12,
                ),
          ),
        ),
    
    );
  }
  getDiagnosisList() async{
isLoading = true;
     diagnosisList =
                              await api().getDiagnosisList(accessToken);
                          storage.setItem('diagnosisList', diagnosisList);
                          isLoading = false;
                          this.setState(() {
                            
                          });
                          // print(diagnosisList);
  }
  renderSearchBar() {
    return Container(
      // height: MediaQuery.of(context).size.height *0.08,
      // color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        leading: Icon(Icons.search),
        trailing: IconButton(
            onPressed: () {
              searchText.text = '';
              // searchList = null;
              this.setState(() {});
            },
            icon: Icon(Icons.close)),
        title: TextField(
          controller: searchText,
          onChanged: (text) {
            print(text);
            // this.setState(() {});
            var list = diagnosisList['DiagnosisList'];


// function filter(_items) {
//     return _items.map((day, items) {
//         return new MapEntry(day, items.where((i) {
//           return i.stringProperty.contains(widget.filter) ? true : false;
//         }).toList());
//     });
// }


list.map((day, items) {
        return new MapEntry(day, items.where((i) {
          return i.diagnosis_name.toString().contains(text) ? true : false;
        }).toList());
    });

            // searchList = list.where((element) {
            //   // element = isSwitchOn == true
            //   //     ? new PatientListModal.fromMap(element)
            //   //     : element;
            //   final diagnosisName = element?.diagnosis_name.toLowerCase();
            //   // final number = element?.mobile_no;
            //   return diagnosisName.contains(text.toLowerCase());
            // }).toList();
            this.setState(() {});
          },
          decoration: new InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: Colors.white,
            hintText: 'Search ${widget.option}...',
          ),
        ),
      ),
    );
  }
}
