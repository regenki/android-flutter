import 'package:flutter/material.dart';
import 'package:regenki/Shared/Theme.dart';

class AddInputViewPage extends StatelessWidget {
  //const AddInputViewPage({Key? key}) : super(key: key);
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48, left: 24, right: 24),
      color: Colors.white,
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
                    onPressed: () {},
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

        ],
      ),
    );
  }
}
