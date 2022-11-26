import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'modal/selectedteethmodal.dart';

class PeadoModalWidget extends StatefulWidget {
  const PeadoModalWidget({super.key});

  @override
  State<PeadoModalWidget> createState() => _PeadoModalWidgetState();
}

var peadoTopModal = [
  {'image': 'assets/images/16.png', 'teeth_no': '55'},
  {'image': 'assets/images/17.png', 'teeth_no': '54'},
  {'image': 'assets/images/13.png', 'teeth_no': '53'},
  {'image': 'assets/images/12.png', 'teeth_no': '52'},
  {'image': 'assets/images/11.png', 'teeth_no': '51'},
  {'image': 'assets/images/21.png', 'teeth_no': '61'},
  {'image': 'assets/images/22.png', 'teeth_no': '62'},
  {'image': 'assets/images/23.png', 'teeth_no': '63'},
  {'image': 'assets/images/27.png', 'teeth_no': '64'},
  {'image': 'assets/images/26.png', 'teeth_no': '65'},
];
var peadoBottomModal = [
  {'image': 'assets/images/46.png', 'teeth_no': '85'},
  {'image': 'assets/images/47.png', 'teeth_no': '84'},
  {'image': 'assets/images/43.png', 'teeth_no': '83'},
  {'image': 'assets/images/42.png', 'teeth_no': '82'},
  {'image': 'assets/images/41.png', 'teeth_no': '81'},
  {'image': 'assets/images/31.png', 'teeth_no': '71'},
  {'image': 'assets/images/32.png', 'teeth_no': '72'},
  {'image': 'assets/images/33.png', 'teeth_no': '73'},
  {'image': 'assets/images/37.png', 'teeth_no': '74'},
  {'image': 'assets/images/36.png', 'teeth_no': '75'},
];

class _PeadoModalWidgetState extends State<PeadoModalWidget> {
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
      height: screenHeight * 0.5,
      //  color: Colors.yellow,
      child: Column(
        children: [
          Container(
              height: screenHeight * 0.05,
              width: screenwidth,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        clearSelection();
                        this.setState(() {});
                      },
                      child: Text('Clear')),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              // color: Colors.red,

              height: screenHeight * 0.44,
              // child: SingleChildScrollView(
              child: Container(
                height: screenHeight * 0.30,
                child: Column(
                  children: [
                    Container(
                      // color: Colors.yellowAccent,
                      height: screenHeight * 0.18,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: peadoTopModal.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Image.asset(
                                    peadoTopModal[index]['image'].toString(),
                                    height: 30,
                                  ),
                                  topPositionWidget(index),
                                  Text(
                                      '${peadoTopModal[index]['teeth_no'].toString()}'),
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
                            itemCount: peadoBottomModal.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                      '${peadoBottomModal[index]['teeth_no'].toString()}'),
                                  bottomPositionWidget(index),
                                  Image.asset(
                                    peadoBottomModal[index]['image'].toString(),
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
              if (peadoTopModal[index]['top'] == 'select') {
                peadoTopModal[index]['top'] = 'none';
              } else {
                peadoTopModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no = peadoTopModal[index]['teeth_no'].toString();

              if (peadoTopModal[index]['top'] == 'select') {
                if (select_teeth_no == '54' ||
                    select_teeth_no == '55' ||
                    select_teeth_no == '64' ||
                    select_teeth_no == '65' ) {
                  position = 'B';
                } else {
                  position = 'C';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: peadoTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = peadoTopModal[index]['teeth_no'].toString();
                peadoTopModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          peadoTopModal[index]['teeth_no'] &&
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
                // height: peadoTopModal[index]['top'] != null &&
                //         peadoTopModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: peadoTopModal[index]['top'] != null &&
                        peadoTopModal[index]['top'] == 'select'
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
                    if (peadoTopModal[index]['left'] == 'select') {
                      peadoTopModal[index]['left'] = 'none';
                    } else {
                      peadoTopModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        peadoTopModal[index]['teeth_no'].toString();

                    if (peadoTopModal[index]['left'] == 'select') {
                      selectedTeeth.add(SelectedTeethModal(
                          position: 'D',
                          teeth: peadoTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoTopModal[index]['teeth_no'].toString();
                      peadoTopModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (peadoTopModal[index]['left'] == 'select') {
                    //   peadoTopModal[index]['left'] = 'none';
                    // } else {
                    //   peadoTopModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: peadoTopModal[index]['left'] != null &&
                      //         peadoTopModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: peadoTopModal[index]['left'] != null &&
                              peadoTopModal[index]['left'] == 'select'
                          ? Colors.blueAccent
                          : Colors.black26),
                ),
                // SizedBox(
                //   width: screenWidth * 0.005,
                // ),
                GestureDetector(
                  onTap: () {
                    if (peadoTopModal[index]['center'] == 'select') {
                      peadoTopModal[index]['center'] = 'none';
                    } else {
                      peadoTopModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        peadoTopModal[index]['teeth_no'].toString();

                    if (peadoTopModal[index]['center'] == 'select') {
                      if (select_teeth_no == '54' ||
                          select_teeth_no == '55' ||
                          select_teeth_no == '64' ||
                          select_teeth_no == '65') {
                        position = 'O';
                      } else {
                        position = 'B';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth: peadoTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoTopModal[index]['teeth_no'].toString();
                      peadoTopModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoTopModal[index]['teeth_no'] &&
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
                    // if (peadoTopModal[index]['center'] == 'select') {
                    //   peadoTopModal[index]['center'] = 'none';
                    // } else {
                    //   peadoTopModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: peadoTopModal[index]['center'] != null &&
                    //         peadoTopModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 18,
                    color: peadoTopModal[index]['center'] != null &&
                            peadoTopModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (peadoTopModal[index]['right'] == 'select') {
                      peadoTopModal[index]['right'] = 'none';
                    } else {
                      peadoTopModal[index]['right'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        peadoTopModal[index]['teeth_no'].toString();

                    if (peadoTopModal[index]['right'] == 'select') {
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
                          teeth: peadoTopModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoTopModal[index]['teeth_no'].toString();
                      peadoTopModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoTopModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (peadoTopModal[index]['right'] == 'select') {
                    //   peadoTopModal[index]['right'] = 'none';
                    // } else {
                    //   peadoTopModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: peadoTopModal[index]['right'] != null &&
                      //         peadoTopModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: peadoTopModal[index]['right'] != null &&
                              peadoTopModal[index]['right'] == 'select'
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
              if (peadoTopModal[index]['down'] == 'select') {
                peadoTopModal[index]['down'] = 'none';
              } else {
                peadoTopModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no = peadoTopModal[index]['teeth_no'].toString();

              if (peadoTopModal[index]['down'] == 'select') {
                if (select_teeth_no == '54' ||
                    select_teeth_no == '55' ||
                    select_teeth_no == '64' ||
                    select_teeth_no == '65' ) {
                  position = 'P';
                } else {
                  position = 'I';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: peadoTopModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = peadoTopModal[index]['teeth_no'].toString();
                peadoTopModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          peadoTopModal[index]['teeth_no'] &&
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
              // if (peadoTopModal[index]['down'] == 'select') {
              //   peadoTopModal[index]['down'] = 'none';
              // } else {
              //   peadoTopModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: peadoTopModal[index]['down'] != null &&
                //         peadoTopModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: peadoTopModal[index]['down'] != null &&
                        peadoTopModal[index]['down'] == 'select'
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
              if (peadoBottomModal[index]['top'] == 'select') {
                peadoBottomModal[index]['top'] = 'none';
              } else {
                peadoBottomModal[index]['top'] = 'select';
              }
              var position;
              var select_teeth_no =
                  peadoBottomModal[index]['teeth_no'].toString();

              if (peadoBottomModal[index]['top'] == 'select') {
                if (select_teeth_no == '74' ||
                    select_teeth_no == '75' ||
                    select_teeth_no == '84' ||
                    select_teeth_no == '85' ) {
                  position = 'L';
                } else {
                  position = 'I';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: peadoBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = peadoBottomModal[index]['teeth_no'].toString();
                peadoBottomModal[index]['top'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          peadoBottomModal[index]['teeth_no'] &&
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
              // if (peadoBottomModal[index]['top'] == 'select') {
              //   peadoBottomModal[index]['top'] = 'none';
              // } else {
              //   peadoBottomModal[index]['top'] = 'select';
              // }
              // this.setState(() {});
            },
            child: Image.asset('assets/images/modal.png',
                // height: peadoBottomModal[index]['top'] != null &&
                //         peadoBottomModal[index]['top'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: peadoBottomModal[index]['top'] != null &&
                        peadoBottomModal[index]['top'] == 'select'
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
                    if (peadoBottomModal[index]['left'] == 'select') {
                      peadoBottomModal[index]['left'] = 'none';
                    } else {
                      peadoBottomModal[index]['left'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        peadoBottomModal[index]['teeth_no'].toString();

                    if (peadoBottomModal[index]['left'] == 'select') {
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
                              peadoBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoBottomModal[index]['teeth_no'].toString();
                      peadoBottomModal[index]['left'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'D') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('left');
                    // if (peadoBottomModal[index]['left'] == 'select') {
                    //   peadoBottomModal[index]['left'] = 'none';
                    // } else {
                    //   peadoBottomModal[index]['left'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/left.png',
                      // height: peadoBottomModal[index]['left'] != null &&
                      //         peadoBottomModal[index]['left'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: peadoBottomModal[index]['left'] != null &&
                              peadoBottomModal[index]['left'] == 'select'
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
                    if (peadoBottomModal[index]['center'] == 'select') {
                      peadoBottomModal[index]['center'] = 'none';
                    } else {
                      peadoBottomModal[index]['center'] = 'select';
                    }
                    var position;
                    var select_teeth_no =
                        peadoBottomModal[index]['teeth_no'].toString();

                    if (peadoBottomModal[index]['center'] == 'select') {
                      if (select_teeth_no == '74' ||
                          select_teeth_no == '75' ||
                          select_teeth_no == '84' ||
                          select_teeth_no == '85') {
                        position = 'O';
                      } else {
                        position = 'B';
                      }

                      selectedTeeth.add(SelectedTeethModal(
                          position: position,
                          teeth:
                              peadoBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoBottomModal[index]['teeth_no'].toString();
                      peadoBottomModal[index]['center'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoBottomModal[index]['teeth_no'] &&
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
                    // if (peadoBottomModal[index]['center'] == 'select') {
                    //   peadoBottomModal[index]['center'] = 'none';
                    // } else {
                    //   peadoBottomModal[index]['center'] = 'select';
                    // }
                    // this.setState(() {});
                  },
                  child: Icon(
                    Icons.circle,
                    // size: peadoBottomModal[index]['center'] != null &&
                    //         peadoBottomModal[index]['center'] == 'select'
                    //     ? 20
                    //     : 18,
                    size: 18,
                    color: peadoBottomModal[index]['center'] != null &&
                            peadoBottomModal[index]['center'] == 'select'
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
                SizedBox(
                    // width: screenWidth * 0.005,
                    ),
                GestureDetector(
                  onTap: () {
                    if (peadoBottomModal[index]['right'] == 'select') {
                      peadoBottomModal[index]['right'] = 'none';
                    } else {
                      peadoBottomModal[index]['right'] = 'select';
                    }
                    // var position;
                    // var select_teeth_no =
                    //     peadoBottomModal[index]['teeth_no'].toString();

                    if (peadoBottomModal[index]['right'] == 'select') {
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
                              peadoBottomModal[index]['teeth_no'].toString()));
                    } else {
                      var teeth_no =
                          peadoBottomModal[index]['teeth_no'].toString();
                      peadoBottomModal[index]['right'] = 'none';
                      int delete_index = 0;
                      for (var i = 0; i < selectedTeeth.length; i++) {
                        if (selectedTeeth[i].teeth ==
                                peadoBottomModal[index]['teeth_no'] &&
                            selectedTeeth[i].position == 'M') {
                          delete_index = i;
                        }
                      }
                      selectedTeeth.removeAt(delete_index);
                    }
                    this.setState(() {});
                    print(selectedTeeth.length);
                    // print('right');
                    // if (peadoBottomModal[index]['right'] == 'select') {
                    //   peadoBottomModal[index]['right'] = 'none';
                    // } else {
                    //   peadoBottomModal[index]['right'] = 'select';
                    // }
                    // this.setState(() {});
                  }, // Image tapped
                  child: Image.asset('assets/images/right.png',
                      // height: peadoBottomModal[index]['right'] != null &&
                      //         peadoBottomModal[index]['right'] == 'select'
                      //     ? 20
                      //     : 18,
                      height: 15,
                      color: peadoBottomModal[index]['right'] != null &&
                              peadoBottomModal[index]['right'] == 'select'
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
              if (peadoBottomModal[index]['down'] == 'select') {
                peadoBottomModal[index]['down'] = 'none';
              } else {
                peadoBottomModal[index]['down'] = 'select';
              }
              var position;
              var select_teeth_no =
                  peadoBottomModal[index]['teeth_no'].toString();

              if (peadoBottomModal[index]['down'] == 'select') {
                if (select_teeth_no == '74' ||
                    select_teeth_no == '75' ||
                    select_teeth_no == '84' ||
                    select_teeth_no == '85' ) {
                  position = 'B';
                } else {
                  position = 'C';
                }

                selectedTeeth.add(SelectedTeethModal(
                    position: position,
                    teeth: peadoBottomModal[index]['teeth_no'].toString()));
              } else {
                var teeth_no = peadoBottomModal[index]['teeth_no'].toString();
                peadoBottomModal[index]['down'] = 'none';
                int delete_index = 0;
                for (var i = 0; i < selectedTeeth.length; i++) {
                  if (selectedTeeth[i].teeth ==
                          peadoBottomModal[index]['teeth_no'] &&
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
              // if (peadoBottomModal[index]['down'] == 'select') {
              //   peadoBottomModal[index]['down'] = 'none';
              // } else {
              //   peadoBottomModal[index]['down'] = 'select';
              // }
              // this.setState(() {});
            }, // Image tapped
            child: Image.asset('assets/images/down.png',
                // height: peadoBottomModal[index]['down'] != null &&
                //         peadoBottomModal[index]['down'] == 'select'
                //     ? 20
                //     : 18,
                height: 15,
                color: peadoBottomModal[index]['down'] != null &&
                        peadoBottomModal[index]['down'] == 'select'
                    ? Colors.blueAccent
                    : Colors.black26),
          ),
        ],
      ),
    );
  }

  clearSelection() {
    peadoTopModal = [
      {'image': 'assets/images/16.png', 'teeth_no': '55'},
      {'image': 'assets/images/17.png', 'teeth_no': '54'},
      {'image': 'assets/images/13.png', 'teeth_no': '53'},
      {'image': 'assets/images/12.png', 'teeth_no': '52'},
      {'image': 'assets/images/11.png', 'teeth_no': '51'},
      {'image': 'assets/images/21.png', 'teeth_no': '61'},
      {'image': 'assets/images/22.png', 'teeth_no': '61'},
      {'image': 'assets/images/23.png', 'teeth_no': '62'},
      {'image': 'assets/images/27.png', 'teeth_no': '63'},
      {'image': 'assets/images/26.png', 'teeth_no': '64'},
    ];
    peadoBottomModal = [
      {'image': 'assets/images/46.png', 'teeth_no': '85'},
      {'image': 'assets/images/47.png', 'teeth_no': '84'},
      {'image': 'assets/images/43.png', 'teeth_no': '83'},
      {'image': 'assets/images/42.png', 'teeth_no': '82'},
      {'image': 'assets/images/41.png', 'teeth_no': '81'},
      {'image': 'assets/images/31.png', 'teeth_no': '71'},
      {'image': 'assets/images/32.png', 'teeth_no': '72'},
      {'image': 'assets/images/33.png', 'teeth_no': '73'},
      {'image': 'assets/images/37.png', 'teeth_no': '74'},
      {'image': 'assets/images/36.png', 'teeth_no': '75'},
    ];
    selectedTeeth.clear();
    this.setState(() {});
    print(selectedTeeth.length);
  }
}
