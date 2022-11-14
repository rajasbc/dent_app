import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DashBoardpage extends StatefulWidget {

  const DashBoardpage({ super.key });

  @override
  State<DashBoardpage> createState() => _DashBoardpageState();
}

class _DashBoardpageState extends State<DashBoardpage> {
   final List<String> images = [
    'assets/images/add_customer.png',
    'assets/images/add_test.png',
    'assets/images/sync_data.png',
  ];

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Dashboard'),),
           body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      // aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return GestureDetector(
                        child: Center(
                          child: Image(
                            image: AssetImage(images[index]),
                            fit: BoxFit.contain,
                          ),   
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
          drawer: Drawer(
            elevation: 50,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                   UserAccountsDrawerHeader(
                  accountName: Text('account name'),
                  accountEmail: Text('7362937456'),
                  otherAccountsPictures: <Widget>[
                  ],
                ),
                 ListTile(
                  title: Text('Dashboard'),
                  leading: Icon(Icons.chat_rounded),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoardpage()),
                    );
                  },
                ),
                ],
              ),
            ),            
          ),
       );
  }
}