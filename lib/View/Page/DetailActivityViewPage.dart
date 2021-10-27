import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Shared/Theme.dart';

class DetailActivityViewPage extends StatefulWidget {
  final Activity activity;
  DetailActivityViewPage({required this.activity});
  @override
  State<DetailActivityViewPage> createState() => _DetailActivityViewPageState();
}

class _DetailActivityViewPageState extends State<DetailActivityViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.chevron_left,
                color: primaryColor,
                size: 22,
              ),
              Text(
                "Back",
                style: poppinsPrimary.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              child: Image.asset('assets/support/editicon.png'),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      child: Image.asset(
                        "assets/ilustrations/noActivity.png",
                        width: MediaQuery.of(context).size.width,
                        cacheWidth: 260,
                        height: 260,
                        cacheHeight: 260,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.75,
                      top: MediaQuery.of(context).size.height * 0.35,
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: primaryColor),
                        child: Image.asset(widget.activity.sticker),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.activity.category,
                        style: poppinstextColor.copyWith(
                            fontSize: 20,
                            fontWeight: semibold,
                            color: Colors.black),
                      ),
                      Text(
                        widget.activity.title,
                        style: poppinstextColor.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                            color: Colors.black),
                      ),
                      Text(DateFormat("HH.mm EEE,dd-MMM-yyyy")
                          .format(widget.activity.dateTime))
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 48,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          print("e");
                        },
                        child: Text(
                          "Done",
                          style: poppinsWhiteColor.copyWith(
                              fontWeight: semibold, fontSize: 16),
                        )),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 48,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          print("e");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Delete",
                              style: poppinsWhiteColor.copyWith(
                                  fontWeight: semibold, fontSize: 16),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
