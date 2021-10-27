import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:regenki/Bloc/Notification/NotificationServiceCubit.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Service/NotificationService.dart';
import 'package:regenki/Shared/Theme.dart';
import 'package:regenki/Bloc/Activity/ActivityServiceCubit.dart';

class AddInputViewPage extends StatefulWidget {
  //const AddInputViewPage({Key? key}) : super(key: key);
  @override
  State<AddInputViewPage> createState() => _AddInputViewPageState();
}

class _AddInputViewPageState extends State<AddInputViewPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController categotyController = TextEditingController();

  String categoryText = "Dancing";
  String stickerText = "assets/images/angry.png";

  DateTime dateData = DateTime.now();
  TimeOfDay timeData = TimeOfDay.now();



  selectDateWidget(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: dateData,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: "Find your Activity",
    );
    if (selected != null && selected != dateData) {
      setState(() {
        dateData = selected;
      });
    }
  }

  selectTimeWidget(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
        context: context,
        initialTime: timeData,
        helpText: "Set times of your activity");
    if (selected != null && selected != timeData) {
      setState(() {
        timeData = selected;
      });
    }
  }

  Widget saveActivityButton(BuildContext context) {
    return BlocBuilder<ActivityServiceCubit, ActivityServiceState>(
        builder: (context, state) {
      return TextButton(
          onPressed: () async {
            var activity = Activity(
                title: titleController.text,
                dateTime: DateTime(dateData.year, dateData.month,
                    dateData.day, timeData.hour, timeData.minute),
                category: categoryText,
                sticker: stickerText);
            NotificationService().createNotification(activity);
            setState(() {

              if (categoryText == "Others")

              print(activity);
              //context.read<NotificationServiceCubit>().add(activity);

              context.read<ActivityServiceCubit>().insertData(activity);
            });


            Navigator.pop(context);
          },
          child: Text(
            "Save",
            style: poppinstextColor.copyWith(
                fontSize: 14, color: Colors.green, fontWeight: FontWeight.w700),
          ));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    titleController.dispose();
    categotyController.dispose();
    super.dispose();
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: poppinsWhiteColor.copyWith(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w700),
                      )),
                  saveActivityButton(context)
                ],
              ),
            ),
            TextField(
              controller: titleController,
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
            categoryText == "Others"
                ? TextField(
                    decoration: InputDecoration(hintText: "Category"),
                  )
                : SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date Activity"),
                Row(
                  children: [
                    Image.asset("assets/support/dateicon.png",width: 56,height: 56,),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: primaryColor),
                        onPressed: () {
                          selectDateWidget(context);
                        },
                        child: Text(
                          "${dateData.day}/${dateData.month}/${dateData.year}",
                          style: poppinstextColor,
                        )),
                  ],
                )
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
                      "${timeData.hour}:${timeData.minute}",
                      style: poppinstextColor,
                    ))
              ],
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
                    return DropdownMenuItem(
                        value: e,
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: Image.asset(e),
                        ));
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
