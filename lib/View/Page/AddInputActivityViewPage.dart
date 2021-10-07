import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Shared/Theme.dart';

class AddInputViewPage extends StatefulWidget {
  //const AddInputViewPage({Key? key}) : super(key: key);
  @override
  State<AddInputViewPage> createState() => _AddInputViewPageState();
}

class _AddInputViewPageState extends State<AddInputViewPage> {
  TextEditingController titleController = TextEditingController();

  String categoryText = "Dancing";
  String stickerText = "assets/images/angry.png";

  DateTime dateData = DateTime.now();
  TimeOfDay timeData = TimeOfDay.now();

  selectDateWidget(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,

        initialDate: dateData,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),helpText: "Find your Activity",);
    if (selected != null && selected != dateData) {
      setState(() {
        dateData = selected;

      });

    }
  }
  selectTimeWidget(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(context: context, initialTime: timeData,helpText: "Set times of your activity"
     );
    if (selected != null && selected != timeData) {
      setState(() {
        timeData = selected;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 48, left: 24, right: 24),
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: poppinsWhiteColor.copyWith(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w700),
                      )),
                  TextButton(
                      onPressed: () {

                      },
                      child: Text(
                        "Save",
                        style: poppinsWhiteColor.copyWith(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Title"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: poppinstextColor.copyWith(
                      color: Colors.black, fontSize: 16),
                ),
                DropdownButton<String>(
                  onChanged: (String? value) {
                    setState(() {
                      categoryText = value!;
                    });

                  },
                  items: <String>[
                    "Dancing",
                    "Walking",
                    "Cleaning",
                    "Running",
                    "Gaming",
                    "Learning",
                    "Working",
                    "Others"
                  ].map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: categoryText,
                )
              ],
            ),
            categoryText == "Others" ? TextField(
              decoration: InputDecoration(hintText: "Category"),
            ) : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date Activity"),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      selectDateWidget(context);
                    },
                    child: Text(
                        "${dateData.day}/${dateData.month}/${dateData.year}",style: poppinstextColor,))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Time Activity"),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      selectTimeWidget(context);
                    },
                    child: Text(
                        "${timeData.hour}:${timeData.minute}",style: poppinstextColor,))
              ],
            ),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Category",
                  style: poppinstextColor.copyWith(
                      color: Colors.black, fontSize: 16),
                ),
                DropdownButton<String>(
                  onChanged: (String? value) {
                    setState(() {
                      stickerText = value!;

                    });

                  },
                  items: <String>[
                    "assets/images/angry.png",
                    "assets/images/confused.png",
                    "assets/images/fear.png",
                    "assets/images/gatcha.png",
                    "assets/images/happy.png",
                    "assets/images/micdrop.png",
                    "assets/images/no.png",
                    "assets/images/peace.png",
                    "assets/images/smile.png",
                    "assets/images/twink.png"
                  ].map<DropdownMenuItem<String>>((String e) {
                    return DropdownMenuItem(value: e, child: SizedBox(width: 48,height: 48,child: Image.asset(e),));
                  }).toList(),
                  value: stickerText,
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
