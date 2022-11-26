import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'modal/selectedteethmodal.dart';
import 'package:localstorage/localstorage.dart';

class AdultsModalWidget extends StatefulWidget {
  const AdultsModalWidget({super.key});

  @override
  State<AdultsModalWidget> createState() => _AdultsModalWidgetState();
}

var adultTopModal = [
  {'image': 'assets/images/18.png', 'teeth_no': '18'},
  {'image': 'assets/images/17.png', 'teeth_no': '17'},
  {'image': 'assets/images/16.png', 'teeth_no': '16'},
  {'image': 'assets/images/15.png', 'teeth_no': '15'},
  {'image': 'assets/images/14.png', 'teeth_no': '14'},
  {'image': 'assets/images/13.png', 'teeth_no': '13'},
  {'image': 'assets/images/12.png', 'teeth_no': '12'},
  {'image': 'assets/images/11.png', 'teeth_no': '11'},
  {'image': 'assets/images/21.png', 'teeth_no': '21'},
  {'image': 'assets/images/22.png', 'teeth_no': '22'},
  {'image': 'assets/images/23.png', 'teeth_no': '23'},
  {'image': 'assets/images/24.png', 'teeth_no': '24'},
  {'image': 'assets/images/25.png', 'teeth_no': '25'},
  {'image': 'assets/images/26.png', 'teeth_no': '26'},
  {'image': 'assets/images/27.png', 'teeth_no': '27'},
  {'image': 'assets/images/28.png', 'teeth_no': '28'},
];
var adultBottomModal = [
  {'image': 'assets/images/48.png', 'teeth_no': '48'},
  {'image': 'assets/images/47.png', 'teeth_no': '47'},
  {'image': 'assets/images/46.png', 'teeth_no': '46'},
  {'image': 'assets/images/45.png', 'teeth_no': '45'},
  {'image': 'assets/images/44.png', 'teeth_no': '44'},
  {'image': 'assets/images/43.png', 'teeth_no': '43'},
  {'image': 'assets/images/42.png', 'teeth_no': '42'},
  {'image': 'assets/images/41.png', 'teeth_no': '41'},
  {'image': 'assets/images/31.png', 'teeth_no': '31'},
  {'image': 'assets/images/32.png', 'teeth_no': '32'},
  {'image': 'assets/images/33.png', 'teeth_no': '33'},
  {'image': 'assets/images/34.png', 'teeth_no': '34'},
  {'image': 'assets/images/35.png', 'teeth_no': '35'},
  {'image': 'assets/images/36.png', 'teeth_no': '36'},
  {'image': 'assets/images/37.png', 'teeth_no': '37'},
  {'image': 'assets/images/38.png', 'teeth_no': '38'},
];

class _AdultsModalWidgetState extends State<AdultsModalWidget> {
  List<SelectedTeethModal> selectedTeeth = [];
  final LocalStorage storage = new LocalStorage('nigdent_store');

  @override
  void initState() {
    // TODO: implement initState
    clearSelection();
    selectedTeeth.clear();
    super.initState();
  }

  var selectedModal = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      // height: screenHeight * 0.4,
      // height: screenHeight,
      //  color: Colors.yellow,
      child: Column(
        children: [
          Container(
              // height: screenHeight * 0.05,
              width: screenwidth,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  // alignment: Alignment.center,
                  width: screenwidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // color: Colors.red,
                        width: screenwidth * 0.7,
                        child: TextFormField(
                          minLines: 2,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: 'Chief Complaint',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * 0.01,
                      ),
                      Container(
                        width: screenwidth * 0.2,
                        child: ElevatedButton(
                            onPressed: () {
                              clearSelection();
                              this.setState(() {});
                            },
                            child: Text('Clear')),
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SingleChildScrollView(
              child: Container(
                // color: Colors.red,
            
                height: screenHeight * 0.342,
                // child: SingleChildScrollView(
                child: Container(
                  height: screenHeight * 0.30,
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.yellowAccent,
                        height: screenHeight * 0.16,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: adultTopModal.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Image.asset(
                                      adultTopModal[index]['image'].toString(),
                                      height: 30,
                                    ),
                                    topPositionWidget(index),
                                    Text(
                                        '${adultTopModal[index]['teeth_no'].toString()}'),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Container(
                        // color: Colors.red,
                        height: screenHeight * 0.16,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: adultBottomModal.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Text(
                                        '${adultBottomModal[index]['teeth_no'].toString()}'),
                                    bottomPositionWidget(index),
                                    Image.asset(
                                      adultBottomModal[index]['image'].toString(),
                                      height: 30,
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  topPositionWidget(index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('top');
              // print('${index}');
              if (adultTopModal[index]['top'] == 'select') {
                adultTopModal[index]['top'] = 'none';
              } else {
                adultTopModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no = adultTopModal[index]['teeth_no'].toString();

              if (adultTopModal[index]['top'] == 'select') {
                if (select_teeth_no == '18' ||
                    select_teeth_no == '17' ||
                    select_teeth_no == '16' ||
                    select_teeth_no == '15' ||
                    select_teeth_no == '14' ||
                    select_teeth_no == '24' ||
                    select_teeth_no == '25' ||
                    select_teeth_no == '26' ||
                    select_teeth_no == '27' ||
                    select_teeth_no == '28') {
                  position = 'B';
                } else {
                  position = 'C';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: adultTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = adultTopModal[index]['teeth_no'].toString();
                adultTopModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          adultTopModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'B' ||
                          selectedTeeth[i].position == 'C')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
               storage.setItem('selectedTeethPosition', selectedTeeth);
              this.setState(() {});
              print(selectedTeeth.length);
              //                  var selectTestMap = selectedTeeth.map((e) {
              //   return {
              //     'teeth_no': e.teeth,
              //     'position': e.position,
              //   };
              // }).toList();
              //  print(selectTestMap);
            },
            child: Image.asset('assets/images/modal.png',
                // height: adultTopModal[index]['top'] != null &&
                //         adultTopModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 12,
                color: adultTopModal[index]['top'] != null &&
                        adultTopModal[index]['top'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
          SizedBox(
              // height: screenHeight * 0.005,
              ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (adultTopModal[index]['left'] == 'select') {
                      adultTopModal[index]['left'] = 'none';
                    } else {
                      adultTopModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        adultTopModal[index]['teeth_no'].toString();

                    if (adultTopModal[index]['left'] == 'select') {
                      selectedTeeth.add(SelectedTeethModal(
                          position: 'D',
                          teeth: adultTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultTopModal[index]['teeth_no'].toString();
                      adultTopModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    storage.setItem('selectedTeethPosition', selectedTeeth);
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (adultTopModal[index]['left'] == 'select') {
                    //   adultTopModal[index]['left'] = 'none';
                    // } else {
                    //   adultTopModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: adultTopModal[index]['left'] != null &&
                      //         adultTopModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 12,
                      color: adultTopModal[index]['left'] != null &&
                              adultTopModal[index]['left'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26),
                ),
                // SizedBox(
                //   width: screenWidth * 0.005,
                // ),
                GestureDetector(
                  onTap: () {
                    if (adultTopModal[index]['center'] == 'select') {
                      adultTopModal[index]['center'] = 'none';
                    } else {
                      adultTopModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        adultTopModal[index]['teeth_no'].toString();

                    if (adultTopModal[index]['center'] == 'select') {
                      if (select_teeth_no == '18' ||
                          select_teeth_no == '17' ||
                          select_teeth_no == '16' ||
                          select_teeth_no == '15' ||
                          select_teeth_no == '14' ||
                          select_teeth_no == '24' ||
                          select_teeth_no == '25' ||
                          select_teeth_no == '26' ||
                          select_teeth_no == '27' ||
                          select_teeth_no == '28') {
                        position = 'O';
                      } else {
                        position = 'B';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth: adultTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultTopModal[index]['teeth_no'].toString();
                      adultTopModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultTopModal[index]['teeth_no'] &&
                            (selectedTeeth[i].position == 'O' ||
                                selectedTeeth[i].position == 'B')) {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                storage.setItem('selectedTeethPosition', selectedTeeth);

                    // print('center');
                    // if (adultTopModal[index]['center'] == 'select') {
                    //   adultTopModal[index]['center'] = 'none';
                    // } else {
                    //   adultTopModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: adultTopModal[index]['center'] != null &&
                    //         adultTopModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 15,
                    color: adultTopModal[index]['center'] != null &&
                            adultTopModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (adultTopModal[index]['right'] == 'select') {
                      adultTopModal[index]['right'] = 'none';
                    } else {
                      adultTopModal[index]['right'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        adultTopModal[index]['teeth_no'].toString();

                    if (adultTopModal[index]['right'] == 'select') {
                      // if (select_teeth_no == '18' ||
                      //     select_teeth_no == '17' ||
                      //     select_teeth_no == '16' ||
                      //     select_teeth_no == '15' ||
                      //     select_teeth_no == '14' ||
                      //     select_teeth_no == '24' ||
                      //     select_teeth_no == '25' ||
                      //     select_teeth_no == '26' ||
                      //     select_teeth_no == '27' ||
                      //     select_teeth_no == '28') {
                      //   position = 'O';
                      // } else {
                      //   position = 'B';
                      // }

                      selectedTeeth.add(SelectedTeethModal(
                          position: 'M',
                          teeth: adultTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultTopModal[index]['teeth_no'].toString();
                      adultTopModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                                    storage.setItem('selectedTeethPosition', selectedTeeth);

                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (adultTopModal[index]['right'] == 'select') {
                    //   adultTopModal[index]['right'] = 'none';
                    // } else {
                    //   adultTopModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: adultTopModal[index]['right'] != null &&
                      //         adultTopModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 12,
                      color: adultTopModal[index]['right'] != null &&
                              adultTopModal[index]['right'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26),
                ),
              ],
            ),
          ),
          SizedBox(
              // height: screenHeight * 0.005,
              ),
          GestureDetector(
            onTap: () {
              if (adultTopModal[index]['down'] == 'select') {
                adultTopModal[index]['down'] = 'none';
              } else {
                adultTopModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no = adultTopModal[index]['teeth_no'].toString();

              if (adultTopModal[index]['down'] == 'select') {
                if (select_teeth_no == '18' ||
                    select_teeth_no == '17' ||
                    select_teeth_no == '16' ||
                    select_teeth_no == '15' ||
                    select_teeth_no == '14' ||
                    select_teeth_no == '24' ||
                    select_teeth_no == '25' ||
                    select_teeth_no == '26' ||
                    select_teeth_no == '27' ||
                    select_teeth_no == '28') {
                  position = 'P';
                } else {
                  position = 'I';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: adultTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = adultTopModal[index]['teeth_no'].toString();
                adultTopModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          adultTopModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'P' ||
                          selectedTeeth[i].position == 'I')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
                              storage.setItem('selectedTeethPosition', selectedTeeth);

              this.setState(() {});
              print(selectedTeeth.length);
              // print('down');
              // if (adultTopModal[index]['down'] == 'select') {
              //   adultTopModal[index]['down'] = 'none';
              // } else {
              //   adultTopModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: adultTopModal[index]['down'] != null &&
                //         adultTopModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 12,
                color: adultTopModal[index]['down'] != null &&
                        adultTopModal[index]['down'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
          Container(
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }

  bottomPositionWidget(index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (adultBottomModal[index]['top'] == 'select') {
                adultBottomModal[index]['top'] = 'none';
              } else {
                adultBottomModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no =
                  adultBottomModal[index]['teeth_no'].toString();

              if (adultBottomModal[index]['top'] == 'select') {
                if (select_teeth_no == '33' ||
                    select_teeth_no == '32' ||
                    select_teeth_no == '31' ||
                    select_teeth_no == '41' ||
                    select_teeth_no == '42' ||
                    select_teeth_no == '43') {
                  position = 'I';
                } else {
                  position = 'L';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: adultBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = adultBottomModal[index]['teeth_no'].toString();
                adultBottomModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          adultBottomModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'L' ||
                          selectedTeeth[i].position == 'I')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
                              storage.setItem('selectedTeethPosition', selectedTeeth);

              this.setState(() {});
              print(selectedTeeth.length);
              // print('top');
              // print('${index}');
              // if (adultBottomModal[index]['top'] == 'select') {
              //   adultBottomModal[index]['top'] = 'none';
              // } else {
              //   adultBottomModal[index]['top'] = 'select';
              // }
              // this.setState(() {});
            },
            child: Image.asset('assets/images/modal.png',
                // height: adultBottomModal[index]['top'] != null &&
                //         adultBottomModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 12,
                color: adultBottomModal[index]['top'] != null &&
                        adultBottomModal[index]['top'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
          SizedBox(
              // height: screenHeight * 0.005,
              ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (adultBottomModal[index]['left'] == 'select') {
                      adultBottomModal[index]['left'] = 'none';
                    } else {
                      adultBottomModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        adultBottomModal[index]['teeth_no'].toString();

                    if (adultBottomModal[index]['left'] == 'select') {
                      // if (select_teeth_no == '33' ||
                      //     select_teeth_no == '32' ||
                      //     select_teeth_no == '31' ||
                      //     select_teeth_no == '41' ||
                      //     select_teeth_no == '42' ||
                      //     select_teeth_no == '43') {
                      //   position = 'I';
                      // } else {
                      //   position = 'L';
                      // }

                      selectedTeeth.add(SelectedTeethModal(
                          position: 'D',
                          teeth:
                              adultBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultBottomModal[index]['teeth_no'].toString();
                      adultBottomModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                                    storage.setItem('selectedTeethPosition', selectedTeeth);

                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (adultBottomModal[index]['left'] == 'select') {
                    //   adultBottomModal[index]['left'] = 'none';
                    // } else {
                    //   adultBottomModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: adultBottomModal[index]['left'] != null &&
                      //         adultBottomModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 12,
                      color: adultBottomModal[index]['left'] != null &&
                              adultBottomModal[index]['left'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26
                      // color: val.toSet().contains(index) && val[index]['up'] == 'select' ? Colors.blueAccent:Colors.yellow,
                      ),
                ),
                // SizedBox(
                //   width: screenWidth * 0.005,
                // ),
                GestureDetector(
                  onTap: () {
                    if (adultBottomModal[index]['center'] == 'select') {
                      adultBottomModal[index]['center'] = 'none';
                    } else {
                      adultBottomModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        adultBottomModal[index]['teeth_no'].toString();

                    if (adultBottomModal[index]['center'] == 'select') {
                      if (select_teeth_no == '33' ||
                          select_teeth_no == '32' ||
                          select_teeth_no == '31' ||
                          select_teeth_no == '41' ||
                          select_teeth_no == '42' ||
                          select_teeth_no == '43') {
                        position = 'B';
                      } else {
                        position = 'O';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth:
                              adultBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultBottomModal[index]['teeth_no'].toString();
                      adultBottomModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultBottomModal[index]['teeth_no'] &&
                            (selectedTeeth[i].position == 'B' ||
                                selectedTeeth[i].position == 'O')) {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                                    storage.setItem('selectedTeethPosition', selectedTeeth);

                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('center');
                    // if (adultBottomModal[index]['center'] == 'select') {
                    //   adultBottomModal[index]['center'] = 'none';
                    // } else {
                    //   adultBottomModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: adultBottomModal[index]['center'] != null &&
                    //         adultBottomModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 15,
                    color: adultBottomModal[index]['center'] != null &&
                            adultBottomModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (adultBottomModal[index]['right'] == 'select') {
                      adultBottomModal[index]['right'] = 'none';
                    } else {
                      adultBottomModal[index]['right'] = 'select';
                    }
                    // var position;
                    // var select_teeth_no =
                    //     adultBottomModal[index]['teeth_no'].toString();

                    if (adultBottomModal[index]['right'] == 'select') {
                      // if (select_teeth_no == '33' ||
                      //     select_teeth_no == '32' ||
                      //     select_teeth_no == '31' ||
                      //     select_teeth_no == '41' ||
                      //     select_teeth_no == '42' ||
                      //     select_teeth_no == '43') {
                      //   position = 'B';
                      // } else {
                      //   position = 'O';
                      // }

                      selectedTeeth.add(SelectedTeethModal(
                          position: 'M',
                          teeth:
                              adultBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          adultBottomModal[index]['teeth_no'].toString();
                      adultBottomModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                adultBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                                    storage.setItem('selectedTeethPosition', selectedTeeth);

                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (adultBottomModal[index]['right'] == 'select') {
                    //   adultBottomModal[index]['right'] = 'none';
                    // } else {
                    //   adultBottomModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: adultBottomModal[index]['right'] != null &&
                      //         adultBottomModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 12,
                      color: adultBottomModal[index]['right'] != null &&
                              adultBottomModal[index]['right'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26),
                ),
              ],
            ),
          ),
          SizedBox(
              // height: screenHeight * 0.005,
              ),
          GestureDetector(
            onTap: () {
              if (adultBottomModal[index]['down'] == 'select') {
                adultBottomModal[index]['down'] = 'none';
              } else {
                adultBottomModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no =
                  adultBottomModal[index]['teeth_no'].toString();

              if (adultBottomModal[index]['down'] == 'select') {
                if (select_teeth_no == '33' ||
                    select_teeth_no == '32' ||
                    select_teeth_no == '31' ||
                    select_teeth_no == '41' ||
                    select_teeth_no == '42' ||
                    select_teeth_no == '43') {
                  position = 'C';
                } else {
                  position = 'B';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: adultBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = adultBottomModal[index]['teeth_no'].toString();
                adultBottomModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          adultBottomModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'B' ||
                          selectedTeeth[i].position == 'C')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
                              storage.setItem('selectedTeethPosition', selectedTeeth);

              this.setState(() {});
              print(selectedTeeth.length);
              // print('down');
              // if (adultBottomModal[index]['down'] == 'select') {
              //   adultBottomModal[index]['down'] = 'none';
              // } else {
              //   adultBottomModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: adultBottomModal[index]['down'] != null &&
                //         adultBottomModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 12,
                color: adultBottomModal[index]['down'] != null &&
                        adultBottomModal[index]['down'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
        ],
      ),
    );
  }

  clearSelection() {
    adultTopModal = [
      {'image': 'assets/images/18.png', 'teeth_no': '18'},
      {'image': 'assets/images/17.png', 'teeth_no': '17'},
      {'image': 'assets/images/16.png', 'teeth_no': '16'},
      {'image': 'assets/images/15.png', 'teeth_no': '15'},
      {'image': 'assets/images/14.png', 'teeth_no': '14'},
      {'image': 'assets/images/13.png', 'teeth_no': '13'},
      {'image': 'assets/images/12.png', 'teeth_no': '12'},
      {'image': 'assets/images/11.png', 'teeth_no': '11'},
      {'image': 'assets/images/21.png', 'teeth_no': '21'},
      {'image': 'assets/images/22.png', 'teeth_no': '22'},
      {'image': 'assets/images/23.png', 'teeth_no': '23'},
      {'image': 'assets/images/24.png', 'teeth_no': '24'},
      {'image': 'assets/images/25.png', 'teeth_no': '25'},
      {'image': 'assets/images/26.png', 'teeth_no': '26'},
      {'image': 'assets/images/27.png', 'teeth_no': '27'},
      {'image': 'assets/images/28.png', 'teeth_no': '28'},
    ];
    adultBottomModal = [
      {'image': 'assets/images/48.png', 'teeth_no': '48'},
      {'image': 'assets/images/47.png', 'teeth_no': '47'},
      {'image': 'assets/images/46.png', 'teeth_no': '46'},
      {'image': 'assets/images/45.png', 'teeth_no': '45'},
      {'image': 'assets/images/44.png', 'teeth_no': '44'},
      {'image': 'assets/images/43.png', 'teeth_no': '43'},
      {'image': 'assets/images/42.png', 'teeth_no': '42'},
      {'image': 'assets/images/41.png', 'teeth_no': '41'},
      {'image': 'assets/images/31.png', 'teeth_no': '31'},
      {'image': 'assets/images/32.png', 'teeth_no': '32'},
      {'image': 'assets/images/33.png', 'teeth_no': '33'},
      {'image': 'assets/images/34.png', 'teeth_no': '34'},
      {'image': 'assets/images/35.png', 'teeth_no': '35'},
      {'image': 'assets/images/36.png', 'teeth_no': '36'},
      {'image': 'assets/images/37.png', 'teeth_no': '37'},
      {'image': 'assets/images/38.png', 'teeth_no': '38'},
    ];
    selectedTeeth.clear();
    this.setState(() {});
    print(selectedTeeth.length);
  }
}
