import 'package:flutter/material.dart';
import 'package:nigdent/Common/colors.dart' as CustomColors;
class PlanSummary extends StatefulWidget {

  const PlanSummary({ super.key });

  @override
  State<PlanSummary> createState() => _PlanSummaryState();
}

class _PlanSummaryState extends State<PlanSummary> {

   late DateTime date;
  bool loading  = false;
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 7),
    end:
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  );


   @override
   Widget build(BuildContext context) {
       double screenHeight = MediaQuery.of(context).size.height -
        50 -
        MediaQuery.of(context).padding.top;
         var screenWidth = MediaQuery.of(context).size.width;
       return Scaffold(
            appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: CustomColors.app_color,
            title: Text('Plan Summary'),
          ),
        ),
           body: Container( 
            height: screenHeight,
            width: screenWidth,
           
            child: Column(
              children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        // borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      height: screenHeight * 0.08,
                      //  height: screenHeight * 0.08,
                      child: renderDatePicker(),
                    ),
              ],
            ),
           
           
           ),


       );
  }

   renderDatePicker() {
    final start = dateRange.start;
    final end = dateRange.end;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // height: ,
     
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: screenWidth / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),
                      onPressed: () {
                        pickDateRange();
                      },
                      child: Text(
                        '${start.year}/${start.month}/${start.day}',
                      ),
                    )),
                Container(
                  width: screenWidth / 6,
                  child: IconButton(
                   color: CustomColors.app_color,
                    onPressed: () {
                      pickDateRange();
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
                Container(
                    width: screenWidth / 3,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.app_color)),
                      onPressed: () {
                        pickDateRange();
                      },
                      child: Text('${end.year}/${end.month}/${end.day}'),
                    )),
              ],
            ),
            
         

          ],
        ),

      
      ),
    );
  }

   Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(2019),
      lastDate: DateTime(2023),
    );
    setState(() {
      dateRange = newDateRange ?? dateRange;

      // if (newDateRange == null) return;
      // setState(() => dateRange = newDateRange);
    });
    // getPendingList();
    this.setState(() {});
  }
}