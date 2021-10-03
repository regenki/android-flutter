import 'package:flutter/material.dart';
import 'package:regenki/Shared/Theme.dart';

class ActivityViewPage extends StatelessWidget {
  const ActivityViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text(
                "Activity",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 48),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    style: poppinsPrimary.copyWith(fontSize: 14,),
                    decoration: InputDecoration(
                      isCollapsed: true,
                        contentPadding: EdgeInsets.only(left: 16,right: 8,top: 8,bottom: 8),
                        hintText: "Search...",
                        hintStyle: poppinsPrimary,
                        border: OutlineInputBorder(),isDense: true
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Container(
                decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(8)),
                height: MediaQuery.of(context).size.height * 0.06,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:32),
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 64),
                      child: Text("Add Activity",style: poppinstextColor.copyWith(fontSize: 16,fontWeight: FontWeight.w700),),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: Center(
                child: Stack(alignment: Alignment.center,children: [
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      height: 280,
                      child: Image.network(
                          "https://static.wikia.nocookie.net/bandori/images/e/e5/Pessimistic_Girl_Live2D_Model.png/revision/latest/scale-to-width-down/666?cb=20200315175650"),
                    ),
                  ),
                  Positioned(top:240,child: Text("No Activity"))
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
