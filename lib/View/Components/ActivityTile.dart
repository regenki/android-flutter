import 'package:flutter/material.dart';
import 'package:regenki/Shared/Theme.dart';
import 'package:intl/intl.dart';

class ActivityTile extends StatelessWidget {
  final String image;
  final String title;
  final DateTime date;
  final String category;
  ActivityTile(
      {required this.category,
      required this.title,
      required this.date,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,

        decoration: BoxDecoration(border: Border.all(width: 2),borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,right:24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [ Container(
                width: 72,
                height: 72,
                decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
              ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0,bottom: 24,left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        category,
                        style: poppinstextColor.copyWith(
                            color: Color(0xff000000),
                            fontWeight: semibold,
                            fontSize: 20),
                      ),
                      Text(
                        title,
                        style: poppinstextColor.copyWith(
                            color: Color(0xff000000),
                            fontWeight: semibold,
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "${DateFormat("EEE-MMM-yyyy").format(date)}",
                        style: poppinstextColor.copyWith(
                            color: Color(0xff000000),
                            fontWeight: semibold,
                            fontSize: 12),
                      )
                    ],
                  ),
                ),],),

              Text(DateFormat("HH:mm").format(date),style:poppinstextColor.copyWith(
                  color: Color(0xff000000),
                  fontWeight: semibold,
                  fontSize: 28) ,)
            ],
          ),
        ),
      ),
    );
  }
}
