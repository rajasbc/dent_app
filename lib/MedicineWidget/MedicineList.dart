import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;

import 'AddMedicine.dart';


class Medicine extends StatefulWidget {

  const Medicine({ super.key });

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {

   @override
   Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
       return Scaffold(
           appBar: AppBar(
            backgroundColor: CustomColors.app_color,
            title: const Text('Patient Medicine'),),
           body: Container(
        //  = MediaQuery.of(context).size.width;
            child: SingleChildScrollView(
              child: Column(
                      children: [
                  Container(
                    height: screenheight*0.1,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => AddMedicine())));
                        },
                         
                        icon: Icon(Icons.add),
                        label : Text('Add Medicine'),
                         style: ElevatedButton.styleFrom(
                         primary: CustomColors.app_color 
                      ),
                        ),
                         ElevatedButton.icon(
                          onPressed: (){

                        },
                         
                        icon: Icon(Icons.add),
                        label : Text('Bulk Medicine Payment'),
                        style: ElevatedButton.styleFrom(
                         primary: CustomColors.app_color 
                      ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: screenheight*0.9,
                    // color: Colors.red,
                  )
                ],
              ),
            ),
           ),
       );
  }
}