import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
import 'AddStaff.dart';

class StaffList extends StatefulWidget {

  const StaffList({ super.key });

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Staff List'),
            backgroundColor: CustomColors.app_color,
             actions: [
          
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddStaff()),
                  );
                },
                // child: Text("New"),
              )
          ],),
           body: Container(),
       );
  }
}