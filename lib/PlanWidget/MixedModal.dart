import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'modal/selectedteethmodal.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

class MixedModalWidget extends StatefulWidget {
  const MixedModalWidget({super.key});

  @override
  State<MixedModalWidget> createState() => _MixedModalWidgetState();
}

var mixedTopModal = [
  {'image': 'assets/images/16.png', 'teeth_no': '16'},
  {'image': 'assets/images/16.png', 'teeth_no': '55'},
  {'image': 'assets/images/17.png', 'teeth_no': '54'},
  {'image': 'assets/images/13.png', 'teeth_no': '53'},
  {'image': 'assets/images/12.png', 'teeth_no': '12'},
  {'image': 'assets/images/11.png', 'teeth_no': '11'},
  {'image': 'assets/images/21.png', 'teeth_no': '21'},
  {'image': 'assets/images/22.png', 'teeth_no': '22'},
  {'image': 'assets/images/23.png', 'teeth_no': '63'},
  {'image': 'assets/images/27.png', 'teeth_no': '64'},
  {'image': 'assets/images/26.png', 'teeth_no': '65'},
  {'image': 'assets/images/26.png', 'teeth_no': '26'},
];
var mixedBottomModal = [
  {'image': 'assets/images/46.png', 'teeth_no': '46'},
  {'image': 'assets/images/46.png', 'teeth_no': '85'},
  {'image': 'assets/images/47.png', 'teeth_no': '84'},
  {'image': 'assets/images/43.png', 'teeth_no': '83'},
  {'image': 'assets/images/42.png', 'teeth_no': '42'},
  {'image': 'assets/images/41.png', 'teeth_no': '41'},
  {'image': 'assets/images/31.png', 'teeth_no': '31'},
  {'image': 'assets/images/32.png', 'teeth_no': '32'},
  {'image': 'assets/images/33.png', 'teeth_no': '73'},
  {'image': 'assets/images/37.png', 'teeth_no': '74'},
  {'image': 'assets/images/36.png', 'teeth_no': '75'},
  {'image': 'assets/images/36.png', 'teeth_no': '36'},
];

class _MixedModalWidgetState extends State<MixedModalWidget> {
  List<SelectedTeethModal> selectedTeeth = [];

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
      // height: screenHeight * 0.5,
      //  color: Colors.yellow,
      child: Column(
        children: [
          Container(
              // height: screenHeight * 0.05,
              width: screenwidth,
              child:Padding(
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
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),
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
            child: Container(
              // color: Colors.red,

              height: screenHeight * 0.4,
              // child: SingleChildScrollView(
              child: Container(
                height: screenHeight * 0.4,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.yellowAccent,
                      height: screenHeight * 0.18,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: mixedTopModal.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Image.asset(
                                    mixedTopModal[index]['image'].toString(),
                                    height: 30,
                                  ),
                                  topPositionWidget(index),
                                  Text(
                                      '${mixedTopModal[index]['teeth_no'].toString()}'),
                                ],
                              );
                            }),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Container(
                      // color: Colors.green,
                      height: screenHeight * 0.18,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: mixedBottomModal.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                      '${mixedBottomModal[index]['teeth_no'].toString()}'),
                                  bottomPositionWidget(index),
                                  Image.asset(
                                    mixedBottomModal[index]['image'].toString(),
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
              if (mixedTopModal[index]['top'] == 'select') {
                mixedTopModal[index]['top'] = 'none';
              } else {
                mixedTopModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no = mixedTopModal[index]['teeth_no'].toString();

              if (mixedTopModal[index]['top'] == 'select') {
                if (select_teeth_no == '16' ||
                    select_teeth_no == '54' ||
                    select_teeth_no == '55' ||
                    select_teeth_no == '64' ||
                    select_teeth_no == '65' ||
                    select_teeth_no == '26') {
                  position = 'B';
                } else {
                  position = 'C';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: mixedTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = mixedTopModal[index]['teeth_no'].toString();
                mixedTopModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          mixedTopModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'B' ||
                          selectedTeeth[i].position == 'C')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
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
                // height: mixedTopModal[index]['top'] != null &&
                //         mixedTopModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: mixedTopModal[index]['top'] != null &&
                        mixedTopModal[index]['top'] == 'select'
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
                    if (mixedTopModal[index]['left'] == 'select') {
                      mixedTopModal[index]['left'] = 'none';
                    } else {
                      mixedTopModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        mixedTopModal[index]['teeth_no'].toString();

                    if (mixedTopModal[index]['left'] == 'select') {
                      selectedTeeth.add(SelectedTeethModal(
                          position: 'D',
                          teeth: mixedTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedTopModal[index]['teeth_no'].toString();
                      mixedTopModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (mixedTopModal[index]['left'] == 'select') {
                    //   mixedTopModal[index]['left'] = 'none';
                    // } else {
                    //   mixedTopModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: mixedTopModal[index]['left'] != null &&
                      //         mixedTopModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: mixedTopModal[index]['left'] != null &&
                              mixedTopModal[index]['left'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26),
                ),
                // SizedBox(
                //   width: screenWidth * 0.005,
                // ),
                GestureDetector(
                  onTap: () {
                    if (mixedTopModal[index]['center'] == 'select') {
                      mixedTopModal[index]['center'] = 'none';
                    } else {
                      mixedTopModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        mixedTopModal[index]['teeth_no'].toString();

                    if (mixedTopModal[index]['center'] == 'select') {
                      if (select_teeth_no == '16' ||
                          select_teeth_no == '54' ||
                          select_teeth_no == '55' ||
                          select_teeth_no == '64' ||
                          select_teeth_no == '65' ||
                          select_teeth_no == '26') {
                        position = 'O';
                      } else {
                        position = 'B';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth: mixedTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedTopModal[index]['teeth_no'].toString();
                      mixedTopModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedTopModal[index]['teeth_no'] &&
                            (selectedTeeth[i].position == 'O' ||
                                selectedTeeth[i].position == 'B')) {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);

                    // print('center');
                    // if (mixedTopModal[index]['center'] == 'select') {
                    //   mixedTopModal[index]['center'] = 'none';
                    // } else {
                    //   mixedTopModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: mixedTopModal[index]['center'] != null &&
                    //         mixedTopModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 18,
                    color: mixedTopModal[index]['center'] != null &&
                            mixedTopModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (mixedTopModal[index]['right'] == 'select') {
                      mixedTopModal[index]['right'] = 'none';
                    } else {
                      mixedTopModal[index]['right'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        mixedTopModal[index]['teeth_no'].toString();

                    if (mixedTopModal[index]['right'] == 'select') {
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
                          teeth: mixedTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedTopModal[index]['teeth_no'].toString();
                      mixedTopModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (mixedTopModal[index]['right'] == 'select') {
                    //   mixedTopModal[index]['right'] = 'none';
                    // } else {
                    //   mixedTopModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: mixedTopModal[index]['right'] != null &&
                      //         mixedTopModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: mixedTopModal[index]['right'] != null &&
                              mixedTopModal[index]['right'] == 'select'
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
              if (mixedTopModal[index]['down'] == 'select') {
                mixedTopModal[index]['down'] = 'none';
              } else {
                mixedTopModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no = mixedTopModal[index]['teeth_no'].toString();

              if (mixedTopModal[index]['down'] == 'select') {
                if (select_teeth_no == '16' ||
                    select_teeth_no == '54' ||
                    select_teeth_no == '55' ||
                    select_teeth_no == '64' ||
                    select_teeth_no == '65' ||
                    select_teeth_no == '26') {
                  position = 'P';
                } else {
                  position = 'I';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: mixedTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = mixedTopModal[index]['teeth_no'].toString();
                mixedTopModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          mixedTopModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'P' ||
                          selectedTeeth[i].position == 'I')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
              this.setState(() {});
              print(selectedTeeth.length);
              // print('down');
              // if (mixedTopModal[index]['down'] == 'select') {
              //   mixedTopModal[index]['down'] = 'none';
              // } else {
              //   mixedTopModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: mixedTopModal[index]['down'] != null &&
                //         mixedTopModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: mixedTopModal[index]['down'] != null &&
                        mixedTopModal[index]['down'] == 'select'
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
              if (mixedBottomModal[index]['top'] == 'select') {
                mixedBottomModal[index]['top'] = 'none';
              } else {
                mixedBottomModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no =
                  mixedBottomModal[index]['teeth_no'].toString();

              if (mixedBottomModal[index]['top'] == 'select') {
                if (select_teeth_no == '46' ||
                    select_teeth_no == '84' ||
                    select_teeth_no == '85' ||
                    select_teeth_no == '36' ||
                    select_teeth_no == '74' ||
                    select_teeth_no == '75') {
                  position = 'L';
                } else {
                  position = 'I';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: mixedBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = mixedBottomModal[index]['teeth_no'].toString();
                mixedBottomModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          mixedBottomModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'L' ||
                          selectedTeeth[i].position == 'I')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
              this.setState(() {});
              print(selectedTeeth.length);
              // print('top');
              // print('${index}');
              // if (mixedBottomModal[index]['top'] == 'select') {
              //   mixedBottomModal[index]['top'] = 'none';
              // } else {
              //   mixedBottomModal[index]['top'] = 'select';
              // }
              // this.setState(() {});
            },
            child: Image.asset('assets/images/modal.png',
                // height: mixedBottomModal[index]['top'] != null &&
                //         mixedBottomModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: mixedBottomModal[index]['top'] != null &&
                        mixedBottomModal[index]['top'] == 'select'
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
                    if (mixedBottomModal[index]['left'] == 'select') {
                      mixedBottomModal[index]['left'] = 'none';
                    } else {
                      mixedBottomModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        mixedBottomModal[index]['teeth_no'].toString();

                    if (mixedBottomModal[index]['left'] == 'select') {
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
                              mixedBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedBottomModal[index]['teeth_no'].toString();
                      mixedBottomModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (mixedBottomModal[index]['left'] == 'select') {
                    //   mixedBottomModal[index]['left'] = 'none';
                    // } else {
                    //   mixedBottomModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: mixedBottomModal[index]['left'] != null &&
                      //         mixedBottomModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: mixedBottomModal[index]['left'] != null &&
                              mixedBottomModal[index]['left'] == 'select'
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
                    if (mixedBottomModal[index]['center'] == 'select') {
                      mixedBottomModal[index]['center'] = 'none';
                    } else {
                      mixedBottomModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        mixedBottomModal[index]['teeth_no'].toString();

                    if (mixedBottomModal[index]['center'] == 'select') {
                      if (select_teeth_no == '46' ||
                          select_teeth_no == '84' ||
                          select_teeth_no == '85' ||
                          select_teeth_no == '36' ||
                          select_teeth_no == '74' ||
                          select_teeth_no == '75') {
                        position = 'O';
                      } else {
                        position = 'B';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth:
                              mixedBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedBottomModal[index]['teeth_no'].toString();
                      mixedBottomModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedBottomModal[index]['teeth_no'] &&
                            (selectedTeeth[i].position == 'B' ||
                                selectedTeeth[i].position == 'O')) {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('center');
                    // if (mixedBottomModal[index]['center'] == 'select') {
                    //   mixedBottomModal[index]['center'] = 'none';
                    // } else {
                    //   mixedBottomModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: mixedBottomModal[index]['center'] != null &&
                    //         mixedBottomModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 18,
                    color: mixedBottomModal[index]['center'] != null &&
                            mixedBottomModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (mixedBottomModal[index]['right'] == 'select') {
                      mixedBottomModal[index]['right'] = 'none';
                    } else {
                      mixedBottomModal[index]['right'] = 'select';
                    }
                    // var position;
                    // var select_teeth_no =
                    //     mixedBottomModal[index]['teeth_no'].toString();

                    if (mixedBottomModal[index]['right'] == 'select') {
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
                              mixedBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          mixedBottomModal[index]['teeth_no'].toString();
                      mixedBottomModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                mixedBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (mixedBottomModal[index]['right'] == 'select') {
                    //   mixedBottomModal[index]['right'] = 'none';
                    // } else {
                    //   mixedBottomModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: mixedBottomModal[index]['right'] != null &&
                      //         mixedBottomModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: mixedBottomModal[index]['right'] != null &&
                              mixedBottomModal[index]['right'] == 'select'
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
              if (mixedBottomModal[index]['down'] == 'select') {
                mixedBottomModal[index]['down'] = 'none';
              } else {
                mixedBottomModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no =
                  mixedBottomModal[index]['teeth_no'].toString();

              if (mixedBottomModal[index]['down'] == 'select') {
                if (select_teeth_no == '46' ||
                    select_teeth_no == '84' ||
                    select_teeth_no == '85' ||
                    select_teeth_no == '36' ||
                    select_teeth_no == '74' ||
                    select_teeth_no == '75') {
                  position = 'B';
                } else {
                  position = 'C';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: mixedBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = mixedBottomModal[index]['teeth_no'].toString();
                mixedBottomModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          mixedBottomModal[index]['teeth_no'] &&
                      (selectedTeeth[i].position == 'B' ||
                          selectedTeeth[i].position == 'C')) {
                    delete_index = i;
                  }
                }
                selectedTeeth.removeAt(delete_index);
              }
              this.setState(() {});
              print(selectedTeeth.length);
              // print('down');
              // if (mixedBottomModal[index]['down'] == 'select') {
              //   mixedBottomModal[index]['down'] = 'none';
              // } else {
              //   mixedBottomModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: mixedBottomModal[index]['down'] != null &&
                //         mixedBottomModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: mixedBottomModal[index]['down'] != null &&
                        mixedBottomModal[index]['down'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
        ],
      ),
    );
  }

  clearSelection() {
    mixedTopModal = [
      {'image': 'assets/images/16.png', 'teeth_no': '16'},
      {'image': 'assets/images/16.png', 'teeth_no': '55'},
      {'image': 'assets/images/17.png', 'teeth_no': '54'},
      {'image': 'assets/images/13.png', 'teeth_no': '53'},
      {'image': 'assets/images/12.png', 'teeth_no': '12'},
      {'image': 'assets/images/11.png', 'teeth_no': '11'},
      {'image': 'assets/images/21.png', 'teeth_no': '21'},
      {'image': 'assets/images/22.png', 'teeth_no': '22'},
      {'image': 'assets/images/23.png', 'teeth_no': '63'},
      {'image': 'assets/images/27.png', 'teeth_no': '64'},
      {'image': 'assets/images/26.png', 'teeth_no': '65'},
      {'image': 'assets/images/26.png', 'teeth_no': '26'},
    ];
    mixedBottomModal = [
      {'image': 'assets/images/46.png', 'teeth_no': '46'},
      {'image': 'assets/images/46.png', 'teeth_no': '85'},
      {'image': 'assets/images/47.png', 'teeth_no': '84'},
      {'image': 'assets/images/43.png', 'teeth_no': '83'},
      {'image': 'assets/images/42.png', 'teeth_no': '42'},
      {'image': 'assets/images/41.png', 'teeth_no': '41'},
      {'image': 'assets/images/31.png', 'teeth_no': '31'},
      {'image': 'assets/images/32.png', 'teeth_no': '32'},
      {'image': 'assets/images/33.png', 'teeth_no': '73'},
      {'image': 'assets/images/37.png', 'teeth_no': '74'},
      {'image': 'assets/images/36.png', 'teeth_no': '75'},
      {'image': 'assets/images/36.png', 'teeth_no': '36'},
    ];
    selectedTeeth.clear();
    this.setState(() {});
    print(selectedTeeth.length);
  }
}
